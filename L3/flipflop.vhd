LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY flipflop IS
	PORT (D, Clock, Resetn : IN STD_LOGIC;
								Q : OUT STD_LOGIC);
END flipflop;

ARCHITECTURE Behavior OF flipflop IS

BEGIN

	PROCESS (Clock, Resetn)
		BEGIN
		IF (Resetn = '0') THEN -- asynchronous clear
		Q <= '0';
		ELSIF (Clock'EVENT AND Clock = '1') THEN
		Q <= D;
		END IF;
	END PROCESS;

END Behavior;