library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;
use work.my_package.all;


-- 13 pages of data in memory
-- remaining space for page table
	

entity Memory is
	port ( 
		read_bit : in std_logic;
		write_bit : in std_logic; 
		physical_address : in std_logic_vector(10 downto 0);
		write_data_from_disk : in page_type;
		data_to_be_read : out double_word_data_Type;
		output_ppn : out std_logic_vector(3 downto 0)
	);
end Memory; 



architecture Memory_behavioral of Memory is
signal data : memory_data_blocks_type := (others => (others => (others => (others => '0'))));
signal idx : integer := 0;
begin 
	process (physical_address)	
	is 
		variable page_offset : std_logic_vector(6 downto 0);
		variable ppn : std_logic_vector(3 downto 0);  
		variable page : page_type; 
		variable word_choosing_offset : integer;
	begin
		if write_bit = '1' then
			data(idx) <= write_data_from_disk;
			output_ppn <= std_logic_vector(to_unsigned(idx, 4));
            idx <= (idx + 1) mod 13;
        end if;
		if read_bit = '1' then
			page_offset := physical_address(6 downto 0);
			ppn := physical_address(10 downto 7);
			page := data(to_integer(unsigned(ppn)));
			word_choosing_offset := to_integer(unsigned(page_offset(6 downto 3)));
			data_to_be_read <= page(word_choosing_offset);
		end if;
	end process;
end	Memory_behavioral;

