library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fir is

  generic (
    dwidth : natural := 24;
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
-- Chemin de données interne : 24 bits signés (chaîne audio complète)
-- config_sw(4)     : bypass (0 = dry, 1 = wah-wah)
-- config_sw(2..0)  : vitesse du LFO (0.5 – 5.0 Hz)
-- ═══════════════════════════════════════════════════════════════════

architecture wahwah_arch of fir is

  type lfo_incr_rom_t is array(0 to 7) of unsigned(31 downto 0);
  constant LFO_INCR_ROM : lfo_incr_rom_t := (
    to_unsigned(  89478, 32),
    to_unsigned( 178957, 32),
    to_unsigned( 268435, 32),
    to_unsigned( 357914, 32),
    to_unsigned( 447392, 32),
    to_unsigned( 581610, 32),
    to_unsigned( 715828, 32),
    to_unsigned( 894785, 32)
  );

  -- Signaux audio 24 bits internes
  signal D_in        : std_logic_vector(23 downto 0);
  signal D_out       : std_logic_vector(23 downto 0);
  signal D_out_makeup: std_logic_vector(23 downto 0);
  signal S_out_valid : std_logic;
  signal SR_wet_ready: std_logic := '0';

  signal SR_lfo_phase : unsigned(31 downto 0) := (others => '0');
  signal SC_lfo_addr  : std_logic_vector(7 downto 0);
  signal SC_lfo_incr  : unsigned(31 downto 0);
  signal SC_b0        : signed(23 downto 0);
  signal SC_neg_a1    : signed(23 downto 0);
  signal SC_neg_a2    : signed(23 downto 0);

begin

  -- Chemin direct en 24 bits
  D_in <= din(dwidth-1 downto dwidth-24);

  SC_lfo_incr <= LFO_INCR_ROM(to_integer(unsigned(config_sw(2 downto 0))));

  process(clk, rst)
  begin
    if rst = '1' then
      SR_lfo_phase <= (others => '0');
    elsif rising_edge(clk) then
      if ce = '1' then
        SR_lfo_phase <= SR_lfo_phase + SC_lfo_incr;
      end if;
    end if;
  end process;

  SC_lfo_addr <= std_logic_vector(SR_lfo_phase(31 downto 24));

  coeff_rom_inst : entity work.wahwah_coeff_rom
    port map (
      I_address => SC_lfo_addr,
      O_b0      => SC_b0,
      O_neg_a1  => SC_neg_a1,
      O_neg_a2  => SC_neg_a2
    );

  biquad_inst : entity work.wahwah_biquad
    generic map (
      FRAC_BITS => 22
    )
    port map (
      I_clock               => clk,
      I_reset               => rst,
      I_inputSample         => D_in,
      I_inputSampleValid    => ce,
      I_b0                  => SC_b0,
      I_neg_a1              => SC_neg_a1,
      I_neg_a2              => SC_neg_a2,
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
