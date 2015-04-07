LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY alunbit IS
	GENERIC(
		n : IN NATURAL := 16
	);

	PORT(
		a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0); --operation selection
		overflow : OUT STD_LOGIC; --if an overflow is detected
		q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END;

ARCHITECTURE bhv OF multnbits IS

	COMPONENT fulladernbit IS
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

	COMPONENT multnbit IS
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

BEGIN

END;
