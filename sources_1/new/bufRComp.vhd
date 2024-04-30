library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bufRComp is
port(
    a : in std_logic;
    s : out std_logic);
end bufRComp;

architecture Behavioral of bufRComp is

begin
    s <= a after 1ns; --bufRComp delay 
end Behavioral;
