library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ORCLKRegin is
port(
    a : in std_logic;
    b : in std_logic;
    s : out std_logic);    
end ORCLKRegin;

architecture Behavioral of ORCLKRegin is

begin
    s <= (a or b) after 1ns;
end Behavioral;
