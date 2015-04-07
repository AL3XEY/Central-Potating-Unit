LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fulladdernbit IS
	GENERIC(
		n : IN NATURAL := 16
	);

	PORT(
		a, b : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		ci : IN STD_LOGIC; --carry in
		q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		co : OUT STD_LOGIC --carry out
	);
END;

ARCHITECTURE bhv OF fulladdernbit IS

	COMPONENT fulladder1bit IS
		PORT(
			a, b, ci : IN STD_LOGIC;
			q, co : OUT STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL  sig_q: STD_LOGIC_VECTOR(n-1 DOWNTO 0);
	SIGNAL  sig_co, sig_co_tmp: STD_LOGIC_VECTOR(n DOWNTO 0);
	
BEGIN

	sig_co(0) <= ci;

	adders:FOR i IN 0 to n-1 GENERATE
		adder : fulladder1bit PORT MAP (a(i), b(i), sig_co(i), sig_q(i), sig_co_tmp(i));
		sig_co <= sig_co_tmp;
	END GENERATE;
	
	PROCESS
	BEGIN
		co <= sig_co(n);
		q <= sig_q;
	END PROCESS;

END;
