LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fulladder1bit IS
	PORT(
		a, b, ci : IN STD_LOGIC;
		q, co : OUT STD_LOGIC
	);
END;

ARCHITECTURE bhv OF fulladder1bit IS

	COMPONENT halfadder1bit IS
		PORT(
			a, b : IN STD_LOGIC;
			q, co : OUT STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL sig_a, sig_b, sig_ci, sig_q1, sig_q, sig_co1, sig_co2, sig_co : STD_LOGIC;
	
BEGIN

	ha1 : halfadder1bit PORT MAP (sig_a, sig_b, sig_q1, sig_co1);
	ha2 : halfadder1bit PORT MAP (sig_q1, sig_ci, sig_q, sig_co2);
	
	PROCESS
	BEGIN
		co <= sig_co1 OR sig_co2;
		q <= sig_q;
	END PROCESS;

END;