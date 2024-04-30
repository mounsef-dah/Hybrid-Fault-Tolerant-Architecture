library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shadow_reg is
    port (
        CLK, CLKRegin, CRegin : in std_logic;
        vin : in std_logic_vector(3 downto 0);
        vout : out std_logic_vector(3 downto 0)
    );
end entity;

architecture Behavioral of shadow_reg is

    component eRegin is
        port (
            CLK, CLKRegin, CRegin : in std_logic;
            D : in std_logic;
            Q : out std_logic
        );
    end component;

begin
    eRegin_inst_0: eRegin
        port map (
            CLK => CLK,
            CLKRegin => CLKRegin,
            CRegin => CRegin,
            D => vin(0),
            Q => vout(0)
        );

    eRegin_inst_1: eRegin
        port map (
            CLK => CLK,
            CLKRegin => CLKRegin,
            CRegin => CRegin,
            D => vin(1),
            Q => vout(1)
        );

    eRegin_inst_2: eRegin
        port map (
            CLK => CLK,
            CLKRegin => CLKRegin,
            CRegin => CRegin,
            D => vin(2),
            Q => vout(2)
        );

    eRegin_inst_3: eRegin
        port map (
            CLK => CLK,
            CLKRegin => CLKRegin,
            CRegin => CRegin,
            D => vin(3),
            Q => vout(3)
        );

end architecture Behavioral;
