--  A testbench has no ports.
entity fixmux_tb is
end fixmux_tb;

architecture behav of fixmux_tb is
  --  Declaration of the component that will be instantiated.
  component fixmux_b
    port (a, b, c, s0 : in bit; x : out bit);
  end component;

  --  Specifies which entity is bound with the component.
  for fixmux_0: fixmux_b use entity work.fixmux_b;
  signal a, b, c, s0, x : bit;
begin
  --  Component instantiation.
  fixmux_0: fixmux_b port map (a => a, b => b, c => c, s0 => s0, x => x);

  --  This process does the real job.
  process
    type pattern_type is record
      --  The inputs of the fixmux_b.
      a, b, c, s0 : bit;
      --  The expected outputs of the fixmux_b.
      x : bit;
    end record;
    --  The patterns to apply.
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
      (('0', '0', '0', '0', '0'),
       ('0', '0', '0', '1', '0'),
       ('0', '0', '1', '0', '1'),
       ('0', '0', '1', '1', '0'),
       ('0', '1', '0', '0', '1'),
       ('0', '1', '0', '1', '0'),
       ('0', '1', '1', '0', '1'),
       ('0', '1', '1', '1', '0'),
       ('1', '0', '0', '0', '1'),
       ('1', '0', '0', '1', '0'),
       ('1', '0', '1', '0', '1'),
       ('1', '0', '1', '1', '0'),
       ('1', '1', '0', '0', '1'),
       ('1', '1', '0', '1', '0'),
       ('1', '1', '1', '0', '1'),
       ('1', '1', '1', '1', '1'));      
  begin
    --  Check each pattern.
    for i in patterns'range loop
      --  Set the inputs.
      a <= patterns(i).a;
      b <= patterns(i).b;
      c <= patterns(i).c;
      s0 <= patterns(i).s0;
      --  Wait for the results.
      wait for 1 ns;
      --  Check the outputs.
      assert x = patterns(i).x
        report "bad carry out value" severity error;
    end loop;
    assert false report "end of test" severity note;
    --  Wait forever; this will finish the simulation.
    wait;
  end process;

end behav;