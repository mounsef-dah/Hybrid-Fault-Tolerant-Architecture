library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity add_delay_cl is
port(
    a : in std_logic_vector(2 downto 0);
    delay : in std_logic;
    c : out std_logic_vector(2 downto 0)
    );
end add_delay_cl;

architecture Behavioral of add_delay_cl is

begin
    
    process(a,delay)
    begin
        if delay = '0' then 
            c <= a;
        else 
            c <= a after 12ns;
        end if;
        
    end process;
        
end Behavioral;
