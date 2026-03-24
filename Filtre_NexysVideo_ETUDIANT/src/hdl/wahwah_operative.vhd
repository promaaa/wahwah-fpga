--------------------------------------------------------------------------------
-- wahwah_operative.vhd — Partie opérative purely combinatoire (Data-path)
--
-- Ce module est désormais purement combinatoire (pas de machine d'état).
-- Il effectue les calculs du filtre biquad sous contrôle de la FSM
-- située dans wahwah_control.
--
-- Opérations :
--   - ROM de coefficients (coef b0, -a1, -a2 en Q1.14)
--   - Multiplieur pour les produits du MAC
--   - Accumulateur 36 bits pour les opérations MAC
--
-- La FSM dans wahwah_control orchestre ces opérations en quatre cycles.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wahwah_operative is
  generic (
    FRAC_BITS : natural := 14  -- nombre de bits fractionnaires (Q1.14)
  );
  port (
    I_clock               : in  std_logic;
    I_reset               : in  std_logic;
    I_inputSample         : in  std_logic_vector(15 downto 0);
    I_inputSampleValid    : in  std_logic;
    -- Adresse LFO来自于 la partie contrôle
    I_lfo_addr            : in  std_logic_vector(7 downto 0);
    -- Signaux de contrôle depuis la FSM (wahwah_control)
    I_mac_stage           : in  std_logic_vector(2 downto 0);  -- Stage MAC (0-4)
    I_x_data              : in  signed(15 downto 0);   -- x[n]
    I_y_z1_data           : in  signed(15 downto 0);   -- y[n-1]
    I_y_z2_data           : in  signed(15 downto 0);   -- y[n-2]
    -- Accumulateur (venant du registre dans control ou local)
    I_acc                 : in  signed(35 downto 0);
    -- Sorties
    O_acc_out             : out signed(35 downto 0);  -- Accumulateur mis à jour
    O_filteredSample      : out std_logic_vector(15 downto 0);
    O_filteredSampleValid : out std_logic
  );
end entity wahwah_operative;

architecture arch_wahwah_operative of wahwah_operative is

  -- ════════════════════════════════════════════════════════════
  -- Coefficients issus de la ROM
  -- ════════════════════════════════════════════════════════════
  signal SC_b0     : signed(15 downto 0);
  signal SC_neg_a1 : signed(15 downto 0);
  signal SC_neg_a2 : signed(15 downto 0);

  -- ════════════════════════════════════════════════════════════
  -- Signaux internes pour le MAC
  -- ════════════════════════════════════════════════════════════
  signal SC_mult_a    : signed(15 downto 0);
  signal SC_mult_b    : signed(15 downto 0);
  signal SC_mult_out  : signed(31 downto 0);

  -- Registre accumulateur (séquentiel)
  signal SR_acc       : signed(35 downto 0);

  -- Résultat filtré
  signal SR_y_out     : signed(15 downto 0);
  signal SR_y_valid   : std_logic;

begin

  -- ────────────────────────────────────────────────────────────
  -- BLOC 1 : ROM de coefficients (combinatoire)
  -- ────────────────────────────────────────────────────────────
  coeff_rom_inst : entity work.wahwah_coeff_rom
    port map (
      I_address => I_lfo_addr,
      O_b0      => SC_b0,
      O_neg_a1  => SC_neg_a1,
      O_neg_a2  => SC_neg_a2
    );

  -- ────────────────────────────────────────────────────────────
  -- BLOC 2 : Sélection des opérandes selon stage MAC
  -- ────────────────────────────────────────────────────────────
  with I_mac_stage select SC_mult_a <=
    SC_b0     when "001",  -- MAC0: b0 * x[n]
    SC_b0     when "010",  -- MAC1: b0 * x[n-2]
    SC_neg_a1 when "011",  -- MAC2: (-a1) * y[n-1]
    SC_neg_a2 when "100",  -- MAC3: (-a2) * y[n-2]
    (others => '0') when others;

  with I_mac_stage select SC_mult_b <=
    I_x_data    when "001",  -- MAC0: b0 * x[n]
    I_y_z2_data when "010",  -- MAC1: b0 * x[n-2]
    I_y_z1_data when "011",  -- MAC2: (-a1) * y[n-1]
    I_y_z2_data when "100",  -- MAC3: (-a2) * y[n-2]
    (others => '0') when others;

  -- ────────────────────────────────────────────────────────────
  -- BLOC 3 : Multiplieur (DSP48)
  -- ────────────────────────────────────────────────────────────
  SC_mult_out <= SC_mult_a * SC_mult_b;

  -- ────────────────────────────────────────────────────────────
  -- BLOC 4 : Accumulateur séquentiel
  -- ────────────────────────────────────────────────────────────
  process (I_clock, I_reset)
  begin
    if I_reset = '1' then
      SR_acc <= (others => '0');
    elsif rising_edge(I_clock) then
      if I_mac_stage = "001" then  -- MAC0: initialisation
        SR_acc <= resize(SC_mult_out, 36);
      elsif I_mac_stage = "010" then  -- MAC1: soustraction
        SR_acc <= SR_acc - resize(SC_mult_out, 36);
      elsif I_mac_stage = "011" then  -- MAC2: addition
        SR_acc <= SR_acc + resize(SC_mult_out, 36);
      elsif I_mac_stage = "100" then  -- MAC3: addition finale
        SR_acc <= SR_acc + resize(SC_mult_out, 36);
      end if;
    end if;
  end process;

  O_acc_out <= SR_acc;

  -- ────────────────────────────────────────────────────────────
  -- BLOC 5 : Extraction et saturation du résultat
  -- ────────────────────────────────────────────────────────────
  process (I_clock, I_reset)
    variable V_acc_shifted : signed(35 downto 0);
  begin
    if I_reset = '1' then
      SR_y_out   <= (others => '0');
      SR_y_valid <= '0';
    elsif rising_edge(I_clock) then
      SR_y_valid <= '0';
      
      if I_mac_stage = "000" then  -- État IDLE ou STORE terminé
        -- Calcul du résultat (un cycle après STORE)
        V_acc_shifted := shift_right(SR_acc, FRAC_BITS);
        
        if V_acc_shifted > to_signed(32767, 36) then
          SR_y_out <= to_signed(32767, 16);
        elsif V_acc_shifted < to_signed(-32768, 36) then
          SR_y_out <= to_signed(-32768, 16);
        else
          SR_y_out <= V_acc_shifted(15 downto 0);
        end if;
        
        SR_y_valid <= '1';
      end if;
    end if;
  end process;

  -- ────────────────────────────────────────────────────────────
  -- Sorties
  -- ────────────────────────────────────────────────────────────
  O_filteredSample      <= std_logic_vector(SR_y_out);
  O_filteredSampleValid <= SR_y_valid;

end architecture arch_wahwah_operative;