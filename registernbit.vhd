LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY registernbit IS
	GENERIC(
		n : IN NATURAL := 16 
	);

	PORT(
		en : IN STD_LOGIC;
		d : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
	);
END;

ARCHITECTURE dlatch OF registernbit IS

	COMPONENT dlatchnbit IS
		GENERIC(
			n : IN NATURAL := 16
		);

		PORT(
			en : IN STD_LOGIC;
			d : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			q, qn : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL sig_qn : STD_LOGIC_VECTOR(n-1 DOWNTO 0);

BEGIN

	dlatch : dlatchnbit PORT MAP (en, d, q, sig_qn);

END;
