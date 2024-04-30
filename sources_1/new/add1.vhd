library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity add1 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           r : in STD_LOGIC:='0';
           s : out STD_LOGIC;
           r0 : out STD_LOGIC);
end add1;

architecture Behavioral of add1 is

begin

    s <= a xor b xor r;
    r0 <= (a and b) or (r and (a xor b));

end Behavioral;