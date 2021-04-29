library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fixmux_b is
port (
  a,b,c : in bit;
  s0    : in bit;
  x     : out bit
);
end fixmux_b;

architecture fixmux_behav of fixmux_b is
begin
process (a,b,c, s0)
  variable sel: integer;
  begin
    if s0='0' then
	   sel := 0; -- or
	 else
	   sel := 1; -- and
	 end if;
	 case sel is 
	   when 0 =>
		    x <= (a or b or c) or  (a and b and c); -- (a or b or c)
	   when others =>
		    x <= (a or b or c) and (a and b and c); -- (a and b and c)
	 end case;
  end process;
end fixmux_behav;

	