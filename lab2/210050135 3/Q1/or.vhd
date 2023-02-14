library IEEE;
use IEEE.std_logic_1164.all;

entity Or_Gate is
        port(x: in std_logic;
        y: in std_logic;
        z: out std_logic);
end entity;

-- define the behaviour

architecture behaviour of Or_Gate is
    signal tmp: std_logic;
begin 
   tmp <= x or y;
    z <=  tmp;
end architecture;

