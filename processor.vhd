library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;



entity Processor is 
	port (									  
		read_bit : in std_logic;
		index : in integer;
		virtual_address : out std_logic_vector(15 downto 0)
	);
end Processor;	  


architecture Processor_behavioral of Processor is
begin  
	process (index)
	is	
	type virtual_address_array_type is array (0 to 4) of std_logic_vector(15 downto 0);
	variable all_virtual_addresses : virtual_address_array_type := ("1011110111000110",
																	"1001000100101000",
																	"1000111010100011",
																	"0001011011010001",
																	"1011110001111100");
	begin 
		if read_bit = '1' then
			virtual_address <= all_virtual_addresses(index);	
		end if;
	end process;
end	Processor_behavioral;