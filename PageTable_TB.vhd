LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY PageTable_TB IS
END PageTable_TB;
 
ARCHITECTURE behavior OF PageTable_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Page_Table
    PORT(
         read_bit : IN  std_logic;
         write_bit : IN  std_logic;
         vpn : IN  std_logic_vector(8 downto 0);
         ppn_to_be_written : IN  std_logic_vector(3 downto 0);
         ppn_to_be_read : OUT  std_logic_vector(3 downto 0);
         hit : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal read_bit : std_logic := '0';
   signal write_bit : std_logic := '0';
   signal vpn : std_logic_vector(8 downto 0) := (others => '0');
   signal ppn_to_be_written : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ppn_to_be_read : std_logic_vector(3 downto 0);
   signal hit : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
	signal clk : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Page_Table PORT MAP (
          read_bit => read_bit,
          write_bit => write_bit,
          vpn => vpn,
          ppn_to_be_written => ppn_to_be_written,
          ppn_to_be_read => ppn_to_be_read,
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
		vpn <= "100100010";
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
