-- This design 7*1 Mux, selects CURRENT_TEMP if DISPLAY_SELECT is 1
-- else it will be DESIRED_TEMP
library IEEE;
use IEEE.std_logic_1164.all;
entity TEMPMUX is
	port(
	    	CURRENT_TEMP	: in bit_vector(6 downto 0);	
	    	DESIRED_TEMP	: in bit_vector(6 downto 0);	
	    	DISPLAY_SELECT	: in bit;	
	    	TEMP_DISPLAY	: out bit_vector(6 downto 0));
end TEMPMUX;

architecture BEHAV of TEMPMUX is
begin

process(CURRENT_TEMP,DESIRED_TEMP,DISPLAY_SELECT)
begin
	if DISPLAY_SELECT = '1' then
		TEMP_DISPLAY <= CURRENT_TEMP;
	else
		TEMP_DISPLAY <= DESIRED_TEMP;
	end if;
end process;

end BEHAV;


