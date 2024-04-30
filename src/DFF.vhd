library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF is
    port (
        CLK : in std_logic;
        D : in std_logic;
        Q : out std_logic
    );
end entity;

architecture Behavioral of DFF is
begin

    process (CLK)
    begin
        if rising_edge(CLK) then
            Q <= D;
        end if;
    end process;
    
end architecture Behavioral;

