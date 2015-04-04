LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY rslatch1bit IS
	PORT(
		r, s : IN STD_LOGIC;
		q, qn : OUT STD_LOGIC
	);
END;

ARCHITECTURE bhv OF rslatch1bit IS

	SIGNAL sig_q, sig_qn : STD_LOGIC;

BEGIN
	sig_q <= r NOR sig_qn;
	sig_qn <= s NOR sig_q;
	q <= sig_q;
	qn <= sig_qn;
END;
