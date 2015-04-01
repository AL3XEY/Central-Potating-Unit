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
	
	SIGNAL  sig_q1, sig_co1, sig_co2: STD_LOGIC;
	
BEGIN

	ha1 : halfadder1bit PORT MAP (a, b, sig_q1, sig_co1);
	ha2 : halfadder1bit PORT MAP (sig_q1, ci, q, sig_co2);
	
	PROCESS
	BEGIN
		co <= sig_co1 OR sig_co2;
	END PROCESS;

END;
