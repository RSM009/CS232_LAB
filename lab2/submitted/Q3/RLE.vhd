library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity RLE_Encoder is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           a : in  STD_LOGIC_VECTOR (7 downto 0);
           data_valid : out  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (7 downto 0));
end RLE_Encoder;

architecture Behavioral of RLE_Encoder is
    type state_type is (idle, processing, output_count, output_data, output_escape);
    
begin

    process(clk, rst)

	type buffer_t is array (0 to 9) of std_logic_vector(7 downto 0);
	variable buffer : buffer_t := (others => (others => '0')); 
    variable count_non_esc := 0;
	variable count_esc := 0;
	variable count := 0;
	variable count_non_esc_extra := 0;
	variable count_non_esc_div := 0;
	
	variable ESC : std_logic_vector(7 downto 0) := "00011011";
    variable curr_char : std_logic_vector(7 downto 0);
    variable previous_char : std_logic_vector(7 downto 0) := Null;
	-- variable buffer_arr : std_logic_vector(800 downto 0); 
    variable pointer : integer range 0 to 799 := 0;

	begin
		if rising_edge(clk)
			curr_char :=  a;
			count := count + 1;
			if curr_char = '0' then
			    if previous_char = ESC then
					buffer(0) := ESC;
					buffer(1) := count_esc+2;
					buffer(2) := ESC;
					if data_valid = '1' then
						for i in 0 to 2 loop
							z <= buffer(i);
						end loop;
						count_esc := 0;
				end if;

				if previous_char /= ESC then 
				count_non_esc_div =  
				   if count_non_esc >3 then 
						buffer(0) := ESC;
						buffer(1) := count_non_esc+2;
						buffer(2) := previous_char; 
						if data_valid = '1' then
							for i in 0 to 2 loop
								z <= buffer(i);
							end loop;
						end if;			
		            elsif count_non_esc >= 13
					        
				end if;

				  
			if previous_char = Null then
					previous_char := curr_char;	 
            	
			elsif curr_char = previous_char
				    if curr_char = ESC then
						count_esc := count_esc +1 ; 
						previous_char := curr_char;
				    elsif curr_char /= ESC 
					      count_non_esc = count_non_esc +1;
					      previous_char := curr_char;
			
				  
			elsif curr_char /= previous_char
			      if previous_char = ESC then
						buffer(0) := ESC;
						buffer(1) := count_esc+2;
						buffer(2) := ESC;
						if data_valid = '1' then
							for i in 0 to 2 loop
								z <= buffer(i);
							end loop;
							count_esc := 0;
							previous_char := curr_char;
						end if;	

                  elsif previous_char /= ESC
				   	    if data_valid = '1' then
				           z <= previous_char;
						   count_non_esc := 0;
						   previous_char := curr_char; 
				        end if;
				        
			end if; 
		end	if;	     
    end process;
      


