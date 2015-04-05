LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY fsm IS
PORT (
	w, resetn, setn, clock : IN STD_logic;
	z : out std_logic
);
END fsm;

ARCHITECTURE Behavior OF fsm IS
component flipflop is 
PORT (
	D, setn, resetn, clock : IN STD_logic;
	Q : out std_logic
);
END component;
Signal y : std_logic_vector(8 downto 0);
Signal y2 : std_logic_vector(8 downto 0);

BEGIN
y(0) <= resetn;
b0 : flipflop port map(y(0), setn, resetn, clock, y2(0));

y(1) <= not(w) and (y(0) or y(5) or y(6) or y(7) or y(8));
 b1 : flipflop port map(y(1), setn, resetn, clock, y2(1));
 
 y(2) <= not(w) and y2(1);
 b2: flipflop port map(y(2), setn, resetn, clock, y2(2));
 
  y(3) <= not(w) and y2(2);
 b3: flipflop port map(y(3), setn, resetn, clock, y2(3));
 
 y(4) <= not(w) and (y2(4) or y2(3));
 b4: flipflop port map(y(4), setn, resetn, clock, y2(4));
 
 y(5) <= not(w) and (y2(0) or y2(1) or y2(2) or y2(3) or y2(4));
 b5: flipflop port map(y(5), setn, resetn, clock, y2(5));
 
  y(6) <= not(w) and y2(5);
 b6: flipflop port map(y(6), setn, resetn, clock, y2(6));
 
  y(7) <= not(w) and y2(6);
 b7: flipflop port map(y(7), setn, resetn, clock, y2(7));
 
  y(8) <= not(w) and (y2(7) or y2(8));
 b8: flipflop port map(y(8), setn, resetn, clock, y2(8));


END Behavior;

