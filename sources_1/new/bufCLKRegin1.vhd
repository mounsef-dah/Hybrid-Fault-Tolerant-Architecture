library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bufCLKRegin1 is
port(
    a : in std_logic;
    s : out std_logic);
end bufCLKRegin1;

architecture Behavioral of bufCLKRegin1 is

begin
    s <= a after 1ns; --bufCLKRegin1 delay 
end Behavioral;
