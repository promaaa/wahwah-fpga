--------------------------------------------------------------------------------
-- wahwahUnit.vhd — Unité wah-wah complète (Architecture structurale)
--
-- Ce module est une architecture structurale qui connecte :
--   - BLOC 1 : wahwah_control (Machine d'état UNIQUE + LFO)
--              - Accumulateur de phase LFO
--              - FSM pour le filtrage biquad
--   - BLOC 2 : wahwah_operative (Partie opérative - purely combinatoire)
--              - ROM de coefficients + multiplieur + accumulateur
--              - PAS de machine d'état
--
-- Cette séparation permet :
--   - Une seule machine d'état dans le contrôle
--   - Partie opérative purely combinatoire (data-path)
--   - Meilleure modularité et réutilisabilité
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wahwahUnit is
  port (
    I_clock               : in  std_logic;
    I_reset               : in  std_logic;
    I_inputSample         : in  std_logic_vector(15 downto 0);
    I_inputSampleValid    : in  std_logic;
    -- Sélection vitesse LFO (3 bits → 8 vitesses possibles)
    I_lfo_speed_sel       : in  std_logic_vector(2 downto 0);
    I_freq_up             : in  std_logic := '0';
    I_freq_down           : in  std_logic := '0';
    O_filteredSample      : out std_logic_vector(15 downto 0);
    O_filteredSampleValid : out std_logic
  );
end entity wahwahUnit;

architecture arch_wahwahUnit of wahwahUnit is

  -- Signaux d'interconnexion vers la partie opérative
  signal S_lfo_addr    : std_logic_vector(7 downto 0);
  signal S_mac_stage   : std_logic_vector(2 downto 0);
  signal S_x_data      : signed(15 downto 0);
  signal S_y_z1_data   : signed(15 downto 0);
  signal S_y_z2_data   : signed(15 downto 0);
  signal S_acc_out     : signed(35 downto 0);
  signal S_y_we        : std_logic;

begin

  -- ════════════════════════════════════════════════════════════
  -- BLOC 1 : Contrôle (Machine d'état UNIQUE + LFO)
  -- ════════════════════════════════════════════════════════════
  control_inst : entity work.wahwah_control
    port map (
      I_clock             => I_clock,
      I_reset             => I_reset,
      I_inputSampleValid  => I_inputSampleValid,
      I_lfo_speed_sel     => I_lfo_speed_sel,
      I_freq_up           => I_freq_up,
      I_freq_down         => I_freq_down,
      O_lfo_addr          => S_lfo_addr,
      O_lfo_incr          => open,
      O_filterStart       => open,
      O_coef_we           => open,
      O_mac_start         => open,
      O_mac_stage         => S_mac_stage,
      O_x_data            => S_x_data,
      O_y_z1_data         => S_y_z1_data,
      O_y_z2_data         => S_y_z2_data,
      I_y_result          => (others => '0'),
      O_y_we              => S_y_we,
      O_filteredValid     => O_filteredSampleValid
    );

  -- ════════════════════════════════════════════════════════════
  -- BLOC 2 : Partie opérative (Data-path purely combinatoire)
  -- ════════════════════════════════════════════════════════════
  operative_inst : entity work.wahwah_operative
    generic map (
      FRAC_BITS => 14
    )
    port map (
      I_clock               => I_clock,
      I_reset               => I_reset,
      I_inputSample         => I_inputSample,
      I_inputSampleValid    => I_inputSampleValid,
      I_lfo_addr            => S_lfo_addr,
      I_mac_stage           => S_mac_stage,
      I_x_data              => S_x_data,
      I_y_z1_data           => S_y_z1_data,
      I_y_z2_data           => S_y_z2_data,
      I_acc                 => S_acc_out,
      O_acc_out             => S_acc_out,
      O_filteredSample      => O_filteredSample,
      O_filteredSampleValid => open
    );

end architecture arch_wahwahUnit;
