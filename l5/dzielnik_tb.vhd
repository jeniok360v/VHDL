library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dzielnik_tb is
end dzielnik_tb;

architecture behavior of dzielnik_tb is
  component dzielnik
    generic(u: natural := 1; d: natural := 1);
    port (
      clk_in:   in std_logic;
      clk_out:  out std_logic
    );
  end component;


  signal clk_in: std_logic := '0';
  signal clk_out_Mhz_50: std_logic;
  signal clk_out_hz_100: std_logic;
  signal clk_out_hz_1100: std_logic;
  constant clk_period: time := 8 ns;

begin
  hz_100: dzielnik 
  generic map(u => 5000000, d => 5000000)
  port map(
    clk_in => clk_in,
    clk_out => clk_out_hz_100
  );

  -- relative error: 0.0003%
  hz_1100: dzielnik
  generic map(u => 454545, d => 454545)
  port map(
    clk_in => clk_in,
    clk_out => clk_out_hz_1100
  );

  Mhz_50: dzielnik 
  generic map(u => 10, d => 10)
  port map(
    clk_in => clk_in,
    clk_out => clk_out_Mhz_50
  );

  clk_process: process
  begin
    clk_in <= '0';
    wait for clk_period/2;
    clk_in <= '1';
    wait for clk_period/2;
  end process;

end;