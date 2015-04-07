LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY controlunit IS
	PORT(
		instruction : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		run, resetn, clk : IN STD_LOGIC;
		reg_sel : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		write : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		alu_sel : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		done : OUT STD_LOGIC
	);
END;

ARCHITECTURE fsm OF controlunit IS --needs a counter for 3-state operations

	SIGNAL operation : STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL sel_rx, sel_ry, sel_din, sel_alu : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL wr_rx, wr_a, wr_acc : STD_LOGIC_VECTOR(9 DOWNTO 0);

BEGIN

	--if mv or mvi, 1 state
	--if add, sub or mult, 3 states

	--signal & output initialization--

	done <= '0';
	write <= (OTHERS => '0');
	alu_sel <= instruction(7 DOWNTO 6);
	sel_din <= "1000";
	sel_alu <= "1001";
	sel_rx(3) <= '0';
	sel_rx(2 DOWNTO 0) <= instruction(5 DOWNTO 3);
	sel_ry(3) <= '0';
	sel_rx(2 DOWNTO 0) <= instruction(2 DOWNTO 0);

	wr_a <= "0100000000";
	wr_acc <= "1000000000";

	WITH instruction(5 DOWNTO 3) SELECT wr_rx <=
		"0000000001" WHEN "000",
		"0000000010" WHEN "001",
		"0000000100" WHEN "010",
		"0000001000" WHEN "011",
		"0000010000" WHEN "100",
		"0000100000" WHEN "101",
		"0001000000" WHEN "110",
		"0010000000" WHEN "111",
		(OTHERS => 'X') WHEN OTHERS;

	--fsm--

	PROCESS
	BEGIN
		--TODO : clock
		IF (instruction(2) = '0') THEN --add, sub, mul (alu)
			--state 1--
			reg_sel <= sel_rx;
			write <= wr_a;
			--state 2--
			reg_sel <= sel_ry;
			write <= wr_acc;
			--state 3--
			reg_sel <= sel_alu;
			write <= wr_rx;
		ELSIF (instruction(2) = '1') THEN --else
			IF (instruction(2) = '0') THEN --mv
				reg_sel <= sel_ry;
			ELSIF (instruction(2) = '1') THEN --mvi
				reg_sel <= sel_din;
			END IF;
				write <= wr_rx;
		END IF;
		done <= '1';
	END PROCESS;

END;
