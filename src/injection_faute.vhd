library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
 

entity injection_faute is
    Port ( vin1 : in STD_LOGIC_VECTOR (2 downto 0);
           vin2 : in STD_LOGIC_VECTOR (2 downto 0);
           vin3 : in STD_LOGIC_VECTOR (2 downto 0);
           v_b : in std_logic_vector(8 downto 0); -- si 100 faute en CL1, 010 CL2, 001 CL3
           vout1 : out STD_LOGIC_VECTOR (2 downto 0);
           vout2 : out STD_LOGIC_VECTOR (2 downto 0);
           vout3 : out STD_LOGIC_VECTOR (2 downto 0));
end injection_faute;

architecture Behavioral of injection_faute is

begin

process(vin1,vin2,vin3,v_b)
begin
    vout1(0) <= vin1(0)xor v_b(0);
    vout1(1) <= vin1(1)xor v_b(1);
    vout1(2) <= vin1(2)xor v_b(2);
    
    vout2(0) <= vin2(0)xor v_b(3);
    vout2(1) <= vin2(1)xor v_b(4);
    vout2(2) <= vin2(2)xor v_b(5);
    
    vout3(0) <= vin3(0)xor v_b(6);
    vout3(1) <= vin3(1)xor v_b(7);
    vout3(2) <= vin3(2)xor v_b(8);
end process;

end Behavioral;

