LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux10to1nbit IS
	GENERIC(
		n : IN NATURAL := 16
	);

	PORT(
		r0, r1, r2, r3, r4, r5, r6, r7, din, alu : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		sig : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
	);
END;

ARCHITECTURE concur OF mux10to1nbit IS
BEGIN
	WITH sig SELECT q <=
		r0 WHEN "0000",
		r1 WHEN "0001",
		r2 WHEN "0010",
		r3 WHEN "0011",
		r4 WHEN "0100",
		r5 WHEN "0101",
		r6 WHEN "0110",
		r7 WHEN "0111",
		din WHEN "1000",
		alu WHEN "1001",
		(OTHERS => 'X') WHEN OTHERS;
END;
