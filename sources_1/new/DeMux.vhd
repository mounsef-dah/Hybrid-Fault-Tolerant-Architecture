library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DeMux is
    port (
        input1   : in  STD_LOGIC_VECTOR(3 downto 0);
        cmd     : in  STD_LOGIC_VECTOR(1 downto 0);
        output1 : out STD_LOGIC_VECTOR(3 downto 0);
        output2 : out STD_LOGIC_VECTOR(3 downto 0);
        output3 : out STD_LOGIC_VECTOR(3 downto 0)
    );
end DeMux;

architecture Behavioral of DeMux is

begin
    p_demux : process(input1,cmd)
    begin
        CASE cmd is
            when "00" =>
                output1 <= input1;
                output2 <= input1;
                output3 <= "0000";
            when "10" =>
                output1 <= "0000";
                output2 <= input1;
                output3 <= input1;
            when "01" =>
                output1 <= input1;
                output2 <= "0000";
                output3 <= input1;
            when others =>
                output1 <= "0000";
                output2 <= "0000";
                output3 <= "0000";
        end case;
    end process p_demux;

end Behavioral;