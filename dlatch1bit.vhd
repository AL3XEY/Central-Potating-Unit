LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY dlatch1bit IS
	PORT(
		clk, d : IN STD_LOGIC;
		q, qn : OUT STD_LOGIC
	);
END;

ARCHITECTURE bhv OF dlatch1bit IS

	COMPONENT rslatch1bit IS
		PORT(
			r, s : IN STD_LOGIC;
			q, qn : OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL sig_r, sig_s : STD_LOGIC;

BEGIN
	
	sig_r <= (NOT d) AND clk;
	sig_s <= d AND clk;

	rs : rslatch1bit PORT MAP (sig_r, sig_s, q, qn);

END;
