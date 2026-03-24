--------------------------------------------------------------------------------
-- wahwahUnit.vhd — Unité wah-wah complète (Architecture structurale)
--
-- Ce module est maintenant une architecture structurale qui connecte :
--   - BLOC 1 : wahwah_control (machine d'état - contrôle LFO)
--              Gère l'accumulateur de phase et le décalage de fréquence centrale
--   - BLOC 2 : wahwah_operative (partie opérative - filtrage)
--              ROM de coefficients + filtre biquad DF1
--
-- Cette séparation machine d'état / partie opérative permet :
--   - Une meilleure modularité et réutilisabilité
--   - Une vérification plus facile des deux parties indépendamment
--   - Une compréhension claire du flux de données et de contrôle
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

  -- Signaux d'interconnexion entre contrôle et opérative
  signal S_lfo_addr : std_logic_vector(7 downto 0);

begin

  -- ════════════════════════════════════════════════════════════
  -- BLOC 1 : Contrôle (Machine d'état)
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
      O_lfo_incr          => open  -- non utilisé dans l'architecture actuelle
    );

  -- ════════════════════════════════════════════════════════════
  -- BLOC 2 : Partie opérative (Chemin de données)
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
      O_filteredSample      => O_filteredSample,
      O_filteredSampleValid => O_filteredSampleValid
    );

end architecture arch_wahwahUnit;
