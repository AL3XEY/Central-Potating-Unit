LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY cpu16bit IS
	PORT(
		run, resetn, clk : IN STD_LOGIC;
		din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		busio : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		done : OUT STD_LOGIC
	);
END;

ARCHITECTURE bhv OF cpu16bit IS

	COMPONENT alunbit IS
		GENERIC(
			n : IN NATURAL := 16
		);

		PORT(
			a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			sel : IN STD_LOGIC; --operation selection
			overflow : OUT STD_LOGIC; --if an overflow is detected
			q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT controlunit IS
		PORT(
			instruction : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
			run, resetn : IN STD_LOGIC;
			write : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
			reg_sel, alu_sel, done : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT mux10to1nbit IS
		GENERIC(
			n : IN NATURAL := 16
		);

		PORT(
			r0, r1, r2, r3, r4, r5, r6, r7, din, alu : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			sig : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT registernbit IS
		GENERIC(
			n : IN NATURAL := 16 
		);

		PORT(
			en : IN STD_LOGIC;
			d : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
		);
	END COMPONENT;

BEGIN

END;
