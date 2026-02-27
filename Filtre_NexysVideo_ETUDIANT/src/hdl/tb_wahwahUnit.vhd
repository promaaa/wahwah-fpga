library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_wahwahUnit is
end entity tb_wahwahUnit;

architecture sim of tb_wahwahUnit is
  constant C_CLK_PERIOD_NS    : time := 10 ns;
  constant C_CLK_HZ           : integer := 100000000;
  constant C_SAMPLE_RATE_HZ   : integer := 48000;
  constant C_SAMPLE_DIV       : integer := C_CLK_HZ / C_SAMPLE_RATE_HZ;
  constant C_NUM_SAMPLES      : integer := 2000;

  signal S_clk                : std_logic := '0';
  signal S_rst                : std_logic := '1';
  signal S_input              : std_logic_vector(15 downto 0) := (others => '0');
  signal S_input_valid        : std_logic := '0';
  signal S_lfo_speed_sel      : std_logic_vector(2 downto 0) := "010";
  signal S_output             : std_logic_vector(15 downto 0);
  signal S_output_valid       : std_logic;
begin

  uut : entity work.wahwahUnit
    port map (
      I_clock               => S_clk,
      I_reset               => S_rst,
      I_inputSample         => S_input,
      I_inputSampleValid    => S_input_valid,
      I_lfo_speed_sel       => S_lfo_speed_sel,
      O_filteredSample      => S_output,
      O_filteredSampleValid => S_output_valid
    );

  S_clk <= not S_clk after C_CLK_PERIOD_NS / 2;

  p_reset : process
  begin
    S_rst <= '1';
    wait for 200 ns;
    S_rst <= '0';
    wait;
  end process;

  p_stim : process
    variable v_clk_cnt          : integer := 0;
    variable v_sample_cnt       : integer := 0;
    variable v_out_valid_cnt    : integer := 0;
    variable v_sample           : integer := 0;
    variable v_step             : integer := 900;
  begin
    wait until S_rst = '0';
    wait until rising_edge(S_clk);

    while v_sample_cnt < C_NUM_SAMPLES loop
      S_input_valid <= '0';

      if v_clk_cnt = C_SAMPLE_DIV - 1 then
        v_clk_cnt := 0;
        S_input_valid <= '1';

        if v_sample >= 12000 then
          v_step := -900;
        elsif v_sample <= -12000 then
          v_step := 900;
        end if;
        v_sample := v_sample + v_step;
        S_input <= std_logic_vector(to_signed(v_sample, 16));

        if v_sample_cnt = 500 then
          S_lfo_speed_sel <= "001";
        elsif v_sample_cnt = 1000 then
          S_lfo_speed_sel <= "100";
        elsif v_sample_cnt = 1500 then
          S_lfo_speed_sel <= "111";
        end if;

        v_sample_cnt := v_sample_cnt + 1;
      else
        v_clk_cnt := v_clk_cnt + 1;
      end if;

      if S_output_valid = '1' then
        v_out_valid_cnt := v_out_valid_cnt + 1;
      end if;

      wait until rising_edge(S_clk);
    end loop;

    for i in 0 to 1000 loop
      if S_output_valid = '1' then
        v_out_valid_cnt := v_out_valid_cnt + 1;
      end if;
      wait until rising_edge(S_clk);
    end loop;

    assert v_out_valid_cnt > 100
      report "Erreur: trop peu d'echantillons de sortie valides."
      severity failure;

    assert false
      report "Fin de simulation tb_wahwahUnit (OK)."
      severity failure;
  end process;

end architecture sim;
