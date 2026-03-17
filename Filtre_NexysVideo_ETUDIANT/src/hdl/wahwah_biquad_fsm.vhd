-------------------------------------------------------------------------------
-- wahwah_biquad_fsm.vhd
-- Controleur FSM du biquad: sequence les etapes LOAD/MAC/STORE/DONE.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity wahwah_biquad_fsm is
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
end entity wahwah_biquad_fsm;

architecture arch_wahwah_biquad_fsm of wahwah_biquad_fsm is
  type state_t is (S_IDLE, S_LOAD, S_MAC0, S_MAC1, S_MAC2, S_MAC3, S_STORE, S_DONE);
  signal SR_state      : state_t;
  signal SC_next_state : state_t;
begin

  process (I_clock, I_reset)
  begin
    if I_reset = '1' then
      SR_state <= S_IDLE;
    elsif rising_edge(I_clock) then
      SR_state <= SC_next_state;
    end if;
  end process;

  process (SR_state, I_inputSampleValid)
  begin
    SC_next_state <= SR_state;

    case SR_state is
      when S_IDLE =>
        if I_inputSampleValid = '1' then
          SC_next_state <= S_LOAD;
        end if;

      when S_LOAD =>
        SC_next_state <= S_MAC0;

      when S_MAC0 =>
        SC_next_state <= S_MAC1;

      when S_MAC1 =>
        SC_next_state <= S_MAC2;

      when S_MAC2 =>
        SC_next_state <= S_MAC3;

      when S_MAC3 =>
        SC_next_state <= S_STORE;

      when S_STORE =>
        SC_next_state <= S_DONE;

      when S_DONE =>
        if I_inputSampleValid = '0' then
          SC_next_state <= S_IDLE;
        end if;

      when others =>
        SC_next_state <= S_IDLE;
    end case;
  end process;

  O_load  <= '1' when SR_state = S_LOAD else '0';
  O_mac0  <= '1' when SR_state = S_MAC0 else '0';
  O_mac1  <= '1' when SR_state = S_MAC1 else '0';
  O_mac2  <= '1' when SR_state = S_MAC2 else '0';
  O_mac3  <= '1' when SR_state = S_MAC3 else '0';
  O_store <= '1' when SR_state = S_STORE else '0';
  O_done  <= '1' when SR_state = S_DONE else '0';

end architecture arch_wahwah_biquad_fsm;
