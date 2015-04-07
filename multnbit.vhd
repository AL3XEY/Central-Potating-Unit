LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY multnbit IS
	GENERIC(
		n : IN NATURAL := 16
	);

	PORT(
		a, b : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		overflow : OUT STD_LOGIC; --if an overflow is detected
		q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
	);
END;

ARCHITECTURE bhv OF multnbit IS

	COMPONENT fulladdernbit IS
		GENERIC(
			n : IN NATURAL := 16
		);

		PORT(
			a, b : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			ci : IN STD_LOGIC;
			q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			co : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT shiftregnbit IS
		GENERIC(
			n : IN NATURAL := 16
		);

		PORT(
			a : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
		);
	END COMPONENT;
	Type tableau is array (0 to n-1) of STD_LOGIC_VECTOR(n-1 DOWNTO 0);
	SIGNAL  sa, sb, s : tableau;

BEGIN

	--generate 4 adders & 4 shifters

	overflow <= '0';
	q(0) <= a(0) and b(0);

	addersii:FOR i IN 0 to n-2 GENERATE
			sa(i)(0) <= a(i+1) and b(0);
	END GENERATE;
	sa(n-1)(0) <= '0';

	addersj:FOR j IN 0 to n-1 GENERATE
		addersi:FOR i IN 0 to n-1 GENERATE
			sb(i)(j) <= a(i) and b(j+1);
			adder : fulladdernbit PORT MAP (sa(j), sb(j), '0', s(j), sig_co_tmp(i));

		END GENERATE;
	END GENERATE;

END;
