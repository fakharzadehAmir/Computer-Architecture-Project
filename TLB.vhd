library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all; 
use work.my_package.all;



entity fully_associative_TLB is 	
	port (
		read_bit : in std_logic;
		write_bit : in std_logic;
		vpn : in std_logic_vector(8 downto 0); 
		ppn_to_be_added : in std_logic_vector(3 downto 0);
		ppn : out std_logic_vector(3 downto 0);
		hit : out std_logic
	);
end fully_associative_TLB;	


architecture TLB_behavioral of fully_associative_TLB is
signal TLB_ppns : TLB_ppns_type := (others => ( others => '0' ));
signal TLB_tags : TLB_tags_type := (others => ( others => '0' ));
signal TLB_valids : std_logic_vector(47 downto 0);
signal index : integer := 0;
begin
	process (vpn)
	is
	begin
		if read_bit = '1' then
			hit <= '0';
			for i in 0 to 47 loop
				if TLB_valids(i) = '1' and TLB_tags(i) = vpn then
					ppn <= TLB_ppns(i);
					hit<= '1';
					exit;
				end if;
			end loop;
		end if;
		if write_bit = '1' then
			TLB_valids(index) <= '1';
			TLB_tags(index) <= vpn;
			TLB_ppns(index) <= ppn_to_be_added;
			index <= (index + 1) mod 48;
		end if;
	end process;
end	TLB_behavioral;	
