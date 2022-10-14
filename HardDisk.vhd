library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all; 
use work.my_package.all;



entity Storage is 	
	port (
		read_bit : in std_logic;
		storage_address : in std_logic_vector(8 downto 0);   	
		page : out page_type									
	);
end Storage;	  



architecture Storage_behavioral of Storage is
begin  
	process (storage_address)
	is	
		variable index : integer := to_integer(unsigned(storage_address));	
		type all_pages_array is array (0 to 2) of page_type; 
		variable data : all_pages_array := ((("01100110101111000000001001101111", "11001000111111001100110001010010"), 
											 ("10101111001001001000010001001101", "11000001001010001000101000011010"), 
										     ("10111101111110101001100010000110", "01010100111110110110110100000000"), 
									         ("00011010101111000001000101010100", "00011000010010001010100110111001"), 
										     ("10100010110100011010001011110101", "01100100110110010010010100101011"), 
										     ("00001000000011000110101101111111", "01000111011111101111010110011110"), 
										     ("10000011101001100111110000100101", "11000100010011111110100111111111"), 
										     ("00001010001100111110000111000001", "10110100110011111111000000010100"), 
										     ("11000100001000010111010000111001", "00000101011010001100011100101111"), 
										     ("10011001000010111110111001011101", "10000001010000101110000011100001"), 
										     ("10100010110101001010010011001100", "10110011110000110100010000000110"), 
										     ("01111011110100111011110110100110", "11111110010111101010100010000100"), 
										     ("10101100001101100101110111001100", "01111101011100100110100001101000"), 
										     ("11011001100111110001111111001101", "00010111100101101100100010111100"),
										     ("11000000110110110100010100011101", "10111111001100101001010010000101"), 
										     ("00110110111010011010011100000110", "01011101011100101010010011101011")),  
									        (("10100100110010001101101010010000", "00111000011011101111010100101101"), 
								             ("10100110000101010000000000100000", "11100001010010110010000110100101"), 
										     ("10100000000000101110100010100000", "11111110000000101110101101001111"), 
										     ("10011000010010000110100101111000", "10010001011110001010100001001011"), 
										     ("01000010000000100011100001101101", "01010000010011110011110111011101"), 
										     ("10111011001010001100110010001010", "10111101110100010011110111000000"), 
										     ("11101001000010101101011111000110", "11001101011101111001101101001110"), 
										     ("01100111111011101100000111010010", "11000011110000101011101101000100"), 
										     ("11001110110000001100100010111111", "11000100111101110011011100001111"), 
										     ("11010010000100000111000101001101", "11111110101010000000000001111001"), 
										     ("11101110001100101010011000111110", "11011010111110101100101111110110"), 
										     ("11011000110001111000000111110101", "00010011110000100010001111110001"), 
										     ("01000100010010101101110111111111", "10101010011101010111111010001000"), 
										     ("11100100011010001110001001001100", "01111001100000111011010000110001"), 
										     ("00011101000110010110000010011100", "11110011000110001011010111110100"), 
										     ("10101010011010100110001011111101", "00110011010110110000011010100010")), 
									        (("01000100010110001111111111011110", "01101010110111111100010100101101"), 
										     ("01011001001101010010011100000011", "10001001101101110000001011110111"), 
										     ("11101110100011000010010000010111", "00000100100100101110000010000010"), 
										     ("10001000011011101011111111101001", "10110010010000111111110011101010"), 
										     ("10110000000100110011010001011010", "00001111000011111101100010101000"), 
										     ("01001010011100000100001011110110", "11111101101111011010100010101110"), 
										     ("01001100101001100111111111110011", "00110000000101101001000111111011"), 
										     ("10010101100100011001111011001001", "10000010110111110011110110110001"), 
										     ("01000100110010011010001101100110", "11101000010000011011000000000110"), 
										     ("11011000001000001010110010101001", "01010001101001110001110010100000"), 
										     ("10101000011011000011101101001101", "01101101010100001111101010110100"), 
										     ("01111101001001100110010110100011", "10011001010110100000110110110000"), 
										     ("10111001100010101111110110110100", "01011011110110100010100100110100"), 
										     ("01101011010111100100100111010010", "11000110010111000101001100101111"), 
										     ("00110001100100101010001010101011", "11110110000110111011111111001101"), 
										     ("11001011101001101101000011010100", "10100110110101101010001100011001")));							
	begin
		if read_bit = '1' then
		 page <= data(index); 
		end if;
	end process;
end	Storage_behavioral;