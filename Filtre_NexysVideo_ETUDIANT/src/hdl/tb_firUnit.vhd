-------------------------------------------------------------------------------
-- Title      : FirUnit
-- Project    : 
-------------------------------------------------------------------------------
-- File       : operativeUnit.vhd
-- Author     : Jean-Noel BAZIN  <jnbazin@pc-disi-026.enst-bretagne.fr>
-- Company    : 
-- Created    : 2018-04-11
-- Last update: 2019-02-26
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 8 bit FIR
-------------------------------------------------------------------------------
-- Copyright (c) 2018 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2018-04-11  1.0      jnbazin Created
-- 2018-04-18  1.1      marzel	Modified to add more test inputs
-- 2019-02-26  1.1      marzel  Adapted to 16-tap filtering
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_firUnit is
end entity tb_firUnit;

architecture archi_tb_firUnit of tb_firUnit is
  component firUnit is
    port (
      I_clock               : in  std_logic;
      I_reset               : in  std_logic;
      I_inputSample         : in  std_logic_vector(7 downto 0);
      I_inputSampleValid    : in  std_logic;
      O_filteredSample      : out std_logic_vector(7 downto 0);
      O_filteredSampleValid : out std_logic);
  end component firUnit;

  signal SC_clock               : std_logic := '0';
  signal SC_reset               : std_logic;
  signal SC_inputSample         : std_logic_vector(7 downto 0);
  signal SC_inputSampleValid    : std_logic:='0';
  signal SC_filteredSample      : std_logic_vector(7 downto 0);
  signal SC_filteredSampleValid : std_logic;

begin

  SC_clock <= not SC_clock after 5 ns;
  SC_reset <= '0', '1' after 19 ns, '0' after 57 ns;

  -- Sample period = 20 clk period
  SC_inputSampleValid <= not SC_inputSampleValid after 100 ns;

  -- Null signal followed by a Dirac and then an arbitrary sequence
  SC_inputSample <= "00000000",
                    "01111111" after 401 ns,
                    "00000000" after 601 ns,
                    "00100100" after 4201 ns,
                    "01100100" after 4401 ns,
                    "10100010" after 4601 ns,
                    "11011011" after 4801 ns,
                    "00001011" after 5001 ns,
                    "10000000" after 5201 ns,
                    "01111111" after 5401 ns,
                    "10111010" after 5601 ns;


-- the filter output on 8 bits is a sequence of signed numbers (with the  assumption
-- of rounding the output, so the accuracy can be slightly different depending
-- on your final stage):
  -- 0 2 3 6 10 15 20 24 26 26 24 20 15 10 6 3 2 0 0 0 1 2 3 5 7 7 8  4 -1 -8
  -- -17 -27 -38 -49 -61 -71 -82 -93 -101 -107 -112 -113 -116
  

  firUnit_1 : entity work.firUnit
    port map (
      I_clock               => SC_clock,
      I_reset               => SC_reset,
      I_inputSample         => SC_inputSample,
      I_inputSampleValid    => SC_inputSampleValid,
      O_filteredSample      => SC_filteredSample,
      O_filteredSampleValid => SC_filteredSampleValid);

end architecture archi_tb_firUnit;
