library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity invCLKRegin is
port(
    a : in std_logic;
    s : out std_logic);
end invCLKRegin;

architecture Behavioral of invCLKRegin is

begin
    
    s <= not a after 1ns; --invCLKRegin delay
    
end Behavioral;

