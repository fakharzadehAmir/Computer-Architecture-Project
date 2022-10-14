LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.my_package.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Cache_TB IS
END Cache_TB;
 
ARCHITECTURE behavior OF Cache_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Direct_Map_Cache
    PORT(
         read_bit : IN  std_logic;
         write_bit : IN  std_logic;
         physical_address : IN  std_logic_vector(10 downto 0);
         write_data_from_memory : IN  double_word_data_Type;
         data_to_be_read : OUT  std_logic_vector(7 downto 0);
         hit : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal read_bit : std_logic := '0';
   signal write_bit : std_logic := '0';
   signal physical_address : std_logic_vector(10 downto 0) := (others => '0');
   signal write_data_from_memory : double_word_data_Type := (others=>(others => '0'));

 	--Outputs
   signal data_to_be_read : std_logic_vector(7 downto 0);
   signal hit : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
	signal clk : std_logic;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Direct_Map_Cache PORT MAP (
          read_bit => read_bit,
          write_bit => write_bit,
          physical_address => physical_address,
          write_data_from_memory => write_data_from_memory,
          data_to_be_read => data_to_be_read,
          hit => hit
        );

   -- Clock process definitions
	clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		write_bit <= '1';
		physical_address <= "10010001001";
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
