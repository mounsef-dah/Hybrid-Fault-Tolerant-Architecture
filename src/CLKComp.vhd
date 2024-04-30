library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CLKComp is
port(
    a : in std_logic;
    b : in std_logic;
    s : out std_logic);
end CLKComp;

architecture Behavioral of CLKComp is

begin
    
    s <=  (a or b) after 1ns; --CLKComp delay
    
end Behavioral;

