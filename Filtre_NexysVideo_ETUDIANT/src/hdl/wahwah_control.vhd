--------------------------------------------------------------------------------
-- wahwah_control.vhd — Contrôleur LFO (Machine d'état)
--
-- Partie contrôle du module wah-wah :
--   - Accumulateur de phase 32 bits pour le LFO
--   - Compteur de pas de fréquence pour ajuster la fréquence centrale
--     en réponse aux boutons freq_up / freq_down
--
-- Ce module génère les signaux de contrôle pour la partie opérative
-- (wahwah_operative) qui gère le filtrage.
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
    O_lfo_incr          : out unsigned(31 downto 0)
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
  -- Registres internes
  -- ════════════════════════════════════════════════════════════
  signal SR_lfo_phase     : unsigned(31 downto 0) := (others => '0');
  signal SR_center_offset : unsigned(7 downto 0)  := (others => '0');
  signal SR_freq_step_cnt : unsigned(9 downto 0)  := (others => '0');

  -- Signaux intermédiaires
  signal SC_lfo_addr_base : unsigned(7 downto 0);
  signal SC_lfo_incr     : unsigned(31 downto 0);

begin

  -- ────────────────────────────────────────────────────────────
  -- Sélection de l'incrément LFO selon les switches
  -- ────────────────────────────────────────────────────────────
  SC_lfo_incr <= LFO_INCR_ROM(to_integer(unsigned(I_lfo_speed_sel)));

  -- ────────────────────────────────────────────────────────────
  -- LFO : accumulateur de phase 32 bits
  -- Avance d'un incrément à chaque nouvel échantillon audio
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

  -- Sorties
  O_lfo_addr <= std_logic_vector(SC_lfo_addr_base + SR_center_offset);
  O_lfo_incr <= SC_lfo_incr;

end architecture arch_wahwah_control;