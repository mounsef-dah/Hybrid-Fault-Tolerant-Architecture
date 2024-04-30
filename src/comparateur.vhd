library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparateur is
    Port (
        DC : in STD_LOGIC;
        reset : in STD_LOGIC;
        PO : in STD_LOGIC_VECTOR (2 downto 0);
        vout2 : in STD_LOGIC_VECTOR (2 downto 0);
        error : out STD_LOGIC
    );
end comparateur;

architecture Behavioral of comparateur is
signal error_tmp:std_logic:='0';

begin
    process(DC, reset, PO, vout2)
    begin
        if reset = '0' then
            error_tmp <= '0';
        elsif DC = '1' and PO /= vout2 then
            error_tmp <= '1';
        else 
            error_tmp <= error_tmp;
        end if;
    end process;
    error <= error_tmp;
end Behavioral;
