LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY dlatchnbit IS
	GENERIC(
		n : IN NATURAL := 16
	);

	PORT(
		clk : IN STD_LOGIC;
		d : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		q, qn : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
	);
END;

ARCHITECTURE bhv OF dlatchnbit IS

	COMPONENT dlatch1bit IS
		PORT(
			clk, d : IN STD_LOGIC;
			q, qn : OUT STD_LOGIC
		);
	END COMPONENT;

BEGIN

	gen : FOR i IN 0 TO n-1 GENERATE
		dlatch : dlatch1bit PORT MAP (clk, d(i), q(i), qn(i));
	END GENERATE;

END;
