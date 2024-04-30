library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_eregin is
    port (
        sel : in std_logic;
        D1 : in std_logic;
        D0 : in std_logic;
        output : out std_logic
    );
end entity;

architecture Behavioral of mux_eregin is
begin
    process (sel, D0, D1)
    begin
        if sel = '1' then
            output <= D1;
        else
            output <= D0;
        end if;
    end process;
    
end architecture Behavioral;
