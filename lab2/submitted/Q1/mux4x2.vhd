
-- A "mux4x2" is a digital circuit that has 4 input lines, 2 select lines, and 1 output line. 
-- The circuit is designed to select one of the 4 input lines based on the values of the select lines and output the selected input line.
-- Specifically, the mux4x2 circuit will take a 4-bit input and two select bits to generate a 1-bit output.
--  The select bits are used to select which of the 4 input bits is transmitted to the output. Depending on the combination of select bits,
--   one of the four input bits is transmitted to the output.
-- For example, if the select bits are "00", the first input bit is transmitted to the output. If the select bits are "01"
-- , the second input bit is transmitted to the output, and so on. The implementation of the mux4x2 circuit typically involves a 
-- combination of AND gates, OR gates, and NOT gates to control the selection of input bits.
-- Mux4x2 circuits are commonly used in digital systems to switch between multiple input signals and select the desired 
-- signal based on a set of control signals. They are often used in processors, memory systems, and other digital circuits.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- This entity declares a 4x2 multiplexer with 4 inputs D and 2 select lines S, and 1 output Y
entity mux4x2 is
    port(D: in std_logic_vector (3 downto 0);
    S: in std_logic_vector(1 downto 0);
    Y: out std_logic);
end mux4x2;    

-- Architecture
-- This architecture declaration specifies the behavior of the mux4x2 entity.
--  It declares various signals used in the design, and instantiates 3 components: AND_Gate, Or_Gate, and Not_Gate.
--  It assigns various signals based on the inputs and outputs of these components.

architecture Behavioral of mux4x2 is
    -- signal x1, x2: std_logic;
    -- signal g: std_logic;
    component AND_Gate is
    port(x: in std_logic;    
         y: in std_logic;
         z: out std_logic 
    );     
    end component; 
    component Or_Gate is
        port(x: in std_logic;
             y: in std_logic;
             z: out std_logic 
        );     
    end component;     
            
    signal ns0, ns1 : std_logic;
    signal first_up_0,first_up_1,first_up_2,first_up_3 : std_logic;
    -- signal first_down,second_down : std_logic;
    signal first_final_d0,first_final_d1,first_final_d2,first_final_d3 : std_logic;
    signal last_d0_d3,last_d1_d2 :std_logic;
    signal result :std_logic;
    -- signal first_up,second_up : std_logic;
    component Not_Gate is
    port(x: in std_logic;    
        --  y: in std_logic;
         z: out std_logic 
    );     
    end component;

begin
	-- Y(0) <= (D(0) and (not S(0))) or (D(1) and S(0));
	-- Y(1) <= (D(2) and (not S(1))) or (D(3) and S(1));
    -- These are the declarations for the AND_Gate, Or_Gate,
    --  and Not_Gate components used in the architecture. 
    -- Each component takes in certain input signals and produces an output signal.
    notgate : Not_Gate 
    port map (x=> S(0), z => ns0);
    notgate1 : Not_gate
    port map (x => S(1), z=> ns1);
   

    d0_and_nots0 : AND_Gate
    port map (x => D(0) ,y => ns0, z => first_up_0);
    d0_and_nots0_and_nots1 : AND_Gate
    port map (x => first_up_0 ,y => ns1, z => first_final_d0);
    
    d1_and_s0 : AND_Gate
    port map (x => D(1) ,y => S(0), z => first_up_1);
    d1_and_s0_and_nots1 : AND_Gate
    port map (x => first_up_1 ,y => ns1, z => first_final_d1);
   

    d2_and_nots0 : AND_Gate
    port map (x => D(2) ,y => ns0, z => first_up_2);
    d2_and_nots0_and_s1 : AND_Gate
    port map (x => first_up_2 ,y => S(1), z => first_final_d2);
   
    d3_and_s0 : AND_Gate
    port map (x => D(3) ,y => S(0), z => first_up_3);
    d3_and_s0_and_s1 : AND_Gate
    port map (x => first_up_3 ,y => S(1), z => first_final_d3);
    
    d0_d3_up : Or_Gate
    port map (x => first_final_d0 ,y => first_final_d3 ,z => last_d0_d3);
   
    
    d1_d2_up : Or_Gate
    port map (x => first_final_d1 ,y => first_final_d2, z => last_d1_d2);

    final_result : Or_Gate
    port map (x => last_d0_d3 ,y => last_d1_d2, z => Y);

end Behavioral;    








