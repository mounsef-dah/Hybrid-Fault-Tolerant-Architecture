library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bufDC is
port(
    a : in std_logic;
    s : out std_logic);
end bufDC;

architecture Behavioral of bufDC is

begin
    s <= a after 2ns; --bufDC delay 
end Behavioral;
