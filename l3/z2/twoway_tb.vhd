LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY twoway_tb IS
END twoway_tb;
 
ARCHITECTURE behavior OF twoway_tb IS 
 
    -- UUT (Unit Under Test)
    COMPONENT twoway
    PORT(
          clk  : IN  std_logic;
          q    : INOUT  STD_LOGIC_VECTOR(7 downto 0)
        );
    END COMPONENT;
    
   -- input signals
   signal clk : std_logic := '0';

   -- input/output signal
   signal qq : STD_LOGIC_VECTOR(7 downto 0);

   -- set clock period 
   constant clk_period : time := 20 ns;
 
BEGIN
	-- instantiate UUT
   uut: twoway PORT MAP (
          clk => clk,
          q   => qq
        );
   
   -- clock management process
   -- no sensitivity list, but uses 'wait'
	clk_process : process
  begin
    clk <= not clk ;
    wait for clk_period/2;
  end process;
  
  stimulate_process : process
  begin
    wait;
  end process;
END;