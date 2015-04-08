LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY multnbit IS
	GENERIC(
		n : IN NATURAL := 8
	);

	PORT(
		a, b : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		overflow : OUT STD_LOGIC; --if an overflow is detected
		q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
	);
END;

ARCHITECTURE bhv OF multnbit IS

	COMPONENT fulladdernbit IS
		GENERIC(
			n : IN NATURAL := 16
		);

		PORT(
			a, b : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			ci : IN STD_LOGIC;
			q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			co : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT shiftregnbit IS
		GENERIC(
			n : IN NATURAL := 16
		);

		PORT(
			a : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			q : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
		);
	END COMPONENT;
	Type tableau is array (0 to n-1) of STD_LOGIC_VECTOR(n-1 DOWNTO 0);
	SIGNAL  sa, sb, s : tableau;
	SIGNAL 	cout :  STD_LOGIC_VECTOR(n-1 DOWNTO 0);
	
BEGIN

	--generate 4 adders & 4 shifters

	overflow <= '0';
	q(0) <= a(0) and b(0);

	addersii:FOR i IN 0 to n-2 GENERATE
			sa(i)(0) <= a(i+1) and b(0);
	END GENERATE;
	sa(n-1)(0) <= '0';

	addersj:FOR j IN 0 to n-1 GENERATE
		addersi:FOR i IN 0 to n-1 GENERATE
			sb(i)(j) <= a(i) and b(j+1);
			adder : fulladdernbit PORT MAP (sa(j), sb(j), '0', s(j), cout(i)); --component instance "adder" is not bound
			PROCESS
	BEGIN
			if i +1 < n-1 then
			sa(i)(j) <= s(i+1)(j);-- entourer cette ligne d'un if ou l'équivalent if(i +1 < n-1)
			end if;
				END PROCESS;

--ghdl:error: bound check failure at multnbit.vhd:61
		END GENERATE;
			q(j)<=s(0)(j);
	END GENERATE;
	addersiip:FOR i IN n-5 to n-2 GENERATE
			q(i) <= s(i-4)(n-1);--confere dernier adder dans le 2e schema
	END GENERATE;
	q(n-1) <= cout(n-1); 
END;
