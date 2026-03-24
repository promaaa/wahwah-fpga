--------------------------------------------------------------------------------
-- wahwah_control.vhd — Contrôleur LFO + FSM principale (Machine d'état unique)
--
-- Ce module contient :
--   - Accumulateur de phase 32 bits pour le LFO
--   - Compteur de pas de fréquence pour ajuster la fréquence centrale
--     en réponse aux boutons freq_up / freq_down
--   - FSM unique pour orchestrer le filtrage biquad
--
-- La partie opérative (wahwah_operative) est désormais purement combinatoire
-- (chemin de données) et ne contient plus de machine d'état.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wahwah_control is
  port (
    I_clock             : in  std_logic;
    I_reset             : in  std_logic;
    I_inputSampleValid  : in  std_logic;
    -- Sélection vitesse LFO (3 bits → 8 vitesses possibles)
    I_lfo_speed_sel     : in  std_logic_vector(2 downto 0);
    I_freq_up           : in  std_logic := '0';
    I_freq_down         : in  std_logic := '0';
    -- Sorties vers la partie opérative
    O_lfo_addr          : out std_logic_vector(7 downto 0);
    O_lfo_incr          : out unsigned(31 downto 0);
    -- Signaux de contrôle du chemin de données
    O_filterStart       : out std_logic;  -- Démarre le filtrage
    O_coef_we           : out std_logic;  -- Write enable pour coef (inutilisé mais gardé)
    O_mac_start         : out std_logic;  -- Démarre le MAC
    O_mac_stage         : out std_logic_vector(2 downto 0);  -- Stage MAC (0-4)
    O_x_data            : out signed(15 downto 0);  -- x[n] à filtrer
    O_y_z1_data         : out signed(15 downto 0);  -- y[n-1]
    O_y_z2_data         : out signed(15 downto 0);  -- y[n-2]
    I_y_result          : in  signed(15 downto 0);  -- Résultat y[n]
    O_y_we              : out std_logic;  -- Write enable pour y result
    O_filteredValid     : out std_logic   -- Sortie filtrée valide
  );
end entity wahwah_control;

architecture arch_wahwah_control of wahwah_control is

  -- ════════════════════════════════════════════════════════════
  -- Constantes : incréments de phase LFO pour différentes fréquences
  --
  -- Formule : incr = round(f_lfo * 2^32 / fs)
  -- avec fs = 48 000 Hz
  -- ════════════════════════════════════════════════════════════
  type lfo_incr_rom_t is array(0 to 7) of unsigned(31 downto 0);
  constant LFO_INCR_ROM : lfo_incr_rom_t := (
    to_unsigned(  89478, 32),   -- 0 : 1.0 Hz
    to_unsigned( 178957, 32),   -- 1 : 2.0 Hz
    to_unsigned( 268435, 32),   -- 2 : 3.0 Hz
    to_unsigned( 357914, 32),   -- 3 : 4.0 Hz
    to_unsigned( 447392, 32),   -- 4 : 5.0 Hz
    to_unsigned( 581610, 32),   -- 5 : 6.5 Hz
    to_unsigned( 715828, 32),   -- 6 : 8.0 Hz
    to_unsigned( 894785, 32)    -- 7 : 10.0 Hz
  );

  -- ════════════════════════════════════════════════════════════
  -- Registres LFO
  -- ════════════════════════════════════════════════════════════
  signal SR_lfo_phase     : unsigned(31 downto 0) := (others => '0');
  signal SR_center_offset : unsigned(7 downto 0)  := (others => '0');
  signal SR_freq_step_cnt : unsigned(9 downto 0)  := (others => '0');

  -- Signaux intermédiaires
  signal SC_lfo_addr_base : unsigned(7 downto 0);
  signal SC_lfo_incr     : unsigned(31 downto 0);

  -- ════════════════════════════════════════════════════════════
  -- Registres de la FSM de filtrage
  -- ════════════════════════════════════════════════════════════
  type state_t is (
    S_IDLE,     -- Attente d'un nouvel échantillon
    S_LOAD,     -- Capture de x[n], mise en place du 1er produit
    S_MAC0,     -- acc  = b0 * x[n]
    S_MAC1,     -- acc -= b0 * x[n-2]   (car b2 = -b0)
    S_MAC2,     -- acc += (-a1) * y[n-1]
    S_MAC3,     -- acc += (-a2) * y[n-2]
    S_STORE,    -- Extraction / saturation du résultat
    S_DONE      -- Signaler la validité de la sortie
  );
  signal SR_fsm_state : state_t;

  -- Registres à retard pour le filtrage
  signal SR_x_z1 : signed(15 downto 0);  -- x[n-1]
  signal SR_x_z2 : signed(15 downto 0);  -- x[n-2]
  signal SR_y_z1 : signed(15 downto 0);  -- y[n-1]
  signal SR_y_z2 : signed(15 downto 0);  -- y[n-2]
  signal SR_x_n  : signed(15 downto 0);  -- x[n] échantillon courant

  -- Accumulateur pour le MAC
  signal SR_acc  : signed(35 downto 0);

  -- Registre résultat
  signal SR_y_out    : signed(15 downto 0);
  signal SR_y_valid  : std_logic;

begin

  -- ────────────────────────────────────────────────────────────
  -- Sélection de l'incrément LFO selon les switches
  -- ────────────────────────────────────────────────────────────
  SC_lfo_incr <= LFO_INCR_ROM(to_integer(unsigned(I_lfo_speed_sel)));

  -- ────────────────────────────────────────────────────────────
  -- LFO : accumulateur de phase 32 bits
  -- ────────────────────────────────────────────────────────────
  process (I_clock, I_reset)
  begin
    if I_reset = '1' then
      SR_lfo_phase     <= (others => '0');
      SR_center_offset <= (others => '0');
      SR_freq_step_cnt <= (others => '0');
    elsif rising_edge(I_clock) then
      if I_inputSampleValid = '1' then
        SR_lfo_phase <= SR_lfo_phase + SC_lfo_incr;

        if I_freq_up /= I_freq_down then
          if SR_freq_step_cnt = to_unsigned(1023, SR_freq_step_cnt'length) then
            SR_freq_step_cnt <= (others => '0');
            if I_freq_up = '1' then
              SR_center_offset <= SR_center_offset + 1;
            else
              SR_center_offset <= SR_center_offset - 1;
            end if;
          else
            SR_freq_step_cnt <= SR_freq_step_cnt + 1;
          end if;
        else
          SR_freq_step_cnt <= (others => '0');
        end if;
      end if;
    end if;
  end process;

  -- Les 8 bits de poids fort du phase accumulator → adresse ROM
  SC_lfo_addr_base <= SR_lfo_phase(31 downto 24);

  -- Sorties LFO
  O_lfo_addr <= std_logic_vector(SC_lfo_addr_base + SR_center_offset);
  O_lfo_incr <= SC_lfo_incr;

  -- ────────────────────────────────────────────────────────────
  -- FSM principale pour le filtrage biquad
  -- ────────────────────────────────────────────────────────────
  process (I_clock, I_reset)
    variable V_acc_shifted : signed(35 downto 0);
  begin
    if I_reset = '1' then
      SR_fsm_state <= S_IDLE;
      SR_x_z1      <= (others => '0');
      SR_x_z2      <= (others => '0');
      SR_y_z1      <= (others => '0');
      SR_y_z2      <= (others => '0');
      SR_x_n       <= (others => '0');
      SR_acc       <= (others => '0');
      SR_y_out     <= (others => '0');
      SR_y_valid   <= '0';

    elsif rising_edge(I_clock) then
      -- Par défaut, valid est bas
      SR_y_valid <= '0';

      case SR_fsm_state is

        -- ░░ IDLE ░░ Attente d'un nouvel échantillon ░░
        when S_IDLE =>
          if I_inputSampleValid = '1' then
            SR_fsm_state <= S_LOAD;
          end if;

        -- ░░ LOAD ░░ Capture x[n] ░░
        when S_LOAD =>
          SR_x_n <= signed(I_inputSample);
          SR_fsm_state <= S_MAC0;

        -- ░░ MAC0 ░░ acc = b0 × x[n] (fait combinatoirement via operative) ░░
        when S_MAC0 =>
          SR_fsm_state <= S_MAC1;

        -- ░░ MAC1 ░░ acc -= b0 × x[n-2] ░░
        when S_MAC1 =>
          SR_fsm_state <= S_MAC2;

        -- ░░ MAC2 ░░ acc += (-a1) × y[n-1] ░░
        when S_MAC2 =>
          SR_fsm_state <= S_MAC3;

        -- ░░ MAC3 ░░ acc += (-a2) × y[n-2] ░░
        when S_MAC3 =>
          SR_fsm_state <= S_STORE;

        -- ░░ STORE ░░ Extraction du résultat + saturation ░░
        when S_STORE =>
          V_acc_shifted := shift_right(SR_acc, 14);  -- FRAC_BITS = 14

          if V_acc_shifted > to_signed(32767, 36) then
            SR_y_out <= to_signed(32767, 16);
          elsif V_acc_shifted < to_signed(-32768, 36) then
            SR_y_out <= to_signed(-32768, 16);
          else
            SR_y_out <= V_acc_shifted(15 downto 0);
          end if;

          -- Mise à jour des registres à retard
          SR_x_z2 <= SR_x_z1;
          SR_x_z1 <= SR_x_n;
          SR_y_z2 <= SR_y_z1;

          SR_y_valid <= '1';
          SR_fsm_state <= S_DONE;

        -- ░░ DONE ░░ Mise à jour y[n-1] et retour IDLE ░░
        when S_DONE =>
          SR_y_z1 <= SR_y_out;
          if I_inputSampleValid = '0' then
            SR_fsm_state <= S_IDLE;
          end if;

        when others =>
          SR_fsm_state <= S_IDLE;

      end case;
    end if;
  end process;

  -- ────────────────────────────────────────────────────────────
  -- Sorties de contrôle
  -- ────────────────────────────────────────────────────────────
  O_filterStart  <= '1' when SR_fsm_state = S_LOAD else '0';
  O_coef_we      <= '0';
  O_mac_start    <= '1' when SR_fsm_state = S_MAC0 else '0';
  
  with SR_fsm_state select O_mac_stage <=
    "001" when S_MAC0,
    "010" when S_MAC1,
    "011" when S_MAC2,
    "100" when S_MAC3,
    "000" when others;

  O_x_data    <= SR_x_n;
  O_y_z1_data <= SR_y_z1;
  O_y_z2_data <= SR_y_z2;
  O_y_we      <= '1' when SR_fsm_state = S_STORE else '0';
  O_filteredValid <= SR_y_valid;

end architecture arch_wahwah_control;