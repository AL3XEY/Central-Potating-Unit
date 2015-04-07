LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY subbernbit IS
	GENERIC(
		n : IN NATURAL := 16
	);

	PORT(
		a, b : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		ci : IN STD_LOGIC; --carry in
		q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		co : OUT STD_LOGIC --carry out
	);
END;

ARCHITECTURE bhv OF subbernbit IS

	COMPONENT minusnbit IS
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

	SIGNAL tmp_b : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
	SIGNAL tmp_co : STD_LOGIC_VECTOR(n-1 DOWNTO 0);

BEGIN

	minus : minusnbit GENERIC MAP (n) PORT MAP (b, tmp_b);

	add : fulladdernbit GENERIC MAP (n) PORT MAP (a, tmp_b, ci, q, co);

END;
