library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ANDCRegin is
port(
    a : in std_logic;
    b : in std_logic;
    s : out std_logic);    
end ANDCRegin;

architecture Behavioral of ANDCRegin is

begin
    s <= (a and b)after 1ns;
end Behavioral;
