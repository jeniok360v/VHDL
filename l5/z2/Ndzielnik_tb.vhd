library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Ndzielnik_tb is
end Ndzielnik_tb;

architecture behavior of Ndzielnik_tb is
  component Ndzielnik
    generic(N: natural := 1);
    port (
      clk_in:   in std_logic;
      clk_out:  out unsigned(N+1 downto 0)
    );
  end component;


  signal clk_in: std_logic := '0';
  signal clk_out: unsigned(10 downto 0);
  signal n_clk_10, n_clk_1, n_clk_2, n_clk_3, 
                   n_clk_4, n_clk_5, n_clk_6,
                   n_clk_7, n_clk_8, n_clk_9: std_logic;

  constant clk_period: time := 8 ns;

begin
  clk_uut: Ndzielnik
  generic map(N => 9)
  port map(
    clk_in => clk_in,
    clk_out => clk_out
  );

  n_clk_1 <= clk_out(1); 
  n_clk_2 <= clk_out(2);
  n_clk_3 <= clk_out(3); 
  n_clk_4 <= clk_out(4); 
  n_clk_5 <= clk_out(5);
  n_clk_6 <= clk_out(6);
  n_clk_7 <= clk_out(7); 
  n_clk_8 <= clk_out(8);
  n_clk_9 <= clk_out(9);
  n_clk_10 <= clk_out(10); 

  clk_process: process
  begin
    clk_in <= '0';
    wait for clk_period/2;
    clk_in <= '1';
    wait for clk_period/2;
  end process;

end;