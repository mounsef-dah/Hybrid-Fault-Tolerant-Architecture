library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity invRComp is
port(
    a : in std_logic;
    s : out std_logic);
end invRComp;

architecture Behavioral of invRComp is

begin
    
    s <= not a; --invRComp delay
    
end Behavioral;

