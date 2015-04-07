LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY wrapper IS
	PORT(
		key : IN STD_LOGIC_VECTOR(2 DOWNTO 0); --buttons
		sw : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		ledr : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		ledg : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
		--hex : OUT STD_LOGIC_VECTOR(5 DOWNTO 0) --7-segment displayer. 5digits + sign (if negative)
	);
END;

ARCHITECTURE bhv OF cpu16bit IS

	COMPONENT cpu16bit IS
		PORT(
			run, resetn, clk : IN STD_LOGIC;
			din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			busio : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			done : OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL databus : STD_LOGIC_VECTOR(15 DOWNTO 0); --?

BEGIN

	databus <= (OTHERS => '0');
	ledg(0) <= key(0);
	cpu : cpu16bit PORT MAP(key(2), key(1), key(0), sw, databus, ledg(1)); --databus?

END;
