-------------------------------------------------------------------------------
-- Title      : firUnit
-- Project    : 
-------------------------------------------------------------------------------
-- File       : operativeUnit.vhd
-- Author     : Jean-Noel BAZIN  <jnbazin@pc-disi-026.enst-bretagne.fr>
-- Company    : 
-- Created    : 2018-04-11
-- Last update: 2018-04-11
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 8 bit wrapper vers l'unité wah-wah LUT+biquad
-------------------------------------------------------------------------------
-- Copyright (c) 2018 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2018-04-11  1.0      jnbazin Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity firUnit is

  port (
    I_clock               : in  std_logic;  -- global clock
    I_reset               : in  std_logic;  -- asynchronous global reset
    I_inputSample         : in  std_logic_vector(7 downto 0);  -- 8 bit input sample
    I_inputSampleValid    : in  std_logic;
    O_filteredSample      : out std_logic_vector(7 downto 0);  -- filtered sample
    O_filteredSampleValid : out std_logic
    );

end entity firUnit;

architecture archi_firUnit of firUnit is
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

  signal SC_in_16  : std_logic_vector(15 downto 0);
  signal SC_out_16 : std_logic_vector(15 downto 0);

begin

  -- Extension de signe 8 bits -> 16 bits pour l'unité wah-wah
  SC_in_16 <= std_logic_vector(resize(signed(I_inputSample), 16));

  wahwah_compat_inst : wahwahUnit
    port map (
      I_clock               => I_clock,
      I_reset               => I_reset,
      I_inputSample         => SC_in_16,
      I_inputSampleValid    => I_inputSampleValid,
      I_lfo_speed_sel       => "010", -- 1.5 Hz par défaut
      O_filteredSample      => SC_out_16,
      O_filteredSampleValid => O_filteredSampleValid
    );

  -- Retour à 8 bits signé pour compatibilité interface legacy
  O_filteredSample <= SC_out_16(15 downto 8);

end architecture archi_firUnit;
