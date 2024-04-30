library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity fsm_test is
    Port ( clkRegin : in STD_LOGIC;
           CRegin : in STD_LOGIC;
           reset_control : in STD_LOGIC;
           sel2 : out STD_LOGIC_VECTOR (1 downto 0);
           sel3 : out STD_LOGIC_VECTOR (1 downto 0);
           red_flag : out STD_LOGIC);
end fsm_test;

architecture Behavioral of fsm_test is

type state is ( A, B, C, D);
signal present_state , next_state: state;
signal cpt: STD_LOGIC_VECTOR (1 downto 0);

begin
    process(present_state, CRegin)
    begin
        case present_state is

            when A => sel2 <= "00"; sel3<= "00"; red_flag <= '0';
                if cpt = "11"  then next_state <= D;
                elsif CRegin = '1' then next_state <= B;
                else next_state <= A;
                end if;


            when B => sel2 <= "10"; sel3<= "10"; red_flag <= '0';

                if cpt = "11"  then next_state <= D;
                elsif CRegin = '1' then next_state <= C;
                else next_state <= B;
                end if;


            when C => sel2 <= "01"; sel3<= "01"; red_flag <= '0';
                if cpt = "11"  then next_state <= D;
                elsif CRegin = '1' then next_state <= A;
                else next_state <= C;
                end if;


            when D => sel2 <= "11"; sel3<= "11"; red_flag <= '1';
                 next_state <= D;

        end case;
    end process;



process(clkRegin, reset_control)
begin
    if reset_control = '1' then present_state <= A; cpt <= "00";

    elsif clkRegin'event and clkRegin ='0' then 
      present_state <= next_state;
      if cpt = "11" then cpt <= "11";
      elsif present_state /= next_state then cpt <= cpt+1;
      elsif present_state = next_state then cpt <= "00";
      end if;

    end if;

end process;

end Behavioral;

