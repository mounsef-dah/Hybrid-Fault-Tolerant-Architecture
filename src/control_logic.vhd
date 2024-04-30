library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity control_logic is
    Port ( clk, error, reset_control : in STD_LOGIC;
           sel2, sel3 : out std_logic_vector(1 downto 0);
           ClkRegin, CRegin, DC, reset : out STD_LOGIC);
end control_logic;

architecture Behavioral of control_logic is

component clock_generator is
    Port ( clk, error, reset_control : in STD_LOGIC;
           ClkRegin, CRegin, DC, reset : out STD_LOGIC);
end component;

component fsm_test is
    Port ( ClkRegin, CRegin, reset_control: in STD_LOGIC;
           sel2, sel3 : out std_logic_vector(1 downto 0));
end component;

signal ClkRegin_tmp, CRegin_tmp: STD_LOGIC;

begin

clockG : clock_generator port map(clk,error,reset_control,ClkRegin_tmp,CRegin_tmp, DC, reset);
fsmG : fsm_test port map(ClkRegin_tmp,CRegin_tmp,reset_control,sel2,sel3);

ClkRegin <= ClkRegin_tmp;
CRegin <= CRegin_tmp;

end Behavioral;
