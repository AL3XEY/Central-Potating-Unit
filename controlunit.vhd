LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY controlunit IS
	PORT(
		instruction : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		run, resetn, clk : IN STD_LOGIC;
		write : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		reg_sel, alu_sel, done : OUT STD_LOGIC
	);
END;

ARCHITECTURE fsm OF controlunit IS --needs a counter for 3-state operations

	SIGNAL operation, rx, ry : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN

	--if mv or mvi, 1 state
	--if add, sub or mult, 3 states

	alu_sel <= op(8 DOWNT0 6);

END;
