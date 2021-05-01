--file Sync Adder 8bit

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SAdd_8bit IS
	PORT(A,B: IN STD_LOGIC_VECTOR(7 DOWNTO 0); 	 	 
			 S: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	C_in,CLK,RST: IN STD_LOGIC;
      C_out: OUT STD_LOGIC
	);

END SAdd_8bit;


ARCHITECTURE Behaviour OF SAdd_8bit IS
COMPONENT regn
	GENERIC ( N : integer:=8);
	
		PORT (R : IN SIGNED(N-1 DOWNTO 0);
Clock, Resetn : IN STD_LOGIC;
				Q : OUT SIGNED(N-1 DOWNTO 0));
END COMPONENT;

COMPONENT flipflop
	PORT (D, Clock, Resetn : IN STD_LOGIC;
								Q : OUT STD_LOGIC);
END COMPONENT;

COMPONENT add_8bit
		  PORT( A: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
              B: IN STD_LOGIC_VECTOR (7 DOWNTO 0); 
              S: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
				C_out: OUT STD_LOGIC;
				C_in: IN STD_LOGIC);
END COMPONENT;

SIGNAL A_IN_ADD,B_IN_ADD,S_OUT_ADD,S_OUT_REGN:STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL OVFL : STD_LOGIC;

BEGIN

regnA:regn GENERIC MAP(n=>8)
PORT MAP(A,CLK,RST,A_IN_ADD);

regnB:regn GENERIC MAP(n=>8)
PORT MAP(B,CLK,RST,B_IN_ADD);

add:add_8bit PORT MAP(A_IN_ADD,B_IN_ADD,S_OUT_ADD,OVFL,C_in);

regnS:regn GENERIC MAP(n=>8)
PORT MAP(S,CLK,RST,S_OUT_REGN);

ff:flipflop PORT MAP (OVFL,CLK,RST,C_out);

S<=S_OUT_REGN;


END Behaviour;