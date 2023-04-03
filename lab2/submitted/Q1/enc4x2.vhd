library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity encoder4x2 is
    port(I: in std_logic_vector (3 downto 0);
    Y: out std_logic_vector(1 downto 0)
    );
    end entity;
    architecture Behavioral of encoder4x2 is
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
    -- signal ns0, ns1 : std_logic;
    -- signal or_2_3,or_1_3,first_up_1,first_up_2 : std_logic;     

    begin
        I3_I2 : Or_Gate
        port map (x => I(3) ,y => I(2) ,z =>Y(1));

        I3_I1 : Or_Gate
        port map (x => I(3) ,y => I(1) ,z =>Y(0));

end Behavioral;

-- -- An "encoder4x2" is a digital circuit that has 4 input lines and 2 output lines.
--  The circuit is designed to encode the input into a binary code based on which input line is activated.
--   Specifically, the circuit will activate one of the output lines depending on which of the input lines is active.
-- -- In other words, the encoder4x2 will take a 4-bit input and generate a 2-bit output based on which input bit is active.
--  The output will be a binary code that represents the position of the active input line. For example, 
--  if the third input line is active, the output will be the binary value "10", indicating that the active line is in position 3.
--   If multiple input lines are active, the encoder will prioritize the lowest-numbered input line that is active.
-- -- The implementation of the encoder4x2 circuit may vary, but it typically involves a combination of
--  AND gates and OR gates to determine which input line is active and generate the appropriate output code.



