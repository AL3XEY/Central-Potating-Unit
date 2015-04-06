LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY shiftregnbit IS
	GENERIC(
		n : IN NATURAL := 16
	);

	PORT(
		a : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
	);
END;

ARCHITECTURE bhv OF shiftregnbit IS
BEGIN
	PROCESS
	BEGIN
		--shift : FOR i IN 0 TO n-1 LOOP
		--	q(i+1) <= a(n);
		--END LOOP;
		q <= (OTHERS => '0');

		q(n-1 DOWNTO 1) <= a(n-2 DOWNTO 0);
		q(0) <= '0';
	END PROCESS;
END;
