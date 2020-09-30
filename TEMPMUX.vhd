-- This design 7*1 Mux, selects CURRENT_TEMP if DISPLAY_SELECT is 1
-- else it will be DESIRED_TEMP
--Add 2 new outputs to our entity ,  A_C_ON , and FURNACE_ON.
--Add logic for determining when the A_C_ON and FURNACE_ON are '1', and when they are '0'.

library IEEE;
use IEEE.std_logic_1164.all;
entity TEMPMUX is
	port(
	    	CURRENT_TEMP	: in bit_vector(6 downto 0);	
	    	DESIRED_TEMP	: in bit_vector(6 downto 0);	
	    	DISPLAY_SELECT	: in bit;
		COOL		: in bit;	
		HEAT		: in bit;	
		AC_ON		: out bit;	
		FURNACE_ON	: out bit;	
	    	TEMP_DISPLAY	: out bit_vector(6 downto 0));
end TEMPMUX;

architecture BEHAV of TEMPMUX is
begin

process(CURRENT_TEMP,DESIRED_TEMP,DISPLAY_SELECT,COOL,HEAT)
begin
	if DISPLAY_SELECT = '1' then
		TEMP_DISPLAY <= CURRENT_TEMP;
	else
		TEMP_DISPLAY <= DESIRED_TEMP;
	end if;

	if COOL = '1' and CURRENT_TEMP > DESIRED_TEMP then
		AC_ON	<=	'1';
	else
		AC_ON	<=	'0';
	end if;

	if HEAT = '1' and CURRENT_TEMP < DESIRED_TEMP then
		FURNACE_ON	<=	'1';
	else
		FURNACE_ON	<=	'0';
	end if;

end process;

end BEHAV;


