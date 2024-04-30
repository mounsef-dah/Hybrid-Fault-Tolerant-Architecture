library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity add_delay_dff2 is
port(
    a : in std_logic_vector(2 downto 0);
    delay : in std_logic;
    c : out std_logic_vector(2 downto 0)
    );
end add_delay_dff2;

architecture Behavioral of add_delay_dff2 is

begin

    process(a,delay)
    begin
    
        if delay = '0' then 
            c <= a;
        else 
            c <= a after 1ns;
        end if;
        
    end process;
    
end Behavioral;