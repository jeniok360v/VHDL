library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Xand_tb is
END Xand_tb;

architecture behavior of Xand_tb is
	component Xand is
		generic (width : integer);
		port ( 	clk : in std_logic;
				A,B : in std_logic_vector(width-1 downto 0);
				C 	: out std_logic_vector(width-1 downto 0)
		);
	end component;

	signal clk : std_logic := '0';
	signal A : std_logic_vector(7 downto 0) := (others => '0');
	signal B : std_logic_vector(7 downto 0) := (others => '0');
	signal C : std_logic_vector(7 downto 0) := (others => '0');
begin
	uut: Xand generic map (width => 8)
	port map(
		clk => clk,
		A => A,
		B => B,
		C => C
	);

	process
	begin
		wait for 100 ns;

		A <= "11110000";
		B <= "00001111";
		wait for 1 ns;
		assert c = "00000000"
			report "wrong c value" severity error;

		A <= "11111101";
		B <= "11101011";
		wait for 1 ns;
		assert c = "11101001"
			report "wrong c value" severity error;

		A <= "11100111";
		B <= "11110111";
		wait for 1 ns;
		assert c ="11100111"
			report "wrong c value" severity error;

		wait;
	end process;
end behavior;