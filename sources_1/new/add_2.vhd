library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity add2 is
    Port ( ai : in STD_LOGIC_VECTOR (1 downto 0);
           bi : in STD_LOGIC_VECTOR (1 downto 0);
           si : out STD_LOGIC_VECTOR (2 downto 0));
end add2;

architecture Behavioral of add2 is

component add1 is
port(
    a , b, r : in std_logic;
    s ,r0 : out std_logic
);
end component;

component add_delay is
port(
    a : in std_logic_vector(2 downto 0);
    c : out std_logic_vector(2 downto 0)
    );
end component;

signal temp1 : std_logic;

begin

add1_1 : add1 port map(ai(0),bi(0),'0',si(0),temp1);
add1_2 : add1 port map(ai(1),bi(1),temp1,si(1),si(2));

end Behavioral;
