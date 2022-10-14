LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY Processor_TB IS
END Processor_TB;
 
ARCHITECTURE behavior OF Processor_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Processor
    PORT(
         read_bit : IN  std_logic;
         index : IN  integer;
         virtual_address : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal read_bit : std_logic := '0';
   signal index : integer := 0;

 	--Outputs
   signal virtual_address : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
	signal clk : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Processor PORT MAP (
          read_bit => read_bit,
          index => index,
          virtual_address => virtual_address
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
			read_bit <= '1';
			index <= 1;
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
