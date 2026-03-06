-------------------------------------------------------------------------------
-- wahwahUnit.vhd — Unité wah-wah complète
--
-- Connecte les deux blocs matériels distincts :
--   BLOC 1 : Calcul des coefficients  (LFO → ROM de coefficients)
--   BLOC 2 : Equation de filtrage      (biquad DF1 séquentiel)
--
-- Le LFO est un accumulateur de phase 32 bits dont les 8 bits de poids
-- fort indexent la ROM de 256 entrées.  La ROM encode directement la
-- trajectoire sinusoïdale avec balayage exponentiel : chaque adresse
-- correspond à un jeu de coefficients (b0, -a1, -a2) en Q1.22.
--
-- La vitesse du LFO est sélectionnable via I_lfo_speed_sel (3 bits,
-- 8 vitesses de 1.0 Hz à 10.0 Hz).
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wahwahUnit is
  port (
    I_clock               : in  std_logic;
    I_reset               : in  std_logic;
    I_inputSample         : in  std_logic_vector(23 downto 0);
    I_inputSampleValid    : in  std_logic;
    -- Sélection vitesse LFO (3 bits → 8 vitesses possibles)
    I_lfo_speed_sel       : in  std_logic_vector(2 downto 0);
    -- Mode manuel type pédale : adresse ROM imposée par potentiomètre
    I_manual_mode         : in  std_logic;
    I_manual_addr         : in  std_logic_vector(7 downto 0);
    O_filteredSample      : out std_logic_vector(23 downto 0);
    O_filteredSampleValid : out std_logic
  );
end entity wahwahUnit;

architecture arch_wahwahUnit of wahwahUnit is

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
  -- Signaux internes
  -- ════════════════════════════════════════════════════════════

  -- LFO : accumulateur de phase
  signal SR_lfo_phase : unsigned(31 downto 0) := (others => '0');
  signal SC_lfo_addr  : std_logic_vector(7 downto 0);
  signal SC_lfo_incr  : unsigned(31 downto 0);
  signal SC_coeff_addr: std_logic_vector(7 downto 0);

  -- Coefficients issus de la ROM (BLOC 1)
  signal SC_b0     : signed(23 downto 0);
  signal SC_neg_a1 : signed(23 downto 0);
  signal SC_neg_a2 : signed(23 downto 0);

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
      SR_lfo_phase <= (others => '0');
    elsif rising_edge(I_clock) then
      if I_inputSampleValid = '1' then
        SR_lfo_phase <= SR_lfo_phase + SC_lfo_incr;
      end if;
    end if;
  end process;

  -- Les 8 bits de poids fort du phase accumulator → adresse ROM
  SC_lfo_addr <= std_logic_vector(SR_lfo_phase(31 downto 24));
  -- En mode manuel, l'adresse ROM est pilotée par le potentiomètre
  SC_coeff_addr <= I_manual_addr when I_manual_mode = '1' else SC_lfo_addr;

  -- ════════════════════════════════════════════════════════════
  -- BLOC MATERIEL 1 : Calcul des coefficients (ROM combinatoire)
  -- ════════════════════════════════════════════════════════════
  coeff_rom_inst : entity work.wahwah_coeff_rom
    port map (
      I_address => SC_coeff_addr,
      O_b0      => SC_b0,
      O_neg_a1  => SC_neg_a1,
      O_neg_a2  => SC_neg_a2
    );

  -- ════════════════════════════════════════════════════════════
  -- BLOC MATERIEL 2 : Equation de filtrage (biquad DF1)
  -- ════════════════════════════════════════════════════════════
  biquad_inst : entity work.wahwah_biquad
    generic map (
      FRAC_BITS => 22
    )
    port map (
      I_clock               => I_clock,
      I_reset               => I_reset,
      I_inputSample         => I_inputSample,
      I_inputSampleValid    => I_inputSampleValid,
      I_b0                  => SC_b0,
      I_neg_a1              => SC_neg_a1,
      I_neg_a2              => SC_neg_a2,
      O_filteredSample      => O_filteredSample,
      O_filteredSampleValid => O_filteredSampleValid
    );

end architecture arch_wahwahUnit;
