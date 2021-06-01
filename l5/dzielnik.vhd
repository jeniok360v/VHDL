library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dzielnik is
  generic(u: natural := 1; d: natural := 1);
  port(
    clk_in:   in std_logic;
    clk_out:  out std_logic
  );
end dzielnik;

architecture behavioral of dzielnik is
  signal clk_tmp: std_logic := '0';
begin
  divide: process(clk_in)
  variable counter: natural := 0;
  begin
    if counter = u/4 then
      clk_tmp <= not clk_tmp;
    end if;
    if counter = (u+d)/4 then
      clk_tmp <= not clk_tmp;
      counter := 0;
    end if;
    counter := counter + 1;
  end process;

  clk_out <= clk_tmp;
end behavioral;