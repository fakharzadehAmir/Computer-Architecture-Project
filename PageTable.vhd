library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;
use work.my_package.all;


entity Page_Table is
  port (
  	read_bit : in std_logic;
    write_bit : in std_logic;
    vpn : in std_logic_vector(8 downto 0);
    ppn_to_be_written : in std_logic_vector(3 downto 0);
    ppn_to_be_read : out std_logic_vector(3 downto 0);
    hit : out std_logic
  );
end Page_Table; 



architecture Page_Table_behavioral of Page_Table is
signal Page_Table_ppns : Page_Table_ppns_type := (others => (others => '0'));  
signal Page_Table_valids: std_logic_vector(0 to 511) := (others => '0');
begin 
  process (vpn)  
  is 
  begin
    if read_bit = '1' then
      hit <= '0';
      if Page_Table_valids(to_integer(unsigned(vpn))) = '1' then
        ppn_to_be_read <= Page_Table_ppns(to_integer(unsigned(vpn)));
        hit <= '1';
      end if;
    end if;     
    if write_bit = '1' then
      Page_Table_valids(to_integer(unsigned(vpn))) <= '1';
      Page_Table_ppns(to_integer(unsigned(vpn))) <= ppn_to_be_written;
    end if;
  end process;
end  Page_Table_behavioral;
