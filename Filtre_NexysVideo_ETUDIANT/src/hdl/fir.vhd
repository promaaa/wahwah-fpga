library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fir is

  generic (
    dwidth : natural := 18;
    ntaps  : natural := 15);

  port (
    din          : in  std_logic_vector(dwidth-1 downto 0);
    dout         : out std_logic_vector(dwidth-1 downto 0);
    config_sw    : in  std_logic_vector(4 downto 0);  --inutilise dans le TP majeure
    clk          : in  std_logic;
    rst          : in  std_logic;
    ce           : in  std_logic;  -- signal de validation de din a la frequence des echantillons audio
    dbg_output_0 : out std_logic_vector(7 downto 0);  --inutilise dans le TP majeure
    dbg_output_1 : out std_logic_vector(7 downto 0);  --inutilise dans le TP majeure
    dbg_output_2 : out std_logic;       --inutilise dans le TP majeure
    dbg_output_3 : out std_logic;       --inutilise dans le TP majeure
    dbg_output_4 : out std_logic       --inutilise dans le TP majeure
--    dout_valid   : out std_logic
    );

end fir;

-- ═══════════════════════════════════════════════════════════════════
-- Architecture WAH-WAH  (remplace l'ancien FIR 8 bits)
--
-- Chemin de données interne : 16 bits signés (meilleur SNR pour l'IIR)
-- config_sw(4)     : bypass (0 = dry, 1 = wah-wah)
-- config_sw(2..0)  : vitesse du LFO (0.5 – 5.0 Hz)
-- ═══════════════════════════════════════════════════════════════════

architecture wahwah_arch of fir is

  component wahwahUnit is
    port (
      I_clock               : in  std_logic;
      I_reset               : in  std_logic;
      I_inputSample         : in  std_logic_vector(15 downto 0);
      I_inputSampleValid    : in  std_logic;
      I_lfo_speed_sel       : in  std_logic_vector(2 downto 0);
      O_filteredSample      : out std_logic_vector(15 downto 0);
      O_filteredSampleValid : out std_logic
    );
  end component;

  -- Signaux audio 16 bits internes
  signal D_in  : std_logic_vector(15 downto 0);
  signal D_out : std_logic_vector(15 downto 0);

begin

  -- Extraction des 16 bits de poids fort de l'entrée I2S (24 bits → 16 bits)
  D_in <= din(dwidth-1 downto dwidth-16);

  -- ── BLOC WAH-WAH (LFO + ROM coefficients + biquad DF1) ──────────
  wahwah_inst : wahwahUnit
    port map (
      I_clock               => clk,
      I_reset               => rst,
      I_inputSample         => D_in,
      I_inputSampleValid    => ce,
      I_lfo_speed_sel       => config_sw(2 downto 0),
      O_filteredSample      => D_out,
      O_filteredSampleValid => open
    );

  -- Sortie : bypass ou signal filtré (config_sw(4) active l'effet)
  dout(dwidth-1 downto dwidth-16) <= D_out when config_sw(4) = '1' else D_in;
  dout(dwidth-17 downto 0)        <= (others => '0');

  -- Sorties de debug inutilisées en mode wah-wah
  dbg_output_0 <= (others => '0');
  dbg_output_1 <= (others => '0');
  dbg_output_2 <= '0';
  dbg_output_3 <= '0';
  dbg_output_4 <= '0';

end wahwah_arch;
