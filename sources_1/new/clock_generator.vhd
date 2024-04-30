library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

entity clock_generator is
    Port ( clk, error, reset_control : in STD_LOGIC;
           ClkRegin, CRegin, DC, reset : out STD_LOGIC);
end clock_generator;

architecture Behavioral of clock_generator is

component ANDCRegin is
port(
    a : in std_logic;
    b : in std_logic;
    s : out std_logic);    
end component; 

component CLKComp is
port(
    a : in std_logic;
    b : in std_logic;
    s : out std_logic);
end component;

component CLKNand is
port(
    a : in std_logic;
    b : in std_logic;
    s : out std_logic);    
end component;

component ORCLKRegin is
port(
    a : in std_logic;
    b : in std_logic;
    s : out std_logic);    
end component;

component bufCLKRegin1 is
port(
    a : in std_logic;
    s : out std_logic);
end component;

component bufCLKRegin2 is
port(
    a : in std_logic;
    s : out std_logic);
end component;

component bufDC is
port(
    a : in std_logic;
    s : out std_logic);
end component;

component bufRComp is
port(
    a : in std_logic;
    s : out std_logic);
end component;

component dffr is 
   port(
      Clk :in std_logic; 
      reset : in std_logic;  
      D :in  std_logic;
      Q_b : out std_logic    
   );
end component;

component invCLKRegin is
port(
    a : in std_logic;
    s : out std_logic);
end component;

component invRComp is
port(
    a : in std_logic;
    s : out std_logic);
end component;

-- declaration signaux----------------------

signal tmp_1, tmp_2, tmp_3, tmp_4, tmp_5, tmp_6, tmp_7, tmp_8, tmp_9 : std_logic;

begin
    bufDC1 : bufDC port map(clk,tmp_5);
    bufRComp1 : bufRComp port map(clk,tmp_1);
    invRComp1 : invRComp port map(tmp_1,tmp_2);
    CLKNand1 : CLKNand port map(tmp_2,clk,tmp_3);
    CLKComp1: CLKComp port map(tmp_3,tmp_4,reset);
    dffr1 : dffr port map(tmp_5,reset_control,tmp_6,tmp_4);
    ANDCRegin1 : ANDCRegin port map(tmp_4,error,tmp_6);
    bufCLKRegin11 : bufCLKRegin1 port map(tmp_5,tmp_7);
    bufCLKRegin21 : bufCLKRegin2 port map(tmp_7,tmp_8);
    invCLKRegin1 : invCLKRegin port map(tmp_8,tmp_9);
    ORCLKRegin1 : ORCLKRegin port map(tmp_7,tmp_9,ClkRegin);
    
    DC <= tmp_5;
    CRegin <= tmp_6;
    
end Behavioral;

