LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY minusnbit IS
	GENERIC(
		n : IN NATURAL := 16
	);

	PORT(
		a : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
	);
END;

ARCHITECTURE bhv OF minusnbit IS

	COMPONENT notnbit IS
		GENERIC(
			n : IN NATURAL := 16
		);

		PORT(
			a : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT fulladdernbit IS
		GENERIC(
			n : IN NATURAL := 16
		);

		PORT(
			a, b : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			ci : IN STD_LOGIC; --carry in
			q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			co : OUT STD_LOGIC --carry out
		);
	END COMPONENT;

	SIGNAL tmp_a, tmp_b : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
	SIGNAL tmp_co : STD_LOGIC;

BEGIN

	nottobe : notnbit GENERIC MAP (n) PORT MAP (a, tmp_a);

	tmp_b(n-1 DOWNTO 1) <= (OTHERS => '0');
	tmp_b(0) <= '1';

	add : fulladdernbit GENERIC MAP (n) PORT MAP (tmp_a, tmp_b, '0', q, tmp_co);

END;
