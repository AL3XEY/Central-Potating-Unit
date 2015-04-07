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

BEGIN
	--generate 4 adders & 4 shifters

	overflow <= '0';
	q <= '0';

END;
