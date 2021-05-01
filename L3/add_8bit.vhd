--file add_8bit.vhd
--this file need 1bit_FA.vhd to be complete
--return a bit if overflow occurred

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY add_8bit IS
       
		  PORT( A: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
              B: IN STD_LOGIC_VECTOR (7 DOWNTO 0); 
              S: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
				C_out: OUT STD_LOGIC;--for ovfl
				C_in: IN STD_LOGIC);
				  
END add_8bit;

ARCHITECTURE Behavior OF add_8bit IS
	
	COMPONENT onebit_FA
		PORT(C_in,A,B:IN STD_LOGIC;
				S,C_out:OUT STD_LOGIC);
   END COMPONENT;

	SIGNAL C_FA0: STD_LOGIC;
	SIGNAL C_FA1: STD_LOGIC;
	SIGNAL C_FA2: STD_LOGIC;
	SIGNAL C_FA3: STD_LOGIC;
	SIGNAL C_FA4: STD_LOGIC;
	SIGNAL C_FA5: STD_LOGIC;
	SIGNAL C_FA6: STD_LOGIC;
BEGIN
	
	FA0:onebit_FA PORT MAP (C_in,A(0),B(0),S(0),C_FA0);
	FA1:onebit_FA PORT MAP (C_FA0,A(1),B(1),S(1),C_FA1);
	FA2:onebit_FA PORT MAP (C_FA1,A(2),B(2),S(2),C_FA2);
	FA3:onebit_FA PORT MAP (C_FA2,A(3),B(3),S(3),C_FA3);
	FA4:onebit_FA PORT MAP (C_FA3,A(4),B(4),S(4),C_FA4);
	FA5:onebit_FA PORT MAP (C_FA4,A(5),B(5),S(5),C_FA5);
	FA6:onebit_FA PORT MAP (C_FA5,A(6),B(6),S(6),C_FA6);
	FA7:onebit_FA PORT MAP (C_FA6,A(7),B(7),S(7),C_out);

END Behaviour;
