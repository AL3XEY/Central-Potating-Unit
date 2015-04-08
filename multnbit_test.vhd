LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY multnbit_test IS

END;

ARCHITECTURE tb OF multnbit_test IS

	COMPONENT multnbit IS
		GENERIC(
			n : IN NATURAL := 8
		);

		PORT(
			a, b : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			overflow : OUT STD_LOGIC;
			q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL ovf : STD_LOGIC;
	SIGNAL a, b, q : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

	mult: multnbit GENERIC MAP (8) PORT MAP (a, b, ovf, q);

	PROCESS
	  BEGIN

	 	a <= "00000000";
		b <= "00000000";
		WAIT FOR 1 ns;
		ASSERT(q="00000000") REPORT "Fail 0*0" SEVERITY ERROR;

		a <="00000001";
		b <= "00000000";
		WAIT FOR 1 ns;
		ASSERT(q="00000000") REPORT "Fail 1*0" SEVERITY ERROR;

		a <= "00000001";
		b <= "00000001";
		WAIT FOR 1 ns;
		ASSERT(q="00000001") REPORT "Fail 1*1" SEVERITY ERROR;
		
		a <= "00000001";
		b <= "00000010";
		WAIT FOR 1 ns;
		ASSERT(q="00000001") REPORT "Fail 1*10" SEVERITY ERROR;
		
		a <= "00000001";
		b <= "00000100";
		WAIT FOR 1 ns;
		ASSERT(q="00000001") REPORT "Fail 1*100" SEVERITY ERROR;

		a <= "10000000";
		b <= "10000000";
		WAIT FOR 1 ns;
		ASSERT(q="00000000") REPORT "Fail ovf" SEVERITY ERROR;
		
		a <= "00000010";
		b <= "00000010";
		WAIT FOR 1 ns;
		ASSERT(q="00000001") REPORT "Fail test-fail" SEVERITY ERROR; --must fail

	
		--Clear inputs--
		a <= (OTHERS => '0');
		b <= (OTHERS => '0');

		ASSERT false REPORT "Test done." SEVERITY NOTE;
		WAIT;

	END PROCESS;
END tb;
