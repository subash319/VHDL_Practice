--Test bench for the lab1 entity thermostat
entity T_TEMPMUX is

end T_TEMPMUX;

architecture TEST of T_TEMPMUX is
component TEMPMUX is
	port(
	    	CURRENT_TEMP	: in bit_vector(6 downto 0);	
	    	DESIRED_TEMP	: in bit_vector(6 downto 0);	
	    	DISPLAY_SELECT	: in bit;
		COOL		: in bit;	
		HEAT		: in bit;	
		AC_ON		: out bit;	
		FURNACE_ON	: out bit;	
	    	TEMP_DISPLAY	: out bit_vector(6 downto 0));
end component;

signal CURRENT_TEMP, DESIRED_TEMP : bit_vector(6 downto 0);
signal DISPLAY_SELECT 		  : bit;
signal COOL	 		  : bit;
signal HEAT 			  : bit;
signal TEMP_DISPLAY 		  : bit_vector(6 downto 0);
signal AC_ON 			  : bit;
signal FURNACE_ON 		  : bit;

begin
--Instantiaton of the design, left one's are the pins(Formal pins)
--This is called explicit Instantation where it is position independent, always preferrable	
UUT: TEMPMUX port map (CURRENT_TEMP	=>	CURRENT_TEMP,				
                      DESIRED_TEMP	=>	DESIRED_TEMP,	
                      DISPLAY_SELECT	=>	DISPLAY_SELECT,
		      COOL		=>	COOL,			
		      HEAT		=>	HEAT,		
		      AC_ON		=>	AC_ON,		
		      FURNACE_ON	=>	FURNACE_ON,	
	              TEMP_DISPLAY 	=>	TEMP_DISPLAY); 
process 
begin
	CURRENT_TEMP	<=	"1010101";	
	DESIRED_TEMP	<=	"1111000";
        DISPLAY_SELECT	<=	'0';
	HEAT		<= 	'0';
	COOL		<=	'0';
	wait for 10 ns;
        DISPLAY_SELECT	<=	'1';
	HEAT		<=	'1';
	COOL		<=	'1';
	wait for 10 ns;
	CURRENT_TEMP	<=	"1111111";	
	DESIRED_TEMP	<=	"1111000";
        DISPLAY_SELECT	<=	'0';
	HEAT		<= 	'0';
	COOL		<=	'0';
	wait for 10 ns;
	COOL		<=	'1';
	wait for 10 ns;
	CURRENT_TEMP	<=	"1111100";
	DISPLAY_SELECT	<=	'0';
	wait for 10 ns;
	CURRENT_TEMP	<=	"1111111";
	wait;
end process;
	
end TEST;	      
