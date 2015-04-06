LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY flipflop IS
PORT (
	D, setn, resetn, clock : IN STD_logic;
	Q : out std_logic
);
END flipflop;

ARCHITECTURE Behavior OF flipflop IS
BEGIN
PROCESS (Clock, setn, resetn) -- state flip-flops
BEGIN

	if rising_edge(clock) then
		if resetn = '0' then
			q <= '0';
		elsif setn ='0' then
			q <= '1';
		else
			q <= d;
		end if;
	end if;	
END PROCESS;
END Behavior;

