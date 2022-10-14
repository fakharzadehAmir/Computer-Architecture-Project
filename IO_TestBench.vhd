LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY IO_TestBench IS
END IO_TestBench;
 
ARCHITECTURE behavior OF IO_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT input_output
    PORT(
         index_in : IN  integer;
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal index_in : integer := 0;

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
	signal clk : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: input_output PORT MAP (
          index_in => index_in,
          data_out => data_out
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
			index_in <= 0;
      wait for clk_period*10;
		wait for 100 ns;	
			index_in <= 1;
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
