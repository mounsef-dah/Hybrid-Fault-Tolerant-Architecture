library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLKNand is
port(
    a : in std_logic;
    b : in std_logic;
    s : out std_logic);    
end CLKNand;

architecture Behavioral of CLKNand is

begin
    s <= (a nand b)after 1ns;
end Behavioral;
