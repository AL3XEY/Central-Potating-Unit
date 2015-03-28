LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY halfadder1bit IS
	PORT(
		a, b : IN STD_LOGIC;
		q, co : OUT STD_LOGIC
	);
END;

ARCHITECTURE bhv OF halfadder1bit IS
	q <= a XOR b;
	co <= a AND b;
BEGIN

END;