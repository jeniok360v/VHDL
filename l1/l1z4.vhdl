entity logic_circ is
  port (a, b : in bit; c : in bit; x : out bit; y : out bit);
end logic_circ;

architecture rtl of logic_circ is
begin
  x <= not(a or b) nor not(b nor c);
  y <= not(b nor c) and not(a xor c);
end rtl;