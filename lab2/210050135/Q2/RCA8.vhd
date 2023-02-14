library IEEE;
use IEEE.std_logic_1164.all;

entity RCA8 is
    port(a, b: in std_logic_vector(7 downto 0);
    sum: out std_logic_vector(7 downto 0);
    cout: out std_logic);
end entity;

architecture Structural of RCA8 is

    component FullAdder is
      Port ( a, b : in  STD_LOGIC;
             cin : in  STD_LOGIC;
             sum : out  STD_LOGIC;
             cout : out  STD_LOGIC);
    end component;
    
    signal c : STD_LOGIC_VECTOR(7 downto 0);
    
    begin
    
    U0: FullAdder 
    port map(a(0), b(0), '0', sum(0), c(1));
    U1: FullAdder 
    port map(a(1), b(1), c(1), sum(1), c(2));
    U2: FullAdder 
    port map(a(2), b(2), c(2), sum(2), c(3));
    U3: FullAdder 
    port map(a(3), b(3), c(3), sum(3), c(4));
    U4: FullAdder 
    port map(a(4), b(4), c(4), sum(4), c(5));
    U5: FullAdder 
    port map(a(5), b(5), c(5), sum(5), c(6));
    U6: FullAdder 
    port map(a(6), b(6), c(6), sum(6), c(7));
    U7: FullAdder 
    port map(a(7), b(7), c(7), sum(7), cout);
    
    end Structural;
    
    
    
    