library IEEE;
use IEEE.std_logic_1164.all;

entity tb is
end entity;

architecture tb of tb is
    signal x1, x2, sum_out: std_logic_vector(7 downto 0);
    signal power: std_logic;
    -- signal g: std_logic;
    component RCA8 is
        port(a, b: in std_logic_vector(7 downto 0);
        sum: out std_logic_vector(7 downto 0);
        cout: out std_logic);
    end component;
begin    
    dut_instances: RCA8
    port map( a => x1,b => x2, sum => sum_out,cout => power );    
    process
    begin
        x1  <= "10100100";
        x2  <= "11101011";
        wait for 1 ns;
        x1  <= "11111111";
        x2  <= "10101011";
        wait for 1 ns;
       
    end process;
end architecture;

