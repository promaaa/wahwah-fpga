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
--   Audio  : 16 bits signés (entier)
--   Coeffs : 16 bits signés Q1.14
--   Produit: 32 bits signés
--   Accum. : 36 bits signés (marge de 4 bits)
--   Sortie : acc >> 14, saturé à 16 bits
--
-- FSM : IDLE → LOAD → MAC0 → MAC1 → MAC2 → MAC3 → STORE → DONE
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wahwah_biquad is
  generic (
    FRAC_BITS : natural := 14  -- nombre de bits fractionnaires (Q1.14)
  );
  port (
    I_clock               : in  std_logic;
    I_reset               : in  std_logic;
    -- Échantillon d'entrée (16 bits signés)
    I_inputSample         : in  std_logic_vector(15 downto 0);
    I_inputSampleValid    : in  std_logic;
    -- Coefficients biquad en Q1.14 (fournis par le bloc de calcul des coefficients)
    I_b0                  : in  signed(15 downto 0);    -- b0
    I_neg_a1              : in  signed(15 downto 0);    -- -a1
    I_neg_a2              : in  signed(15 downto 0);    -- -a2
    -- Échantillon filtré
    O_filteredSample      : out std_logic_vector(15 downto 0);
    O_filteredSampleValid : out std_logic
  );
end entity wahwah_biquad;

architecture arch_wahwah_biquad of wahwah_biquad is

  -- ════════════════════════════════════════════════════════════
  -- Machine à états
  -- ════════════════════════════════════════════════════════════
  type state_t is (
    S_IDLE,     -- Attente d'un nouvel échantillon
    S_LOAD,     -- Capture de x[n], mise en place du 1er produit
    S_MAC0,     -- acc  = b0 * x[n]
    S_MAC1,     -- acc -= b0 * x[n-2]   (car b2 = -b0)
    S_MAC2,     -- acc += (-a1) * y[n-1]
    S_MAC3,     -- acc += (-a2) * y[n-2]
    S_STORE,    -- Extraction / saturation du résultat, mise à jour des registres
    S_DONE      -- Signaler la validité de la sortie, attendre fin du pulse valid
  );
  signal SR_state : state_t;

  -- ════════════════════════════════════════════════════════════
  -- Registres à retard (mémoires d'état DF1)
  -- ════════════════════════════════════════════════════════════
  signal SR_x_z1 : signed(15 downto 0);  -- x[n-1] (conservé pour généralité)
  signal SR_x_z2 : signed(15 downto 0);  -- x[n-2]
  signal SR_y_z1 : signed(15 downto 0);  -- y[n-1]
  signal SR_y_z2 : signed(15 downto 0);  -- y[n-2]

  -- Échantillon courant capturé
  signal SR_x_n : signed(15 downto 0);

  -- ════════════════════════════════════════════════════════════
  -- Chemin de données MAC (Multiply-Accumulate)
  -- ════════════════════════════════════════════════════════════
  signal SR_mult_a    : signed(15 downto 0);  -- opérande A du multiplieur
  signal SR_mult_b    : signed(15 downto 0);  -- opérande B du multiplieur
  signal SC_mult_out  : signed(31 downto 0);  -- produit combinatoire (DSP48)
  signal SR_acc       : signed(35 downto 0);  -- accumulateur 36 bits

  -- Résultat filtré
  signal SR_y_out     : signed(15 downto 0);
  signal SR_y_valid   : std_logic;

begin

  -- ────────────────────────────────────────────────────────────
  -- Multiplieur combinatoire (synthétisé sur slice DSP48)
  -- ────────────────────────────────────────────────────────────
  SC_mult_out <= SR_mult_a * SR_mult_b;

  -- ────────────────────────────────────────────────────────────
  -- Machine à états + chemin de données séquentiel
  -- ────────────────────────────────────────────────────────────
  process (I_clock, I_reset)
    variable V_acc_shifted : signed(35 downto 0);
  begin
    if I_reset = '1' then
      SR_state   <= S_IDLE;
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

      case SR_state is

        -- ░░ IDLE ░░ Attente d'un nouvel échantillon ░░
        when S_IDLE =>
          if I_inputSampleValid = '1' then
            SR_state <= S_LOAD;
          end if;

        -- ░░ LOAD ░░ Capture x[n] et préparation du 1er produit ░░
        when S_LOAD =>
          SR_x_n    <= signed(I_inputSample);
          -- Préparer : b0 × x[n]
          SR_mult_a <= I_b0;
          SR_mult_b <= signed(I_inputSample);
          SR_state  <= S_MAC0;

        -- ░░ MAC0 ░░ acc = b0 × x[n] ░░
        when S_MAC0 =>
          SR_acc    <= resize(SC_mult_out, 36);
          -- Préparer : b0 × x[n-2]  (sera soustrait → b2 = -b0)
          SR_mult_a <= I_b0;
          SR_mult_b <= SR_x_z2;
          SR_state  <= S_MAC1;

        -- ░░ MAC1 ░░ acc -= b0 × x[n-2] ░░
        when S_MAC1 =>
          SR_acc    <= SR_acc - resize(SC_mult_out, 36);
          -- Préparer : (-a1) × y[n-1]
          SR_mult_a <= I_neg_a1;
          SR_mult_b <= SR_y_z1;
          SR_state  <= S_MAC2;

        -- ░░ MAC2 ░░ acc += (-a1) × y[n-1] ░░
        when S_MAC2 =>
          SR_acc    <= SR_acc + resize(SC_mult_out, 36);
          -- Préparer : (-a2) × y[n-2]
          SR_mult_a <= I_neg_a2;
          SR_mult_b <= SR_y_z2;
          SR_state  <= S_MAC3;

        -- ░░ MAC3 ░░ acc += (-a2) × y[n-2] ░░
        when S_MAC3 =>
          SR_acc   <= SR_acc + resize(SC_mult_out, 36);
          SR_state <= S_STORE;

        -- ░░ STORE ░░ Extraction du résultat + mise à jour des registres ░░
        when S_STORE =>
          -- Décalage à droite de FRAC_BITS (division par 2^14)
          V_acc_shifted := shift_right(SR_acc, FRAC_BITS);

          -- Saturation à 16 bits signés
          if V_acc_shifted > to_signed(32767, 36) then
            SR_y_out <= to_signed(32767, 16);
          elsif V_acc_shifted < to_signed(-32768, 36) then
            SR_y_out <= to_signed(-32768, 16);
          else
            SR_y_out <= V_acc_shifted(15 downto 0);
          end if;

          -- Mise à jour des registres à retard de l'entrée
          SR_x_z2 <= SR_x_z1;
          SR_x_z1 <= SR_x_n;
          -- Mise à jour du registre sortie y[n-2]
          SR_y_z2 <= SR_y_z1;

          SR_y_valid <= '1';
          SR_state   <= S_DONE;

        -- ░░ DONE ░░ Mise à jour de y[n-1] et attente fin du pulse ░░
        when S_DONE =>
          SR_y_z1 <= SR_y_out;   -- y_out est maintenant stable (registré à S_STORE)
          if I_inputSampleValid = '0' then
            SR_state <= S_IDLE;
          end if;

        when others =>
          SR_state <= S_IDLE;

      end case;
    end if;
  end process;

  -- ────────────────────────────────────────────────────────────
  -- Sorties
  -- ────────────────────────────────────────────────────────────
  O_filteredSample      <= std_logic_vector(SR_y_out);
  O_filteredSampleValid <= SR_y_valid;

end architecture arch_wahwah_biquad;
