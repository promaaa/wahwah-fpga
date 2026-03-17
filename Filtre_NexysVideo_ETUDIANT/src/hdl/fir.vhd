library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library xil_defaultlib;

entity fir is

  generic (
    dwidth : natural := 24;
    ntaps  : natural := 15);

  port (
    din          : in  std_logic_vector(dwidth-1 downto 0);
    dout         : out std_logic_vector(dwidth-1 downto 0);
    config_sw    : in  std_logic_vector(4 downto 0);  --inutilise dans le TP majeure
    pot_pos      : in  std_logic_vector(7 downto 0);  -- position potentiomètre (XADC)
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
-- Chemin de données interne : 24 bits signés (chaîne audio complète)
-- config_sw(4)     : bypass (0 = dry, 1 = wah-wah)
-- config_sw(2..0)  : vitesse du LFO (0.5 – 5.0 Hz)
-- config_sw(3)     : mode manuel (1 = pédale/pot, 0 = LFO auto)
-- ═══════════════════════════════════════════════════════════════════

architecture wahwah_arch of fir is

  component wahwahUnit is
    port (
      I_clock               : in  std_logic;
      I_reset               : in  std_logic;
      I_inputSample         : in  std_logic_vector(23 downto 0);
      I_inputSampleValid    : in  std_logic;
      I_lfo_speed_sel       : in  std_logic_vector(2 downto 0);
      I_manual_mode         : in  std_logic;
      I_manual_addr         : in  std_logic_vector(7 downto 0);
      O_filteredSample      : out std_logic_vector(23 downto 0);
      O_filteredSampleValid : out std_logic
    );
  end component;

  for all : wahwahUnit use entity xil_defaultlib.wahwahUnit(arch_wahwahUnit);

  -- Signaux audio 24 bits internes
  signal D_in        : std_logic_vector(23 downto 0);
  signal D_out       : std_logic_vector(23 downto 0);
  signal D_out_makeup: std_logic_vector(23 downto 0);
  signal S_out_valid : std_logic;
  signal SR_wet_ready: std_logic := '0';

begin

  -- Chemin direct en 24 bits
  D_in <= din(dwidth-1 downto dwidth-24);

  -- ── BLOC WAH-WAH (LFO + ROM coefficients + biquad DF1) ──────────
  wahwah_inst : wahwahUnit
    port map (
      I_clock               => clk,
      I_reset               => rst,
      I_inputSample         => D_in,
      I_inputSampleValid    => ce,
      I_lfo_speed_sel       => config_sw(2 downto 0),
      I_manual_mode         => config_sw(3),
      I_manual_addr         => pot_pos,
      O_filteredSample      => D_out,
      O_filteredSampleValid => S_out_valid
    );

  process(clk, rst)
  begin
    if rst = '1' then
      SR_wet_ready <= '0';
    elsif rising_edge(clk) then
      if S_out_valid = '1' then
        SR_wet_ready <= '1';
      end if;
    end if;
  end process;

  -- Compensation de niveau après le passe-bande wah-wah : gain fixe +6 dB (x2)
  -- avec saturation 16 bits pour éviter l'écrêtage numérique violent.
  process(D_out)
    variable v_in  : signed(23 downto 0);
    variable v_amp : signed(25 downto 0);
  begin
    v_in  := signed(D_out);
    v_amp := shift_left(resize(v_in, 26), 1);  -- x2

    if v_amp > to_signed(8388607, 26) then
      D_out_makeup <= std_logic_vector(to_signed(8388607, 24));
    elsif v_amp < to_signed(-8388608, 26) then
      D_out_makeup <= std_logic_vector(to_signed(-8388608, 24));
    else
      D_out_makeup <= std_logic_vector(v_amp(23 downto 0));
    end if;
  end process;

  -- Sortie : bypass ou signal filtré (config_sw(4) active l'effet)
  dout(dwidth-1 downto dwidth-24) <= D_out_makeup when (config_sw(4) = '1' and SR_wet_ready = '1') else D_in;

  -- Sorties de debug inutilisées en mode wah-wah
  dbg_output_0 <= (others => '0');
  dbg_output_1 <= (others => '0');
  dbg_output_2 <= '0';
  dbg_output_3 <= '0';
  dbg_output_4 <= '0';

end wahwah_arch;
