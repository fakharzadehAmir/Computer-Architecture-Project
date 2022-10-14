library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;  
use work.my_package.all;



entity Direct_Map_Cache is
	port (
		read_bit : in std_logic;
		write_bit : in std_logic; 
		physical_address : in std_logic_vector(10 downto 0);
		write_data_from_memory : in double_word_data_Type;
		data_to_be_read : out std_logic_vector(7 downto 0);
		hit : out std_logic
	);
end Direct_Map_Cache;  


architecture Direct_Map_Cache_behavioral of Direct_Map_Cache is
signal cache_valids : std_logic_vector(31 downto 0) := (others => '0');
signal cach_data : cach_data_blocks_type := (others => (others => (others => '0')));	 
signal chache_tags : chache_tag_data_type := (others => (others => '0'));
begin
	process (physical_address)
	is
		variable byte_offset : std_logic_vector(1 downto 0) := physical_address(1 downto 0);
		variable word_offset : std_logic := physical_address(2);
		variable index : std_logic_vector(4 downto 0) := physical_address(7 downto 3);
		variable tag : std_logic_vector(2 downto 0) := physical_address(10 downto 8);
		variable block_data : double_word_data_Type;
		variable word_data : std_logic_vector(31 downto 0);
	begin
		if read_bit = '1' then
			if cache_valids(to_integer(unsigned(index))) = '0' then
				cache_valids(to_integer(unsigned(index))) <= '1';
				hit <= '0';
			elsif chache_tags(to_integer(unsigned(index))) = tag then
				hit <= '1';
				block_data := cach_data(to_integer(unsigned(index)));
				if word_offset = '0' then
					word_data := block_data(0);
				else
					word_data := block_data(1);
				end if;
				data_to_be_read <= word_data(to_integer(unsigned(byte_offset)) * 8 + 7 downto to_integer(unsigned(byte_offset)) * 8);
			else
				hit <= '0';
			end if;	
		end if;
		if write_bit = '1' then
			cache_valids(to_integer(unsigned(index))) <= '1';
			cach_data(to_integer(unsigned(index))) <= write_data_from_memory;
			chache_tags(to_integer(unsigned(index))) <= tag;
		end if;
	end process;
	
end	Direct_Map_Cache_behavioral;	




