library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb is
end entity;

architecture tb of tb is
    signal x: std_logic_vector(3 downto 0);
    signal g: std_logic_vector(1 downto 0);
    component encoder4x2 is
        port(I: in std_logic_vector (3 downto 0);
        Y: out std_logic_vector(1 downto 0)
        );
    end component;
begin    
    dut_instances0: encoder4x2

    port map(I => x, Y => g); 
process
begin  

x<="0000";
wait for 1 ns;
x <= "0001";
wait for 1 ns;

wait for 1 ns; 
x<="0010";


wait for 1 ns; 
x<="0011";



wait for 1 ns; 
x<="0100";



wait for 1 ns; 
x<="0101";



wait for 1 ns; 
x<="0110";


wait for 1 ns; 
x<="0111";



wait for 1 ns; 
x<="1000";


wait for 1 ns; 
x<="1001";


wait for 1 ns; 
x<="1010";


wait for 1 ns; 
x<="1011";


wait for 1 ns; 
x<="1100";


wait for 1 ns; 
x<="1101";


wait for 1 ns; 
x<="1110";


wait for 1 ns; 
x<="1111"; 


wait for 1 ns; 

end process;
end architecture;   

    