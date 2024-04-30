library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bufCLKRegin2 is
port(
    a : in std_logic;
    s : out std_logic);
end bufCLKRegin2;

architecture Behavioral of bufCLKRegin2 is

begin
    s <= a after 1ns; --bufCLKRegin2 delay 
end Behavioral;
