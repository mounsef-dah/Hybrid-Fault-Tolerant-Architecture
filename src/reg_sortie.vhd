library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity reg_sortie is
    Port ( clk : in STD_LOGIC;
           Ds : in STD_LOGIC_VECTOR (2 downto 0);
           Qs : out STD_LOGIC_VECTOR (2 downto 0));
end reg_sortie;

architecture Behavioral of reg_sortie is

begin
reg: process
    begin
    
    wait until clk'event and clk = '1';
    Qs <= Ds;
    end process;


end Behavioral;