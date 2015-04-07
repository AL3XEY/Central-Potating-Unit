LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY alunbit IS
	GENERIC(
		n : IN NATURAL := 16
	);

	PORT(
		a, b : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0); --operation selection
		overflow : OUT STD_LOGIC; --if an overflow is detected
		q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
	);
END;

ARCHITECTURE bhv OF alunbit IS

	COMPONENT fulladdernbit IS
		GENERIC(
			n : IN NATURAL := 16
		);

		PORT(
			a, b : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			ci : IN STD_LOGIC; --carry in --always equals to '0' here
			q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			co : OUT STD_LOGIC --carry out --if co is equal to 1, overflow
		);
	END COMPONENT;

	COMPONENT subbernbit IS
		GENERIC(
			n : IN NATURAL := 16
		);

		PORT(
			a, b : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			ci : IN STD_LOGIC; --carry in --always equals to '0' here
			q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			co : OUT STD_LOGIC --carry out --if co is equal to 1, overflow
		);
	END COMPONENT;

	COMPONENT multnbit IS
		GENERIC(
			n : IN NATURAL := 16
		);

		PORT(
			a, b : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			overflow : OUT STD_LOGIC --if an overflow is detected
		);
	END COMPONENT;

	SIGNAL add_q, sub_q, mul_q : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
	SIGNAL add_ovf, sub_ovf, mul_ovf : STD_LOGIC;

BEGIN

	add : fulladdernbit GENERIC MAP (n) PORT MAP (a, b, '0', add_q, add_ovf);

	sub : subbernbit GENERIC MAP (n) PORT MAP (a, b, '0', sub_q, sub_ovf);

	mul : multnbit GENERIC MAP (n) PORT MAP (a, b, mul_q, mul_ovf);

	WITH sel SELECT q <=
		add_q WHEN "00",
		sub_q WHEN "01",
		mul_q WHEN "10",
		(OTHERS => 'X') WHEN OTHERS;

	WITH sel SELECT overflow <=
		add_ovf WHEN "00",
		sub_ovf WHEN "01",
		mul_ovf WHEN "10",
		'X' WHEN OTHERS;

END;
