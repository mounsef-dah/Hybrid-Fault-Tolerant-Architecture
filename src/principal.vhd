library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.std_logic_unsigned.ALL;



entity principal is
    Port ( clk, reset_control : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           error_in : in std_logic_vector(8 downto 0); -- injection de faute
           S : out STD_LOGIC_VECTOR (2 downto 0);
           error: out std_logic);
end principal;

architecture Behavioral of principal is

component control_logic is
    Port ( clk, error, reset_control : in STD_LOGIC;
           sel2, sel3 : out std_logic_vector(1 downto 0);
           ClkRegin, CRegin, DC, reset : out STD_LOGIC);
end component;

component shadow_reg is
    port (
        CLK, CLKRegin, CRegin : in std_logic;
        vin : in std_logic_vector(3 downto 0);
        vout : out std_logic_vector(3 downto 0)
    );
end component;

component DeMux is
    Port ( input1 : in STD_LOGIC_VECTOR (3 downto 0);
           cmd : in STD_LOGIC_VECTOR (1 downto 0);
           output1 : out STD_LOGIC_VECTOR (3 downto 0);
           output2 : out STD_LOGIC_VECTOR (3 downto 0);
           output3 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component add2 is
    Port ( ai : in STD_LOGIC_VECTOR (1 downto 0);
           bi : in STD_LOGIC_VECTOR (1 downto 0);
           si : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Mux is
port(
		    input1 : in STD_LOGIC_VECTOR(2 downto 0);
			input2 : in STD_LOGIC_VECTOR(2 downto 0);
			input3 : in STD_LOGIC_VECTOR(2 downto 0);

			cmd : in STD_Logic_VECTOR(1 downto 0);

			output1 : out STD_LOGIC_VECTOR(2 downto 0);
			output2 : out STD_LOGIC_VECTOR(2 downto 0));
end component;

component reg_sortie is
    Port ( clk : in STD_LOGIC;
           Ds : in STD_LOGIC_VECTOR (2 downto 0);
           Qs : out STD_LOGIC_VECTOR (2 downto 0));
end component;


component comparateur is
    Port ( DC : in STD_LOGIC;
           reset : in STD_LOGIC;
           PO : in STD_LOGIC_VECTOR (2 downto 0);
           vout2 : in STD_LOGIC_VECTOR (2 downto 0);
           error : out STD_LOGIC);
end component;

component fsm is
    Port ( clk : in STD_LOGIC;
           raz : in STD_LOGIC;
           error : in STD_LOGIC;
           sel1 : out STD_LOGIC;
           sel2 : out STD_LOGIC_VECTOR (1 downto 0);
           sel3 : out STD_LOGIC_VECTOR (1 downto 0);
           red_flag : out STD_LOGIC);
end component;


component injection_faute is
    Port ( vin1 : in STD_LOGIC_VECTOR (2 downto 0);
           vin2 : in STD_LOGIC_VECTOR (2 downto 0);
           vin3 : in STD_LOGIC_VECTOR (2 downto 0);
           v_b : in std_logic_vector(8 downto 0); -- si 100 faute en CL1, 010 CL2, 001 CL3
           vout1 : out STD_LOGIC_VECTOR (2 downto 0);
           vout2 : out STD_LOGIC_VECTOR (2 downto 0);
           vout3 : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component add_delay_cl is
port(
    a : in std_logic_vector(2 downto 0);
    delay : in std_logic;
    c : out std_logic_vector(2 downto 0)
    );
end component;

component add_delay_dff1 is -- retard registre d'entree
port(
    a : in std_logic_vector(3 downto 0);
    delay : in std_logic;
    c : out std_logic_vector(3 downto 0)
    );
end component;

component add_delay_dff2 is -- retard registre de sortie
port(
    a : in std_logic_vector(2 downto 0);
    delay : in std_logic;
    c : out std_logic_vector(2 downto 0)
    );
end component;

-- ----------------------------------------------------------------
signal CLKRegin, CRegin, DC, reset, sel2, sel3 : std_logic;
signal tmp_1, tmp_14 : std_logic;
signal tmp_3,tmp_10: std_logic_vector(1 downto 0);
signal tmp_21, tmp_22, tmp_4, tmp_5, tmp_6 : std_logic_vector(3 downto 0);

signal tmp_7, tmp_71, tmp_72, tmp_8, tmp_81, tmp_82, tmp_9, tmp_91, tmp_92, tmp_11, tmp_12, tmp_131,tmp_132: std_logic_vector(2 downto 0);

-- -----------------------------------------------------------------

begin

reg1: shadow_reg port map (clk, CLKRegin, CRegin, D, tmp_21);
add_delay_dff1_inst : add_delay_dff1 port map(tmp_21,'0',tmp_22); -- retard registre d'entree
Demux1: DeMux port map(tmp_22, tmp_3, tmp_4, tmp_5, tmp_6);
-- ------------
cl1 : add2 port map(tmp_4(3 downto 2), tmp_4(1 downto 0), tmp_71);
add_cl1 : add_delay_cl port map(tmp_71,'1',tmp_72);   -- Logic circuit delay
cl2 : add2 port map(tmp_5(3 downto 2), tmp_5(1 downto 0), tmp_81);
add_cl2 : add_delay_cl port map(tmp_81,'1',tmp_82);
cl3 : add2 port map(tmp_6(3 downto 2), tmp_6(1 downto 0), tmp_91);
add_cl3 : add_delay_cl port map(tmp_91,'1',tmp_92);
-- ------------
faute : injection_faute port map(tmp_72, tmp_82, tmp_92, error_in, tmp_7, tmp_8, tmp_9);

mux1: Mux port map(tmp_7, tmp_8, tmp_9, tmp_10, tmp_11, tmp_12);
reg2: reg_sortie port map (clk, tmp_11, tmp_131);
add_delay_dff2_inst : add_delay_dff2 port map(tmp_131,'0',tmp_132); -- retard registre de sortie
comp1: comparateur port map (DC, reset, tmp_132, tmp_12, tmp_14);
control1 : control_logic port map(clk, tmp_14, reset_control, tmp_3, tmp_10, ClkRegin, CRegin, DC, reset);

S <= tmp_132;
error <= tmp_14;

end Behavioral;
