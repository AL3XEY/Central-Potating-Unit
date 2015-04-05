LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY multnbits IS
	GENERIC(
		n : IN NATURAL := 16
	);

	PORT(
		a, b : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		q : OUT STD_LOGIC_VECTOR((2*n)-1 DOWNTO 0)
	);
END;

ARCHITECTURE bhv OF multnbits IS
BEGIN
	--generate 4 adders & 4 shifters
END;
