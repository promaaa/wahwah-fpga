-------------------------------------------------------------------------------
-- wahwah_biquad.vhd — Filtre biquad Direct Form 1 séquentiel
--
-- BLOC MATERIEL 2 : Equation de filtrage
--
-- Implémente l'équation aux différences du biquad passe-bande :
--   y[n] = b0*x[n] + b2*x[n-2] - a1*y[n-1] - a2*y[n-2]
-- avec b1 = 0 et b2 = -b0 (propriété du passe-bande RBJ constant 0 dB).
--
-- Optimisation : seulement 3 multiplications effectives par échantillon
-- (b0*x[n], b0*x[n-2], neg_a1*y[n-1], neg_a2*y[n-2] → 4 MAC cycles).
--
-- Arithmétique virgule fixe :
--   Audio  : 24 bits signés (entier)
--   Coeffs : 24 bits signés Q1.22
--   Produit: 48 bits signés
--   Accum. : 56 bits signés (marge de 8 bits)
--   Sortie : acc >> 22, saturé à 24 bits
--
-- FSM : IDLE → LOAD → MAC0 → MAC1 → MAC2 → MAC3 → STORE → DONE
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wahwah_biquad is
  generic (
    FRAC_BITS : natural := 22  -- nombre de bits fractionnaires (Q1.22)
  );
  port (
    I_clock               : in  std_logic;
    I_reset               : in  std_logic;
    -- Échantillon d'entrée (24 bits signés)
    I_inputSample         : in  std_logic_vector(23 downto 0);
    I_inputSampleValid    : in  std_logic;
    -- Coefficients biquad en Q1.22 (fournis par le bloc de calcul des coefficients)
    I_b0                  : in  signed(23 downto 0);    -- b0
    I_neg_a1              : in  signed(23 downto 0);    -- -a1
    I_neg_a2              : in  signed(23 downto 0);    -- -a2
    -- Échantillon filtré
    O_filteredSample      : out std_logic_vector(23 downto 0);
    O_filteredSampleValid : out std_logic
  );
end entity wahwah_biquad;

architecture arch_wahwah_biquad of wahwah_biquad is

  component wahwah_biquad_fsm is
    port (
      I_clock            : in  std_logic;
      I_reset            : in  std_logic;
      I_inputSampleValid : in  std_logic;
      O_load             : out std_logic;
      O_mac0             : out std_logic;
      O_mac1             : out std_logic;
      O_mac2             : out std_logic;
      O_mac3             : out std_logic;
      O_store            : out std_logic;
      O_done             : out std_logic
    );
  end component;

  -- Signaux de commande issus de la FSM externe
  signal SC_fsm_load  : std_logic;
  signal SC_fsm_mac0  : std_logic;
  signal SC_fsm_mac1  : std_logic;
  signal SC_fsm_mac2  : std_logic;
  signal SC_fsm_mac3  : std_logic;
  signal SC_fsm_store : std_logic;
  signal SC_fsm_done  : std_logic;

  -- ════════════════════════════════════════════════════════════
  -- Registres à retard (mémoires d'état DF1)
  -- ════════════════════════════════════════════════════════════
  signal SR_x_z1 : signed(23 downto 0);  -- x[n-1] (conservé pour généralité)
  signal SR_x_z2 : signed(23 downto 0);  -- x[n-2]
  signal SR_y_z1 : signed(23 downto 0);  -- y[n-1]
  signal SR_y_z2 : signed(23 downto 0);  -- y[n-2]

  -- Échantillon courant capturé
  signal SR_x_n : signed(23 downto 0);

  -- ════════════════════════════════════════════════════════════
  -- Chemin de données MAC (Multiply-Accumulate)
  -- ════════════════════════════════════════════════════════════
  signal SR_mult_a    : signed(23 downto 0);  -- opérande A du multiplieur
  signal SR_mult_b    : signed(23 downto 0);  -- opérande B du multiplieur
  signal SC_mult_out  : signed(47 downto 0);  -- produit combinatoire (DSP48)
  signal SR_acc       : signed(55 downto 0);  -- accumulateur 56 bits

  -- Résultat filtré
  signal SR_y_out     : signed(23 downto 0);
  signal SR_y_valid   : std_logic;

begin

  -- ────────────────────────────────────────────────────────────
  -- Multiplieur combinatoire (synthétisé sur slice DSP48)
  -- ────────────────────────────────────────────────────────────
  SC_mult_out <= SR_mult_a * SR_mult_b;

  -- ────────────────────────────────────────────────────────────
  -- Machine d'etat separee (fichier distinct)
  -- ────────────────────────────────────────────────────────────
  U_wahwah_biquad_fsm : wahwah_biquad_fsm
    port map (
      I_clock            => I_clock,
      I_reset            => I_reset,
      I_inputSampleValid => I_inputSampleValid,
      O_load             => SC_fsm_load,
      O_mac0             => SC_fsm_mac0,
      O_mac1             => SC_fsm_mac1,
      O_mac2             => SC_fsm_mac2,
      O_mac3             => SC_fsm_mac3,
      O_store            => SC_fsm_store,
      O_done             => SC_fsm_done
    );

  -- ────────────────────────────────────────────────────────────
  -- Partie opérative séquentielle
  -- ────────────────────────────────────────────────────────────
  process (I_clock, I_reset)
    variable V_acc_shifted : signed(55 downto 0);
  begin
    if I_reset = '1' then
      SR_x_z1    <= (others => '0');
      SR_x_z2    <= (others => '0');
      SR_y_z1    <= (others => '0');
      SR_y_z2    <= (others => '0');
      SR_x_n     <= (others => '0');
      SR_mult_a  <= (others => '0');
      SR_mult_b  <= (others => '0');
      SR_acc     <= (others => '0');
      SR_y_out   <= (others => '0');
      SR_y_valid <= '0';

    elsif rising_edge(I_clock) then
      -- Par défaut, le signal valid est bas
      SR_y_valid <= '0';

      if SC_fsm_load = '1' then
          SR_x_n    <= signed(I_inputSample);
          -- Préparer : b0 × x[n]
          SR_mult_a <= I_b0;
          SR_mult_b <= signed(I_inputSample);

      elsif SC_fsm_mac0 = '1' then
          SR_acc    <= resize(SC_mult_out, 56);
          -- Préparer : b0 × x[n-2]  (sera soustrait → b2 = -b0)
          SR_mult_a <= I_b0;
          SR_mult_b <= SR_x_z2;

      elsif SC_fsm_mac1 = '1' then
          SR_acc    <= SR_acc - resize(SC_mult_out, 56);
          -- Préparer : (-a1) × y[n-1]
          SR_mult_a <= I_neg_a1;
          SR_mult_b <= SR_y_z1;

      elsif SC_fsm_mac2 = '1' then
          SR_acc    <= SR_acc + resize(SC_mult_out, 56);
          -- Préparer : (-a2) × y[n-2]
          SR_mult_a <= I_neg_a2;
          SR_mult_b <= SR_y_z2;

      elsif SC_fsm_mac3 = '1' then
          SR_acc    <= SR_acc + resize(SC_mult_out, 56);

      elsif SC_fsm_store = '1' then
          -- Décalage à droite de FRAC_BITS (division par 2^22)
          V_acc_shifted := shift_right(SR_acc, FRAC_BITS);

          -- Saturation à 24 bits signés
          if V_acc_shifted > to_signed(8388607, 56) then
            SR_y_out <= to_signed(8388607, 24);
          elsif V_acc_shifted < to_signed(-8388608, 56) then
            SR_y_out <= to_signed(-8388608, 24);
          else
            SR_y_out <= V_acc_shifted(23 downto 0);
          end if;

          -- Mise à jour des registres à retard de l'entrée
          SR_x_z2 <= SR_x_z1;
          SR_x_z1 <= SR_x_n;
          -- Mise à jour du registre sortie y[n-2]
          SR_y_z2 <= SR_y_z1;

          SR_y_valid <= '1';

      elsif SC_fsm_done = '1' then
          SR_y_z1 <= SR_y_out;   -- y_out est maintenant stable (registré à S_STORE)
      end if;
    end if;
  end process;

  -- ────────────────────────────────────────────────────────────
  -- Sorties
  -- ────────────────────────────────────────────────────────────
  O_filteredSample      <= std_logic_vector(SR_y_out);
  O_filteredSampleValid <= SR_y_valid;

end architecture arch_wahwah_biquad;
