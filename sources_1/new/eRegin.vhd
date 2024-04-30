library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eRegin is
    port (
        CLK, CLKRegin, CRegin, D : in std_logic;
        Q : out std_logic
    );
end entity;

architecture Behavioral of eRegin is

component or_gate is
    port (
        CLKRegin, CRegin : in std_logic;
        output : out std_logic
    );
end component;

component DLL is
    port (
        enable : in std_logic;
        input : in std_logic;
        output : out std_logic
    );
end component;

component mux_eregin is
    port (
        sel : in std_logic;
        D1 : in std_logic;
        D0 : in std_logic;
        output : out std_logic
    );
end component;

component DFF is
    port (
        CLK : in std_logic;
        D : in std_logic;
        Q : out std_logic
    );
end component;

-- signaux interne----------------------

    signal enable, Qm, tmp_1, tmp_2 : std_logic;
begin

    or_gate1 : or_gate port map(CLKRegin,CRegin,enable);
    DLL1 : DLL port map(enable,tmp_1,Qm);
    mux1 : mux_eregin port map(CRegin,Qm,D,tmp_2);
    DFF1 : DFF port map(CLK,tmp_2,tmp_1);
    Q <= tmp_1;
    
end Behavioral;
