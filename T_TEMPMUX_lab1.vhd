--Test bench for the lab1 entity thermostat
entity T_TEMPMUX is

end T_TEMPMUX;

architecture TEST of T_TEMPMUX is
component TEMPMUX is
	port(
	    CURRENT_TEMP	: in bit_vector(6 downto 0);	
	    DESIRED_TEMP	: in bit_vector(6 downto 0);	
	    DISPLAY_SELECT	: in bit;	
	    TEMP_DISPLAY	: out bit_vector(6 downto 0));
end component;

signal CURRENT_TEMP, DESIRED_TEMP : bit_vector(6 downto 0);
signal DISPLAY_SELECT 		  : bit;
signal TEMP_DISPLAY 		  : bit_vector(6 downto 0);
begin
--Instantiaton of the design, left one's are the pins(Formal pins)
--This is called explicit Instantation where it is position independent, always preferrable	
UUT: TEMPMUX port map (CURRENT_TEMP	=>	CURRENT_TEMP,				
                      DESIRED_TEMP	=>	DESIRED_TEMP,	
                      DISPLAY_SELECT	=>	DISPLAY_SELECT,	
	              TEMP_DISPLAY 	=>	TEMP_DISPLAY); 
process 
begin
	CURRENT_TEMP	<=	"1010101";	
	DESIRED_TEMP	<=	"1111000";
        DISPLAY_SELECT	<=	'0';
	wait for 10 ns;
        DISPLAY_SELECT	<=	'1';
	wait for 10 ns;
	wait;

end process;

end TEST;
