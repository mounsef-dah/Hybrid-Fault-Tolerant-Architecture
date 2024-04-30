library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DLL is
    port (
        enable : in std_logic;
        input : in std_logic;
        output : out std_logic
    );
end entity DLL;

architecture Behavioral of DLL is
begin
    process (enable, input)
    begin
        if enable = '0' then
            output <= input;
        end if;
    end process;

end architecture Behavioral;
