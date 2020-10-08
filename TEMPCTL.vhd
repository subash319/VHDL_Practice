-- This design 7*1 Mux, selects CURRENT_TEMP if DISPLAY_SELECT is 1
-- else it will be DESIRED_TEMP
--Add 2 new outputs to our entity ,  A_C_ON , and FURNACE_ON.
--Add logic for determining when the A_C_ON and FURNACE_ON are '1', and when they are '0'.

library IEEE;
use IEEE.std_logic_1164.all;
entity TEMPCTL is
	port(
	    	CURRENT_TEMP	: in bit_vector(6 downto 0);	
	    	DESIRED_TEMP	: in bit_vector(6 downto 0);	
	    	DISPLAY_SELECT	: in bit;
		COOL		: in bit;	
		HEAT		: in bit;
		CLK		: in bit;
		AC_ON		: out bit;	
		FURNACE_ON	: out bit;	
	    	TEMP_DISPLAY	: out bit_vector(6 downto 0));
end TEMPCTL;

architecture BEHAV of TEMPCTL is
--signals for the input registration
signal CURRENT_TEMP_REG		: bit_vector(6 downto 0);	
signal DESIRED_TEMP_REG		: bit_vector(6 downto 0);	
signal DISPLAY_SELECT_REG	: bit;
signal COOL_REG			: bit;	
signal HEAT_REG			: bit;
--signals for the output registration
signal AC_ON_REG		: bit;	
signal FURNACE_ON_REG		: bit;	
signal TEMP_DISPLAY_REG		: bit_vector(6 downto 0);

begin
--Process to register all the inputs
inp_reg:process(CLK)
begin
	if CLK'event and CLK = '1' then
		CURRENT_TEMP_REG	<=	CURRENT_TEMP;			
                DESIRED_TEMP_REG	<=      DESIRED_TEMP;	
                DISPLAY_SELECT_REG	<=      DISPLAY_SELECT;	
                COOL_REG		<=      COOL;		
		HEAT_REG		<=	HEAT;
	end if;			
end process;

tempctl_comb:process(CURRENT_TEMP_REG,DESIRED_TEMP_REG,DISPLAY_SELECT_REG,COOL_REG,HEAT_REG)
begin
	if DISPLAY_SELECT_REG = '1' then
		TEMP_DISPLAY_REG <= CURRENT_TEMP_REG;
	else
		TEMP_DISPLAY_REG <= DESIRED_TEMP_REG;
	end if;

	if COOL_REG = '1' and CURRENT_TEMP_REG > DESIRED_TEMP_REG then
		AC_ON_REG	<= '1';
	else
		AC_ON_REG	<= '0';
	end if;

	if HEAT_REG = '1' and CURRENT_TEMP_REG < DESIRED_TEMP_REG then
		FURNACE_ON_REG	<= '1';
	else
		FURNACE_ON_REG	<= '0';
	end if;

end process;

--process to register all the outputs

output_comb:process(CLK)
begin	
	if CLK'event and CLK = '1' then
		AC_ON       	<= AC_ON_REG;       
        	FURNACE_ON      <= FURNACE_ON_REG;  
        	TEMP_DISPLAY    <= TEMP_DISPLAY_REG;
	end if;
end process;
end BEHAV;


