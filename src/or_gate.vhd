library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_gate is
    port (
        CLKRegin, CRegin : in std_logic;
        output : out std_logic
    );
end entity;

architecture Behavioral of or_gate is
begin
    output <= CLKRegin or CRegin;
end architecture Behavioral;
