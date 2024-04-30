Library IEEE;
USE IEEE.Std_logic_1164.all;

entity dffr is 
   port(
      Clk :in std_logic; 
      reset : in std_logic;  
      D :in  std_logic;
      Q_b : out std_logic    
   );
end dffr;

architecture Behavioral of dffr is  
begin  
 process(Clk,reset)
 begin 
    if(rising_edge(Clk)) then
        Q_b <= not D; 
    end if;       
    if reset = '1' then
        Q_b <= '0';
    end if;
 end process;  
end Behavioral;

