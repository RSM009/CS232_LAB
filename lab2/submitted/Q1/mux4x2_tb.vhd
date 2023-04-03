library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb is
end entity;

architecture tb of tb is
    signal x: std_logic_vector(3 downto 0);
    signal s: std_logic_vector(1 downto 0);
    signal y: std_logic;

    component mux4x2 is
    port(D: in std_logic_vector (3 downto 0);
    S: in std_logic_vector(1 downto 0);
    Y: out std_logic);
    end component;
begin    
    dut_instances0: mux4x2
    port map(D => x, S => s, Y => y); 
process
begin  

x<="0000";s <= "00";
 

wait for 1 ns; 
x<="0000";s <= "01";


wait for 1 ns; 
x<="0000";s <= "10";


wait for 1 ns; 
x<="0000";s <= "11";


wait for 1 ns; 
x<="0001";s <= "00";


wait for 1 ns; 
x<="0001";s <= "01";


wait for 1 ns; 
x<="0001";s <= "10";


wait for 1 ns; 
x<="0001";s <= "11";


wait for 1 ns; 
x<="0010";s <= "00";


wait for 1 ns; 
x<="0010";s <= "01";


wait for 1 ns; 
x<="0010";s <= "10";


wait for 1 ns; 
x<="0010";s <= "11";


wait for 1 ns; 
x<="0011";s <= "00";


wait for 1 ns; 
x<="0011";s <= "01";


wait for 1 ns; 
x<="0011";s <= "10";


wait for 1 ns; 
x<="0011";s <= "11";


wait for 1 ns; 
x<="0100";s <= "00";


wait for 1 ns; 
x<="0100";s <= "01";


wait for 1 ns; 
x<="0100";s <= "11";


wait for 1 ns; 
x<="0100";s <= "10";


wait for 1 ns; 
x<="0101";s <= "00";


wait for 1 ns; 
x<="0101";s <= "01";


wait for 1 ns; 
x<="0101";s <= "10";


wait for 1 ns; 
x<="0101";s <= "11";


wait for 1 ns; 
x<="0110";s <= "00";


wait for 1 ns; 
x<="0110";s <= "01";


wait for 1 ns; 
x<="0110";s <= "10";


wait for 1 ns; 
x<="0110";s <= "11";


wait for 1 ns; 
x<="0111";s <= "00";


wait for 1 ns; 
x<="0111";s <= "01";


wait for 1 ns; 
x<="0111";s <= "10";


wait for 1 ns; 
x<="0111";s <= "11";


wait for 1 ns; 
x<="1000";s <= "00";


wait for 1 ns; 
x<="1000";s <= "01";


wait for 1 ns; 
x<="1000";s <= "10";


wait for 1 ns; 
x<="1000";s <= "11";


wait for 1 ns; 
x<="1001";s <= "00";


wait for 1 ns; 
x<="1001";s <= "01";


wait for 1 ns; 
x<="1001";s <= "10";


wait for 1 ns; 
x<="1001";s <= "11";


wait for 1 ns; 
x<="1010";s <= "00";


wait for 1 ns; 
x<="1010";s <= "01";


wait for 1 ns; 
x<="1010";s <= "10";


wait for 1 ns; 
x<="1010";s <= "11";


wait for 1 ns; 
x<="1011";s <= "00";


wait for 1 ns; 
x<="1011";s <= "01";


wait for 1 ns; 
x<="1011";s <= "10";


wait for 1 ns; 
x<="1011";s <= "11";


wait for 1 ns; 
x<="1100";s <= "00";


wait for 1 ns; 
x<="1100";s <= "01";


wait for 1 ns; 
x<="1100";s <= "10";


wait for 1 ns; 
x<="1100";s <= "11";


wait for 1 ns; 
x<="1101";s <= "00";


wait for 1 ns; 
x<="1101";s <= "01";


wait for 1 ns; 
x<="1101";s <= "10";


wait for 1 ns; 
x<="1101";s <= "11";


wait for 1 ns; 
x<="1110";s <= "00";


wait for 1 ns; 
x<="1110";s <= "01";


wait for 1 ns; 
x<="1110";s <= "10";


wait for 1 ns; 
x<="1110";s <= "11";


wait for 1 ns; 
x<="1111";s <= "00";


wait for 1 ns; 
x<="1111";s <= "01";


wait for 1 ns; 
x<="1111";s <= "10";


wait for 1 ns; 
x<="1111";s <= "11";
wait for 1 ns; 


end process;
end architecture;   

    