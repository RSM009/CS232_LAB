library IEEE;
use IEEE.std_logic_1164.all;

entity tb is
end entity;

architecture tb of tb is
    signal x1, x2: std_logic;
    signal g: std_logic;
    component OR_Gate is
    port(x: in std_logic;
         y: in std_logic;
         z: out std_logic 
    );
    end component;
begin    
    dut_instances: OR_Gate
    port map(x =>x1,y=>x2, z=>g);
    process
    begin  
    x1 <='0';
    x2 <='0';
 
    wait for 1 ns; 

    x1 <='0';
    x2 <='1';

    wait for 1 ns; 

    x1 <='1';
    x2 <='0';

    wait for 1 ns; 

    x1 <='1';
    x2 <='1';
    wait for 1 ns; 
    end process;
end architecture;   

    