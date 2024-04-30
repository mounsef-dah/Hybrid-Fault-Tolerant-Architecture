library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is
    port (
        --signal d'entree
        input1  : in STD_LOGIC_VECTOR(2 downto 0);
        input2  : in STD_LOGIC_VECTOR(2 downto 0);
        input3  : in STD_LOGIC_VECTOR(2 downto 0);

        -- les bits de control m1 et m2
        cmd     : in STD_LOGIC_VECTOR(1 downto 0);

        -- signal de sortie
        output1 : out STD_LOGIC_VECTOR(2 downto 0);
        output2 : out STD_LOGIC_VECTOR(2 downto 0)
    );
end Mux;

architecture Behavioral of Mux is
begin
    process (cmd, input1, input2, input3)  -- Sensitivity list
    begin
        case cmd is
            when "00" =>
                output1 <= input1;
                output2 <= input2;
            when "10" =>
                output1 <= input2;
                output2 <= input3;
            when "01" =>
                output1 <= input1;
                output2 <= input3;
            when others =>
                output1 <= "ZZZ";
                output2 <= "ZZZ";
        end case;
    end process;
end Behavioral;
