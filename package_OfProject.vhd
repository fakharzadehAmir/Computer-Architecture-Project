library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;


package my_package is 													
	type double_word_data_Type is array (0 to 1) of std_logic_vector(31 downto 0);	
	type page_type is array (0 to 15) of double_word_data_Type;	
	type memory_data_blocks_type is array (0 to 12) of page_type;
	type cach_data_blocks_type is array (0 to 31) of double_word_data_Type;
	type chache_tag_data_type is array (0 to 31) of std_logic_vector(2 downto 0);
	type two_way_set_associative_cache_valids_type is array (0 to 31) of std_logic_vector(1 downto 0);
	type tag2set is array (0 to 1) of std_logic_vector(2 downto 0);
	type two_way_set_associative_cache_tags_type is array (0 to 31) of tag2set;
	type cache2set is array (0 to 1) of double_word_data_Type;
	type two_way_set_associative_cache_data_type is array (0 to 31) of cache2set;
	type TLB_ppns_type is array (0 to 47) of std_logic_vector(3 downto 0); 
	type TLB_tags_type is array (0 to 47) of std_logic_vector(8 downto 0); 
	type Page_Table_ppns_type is array (0 to 511) of std_logic_vector(3 downto 0);
end my_package;

				