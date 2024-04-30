library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity principal_tb is
end;

architecture bench of principal_tb is

  component principal
      Port ( clk, reset_control : in STD_LOGIC;
             D : in STD_LOGIC_VECTOR (3 downto 0);
             error_in : in std_logic_vector(8 downto 0);
             S : out STD_LOGIC_VECTOR (2 downto 0);
             error: out std_logic);
  end component;

  signal clk, reset_control: STD_LOGIC;
  signal D: STD_LOGIC_VECTOR (3 downto 0);
  signal error_in: std_logic_vector(8 downto 0);
  signal S: STD_LOGIC_VECTOR (2 downto 0);
  signal error: std_logic;

begin

  uut: principal port map ( clk           => clk,
                            reset_control => reset_control,
                            D             => D,
                            error_in      => error_in,
                            S             => S,
                            error         => error );

  process
begin
    clk <= '0';
    wait for 10ns;
    clk <= '1';
    wait for 10ns;

end process;

process
begin
    reset_control <= '0';
    wait for 10ns;
    reset_control <= '0';
    wait for 100ns;
end process;


process
begin
    D <= "0001";
    wait for 20ns;
    D <= "0010";
    wait for 20ns;
    D <= "0011";
    wait for 20ns;
    D <= "0111";
    wait for 20ns;
    D <= "1011";
    wait for 100ns;
    D <= "1111";
    wait for 20ns;
end process;

process
begin
    error_in <= "000000000";
    wait for 87ns;
    error_in <= "000100000";
    wait for 500ns;
end process;

end;
