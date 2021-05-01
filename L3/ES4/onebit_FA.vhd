--Part of mul proj
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
--file onebit_Fa.vhd
--part of DE2_mul proj
ENTITY onebit_FA IS
	PORT(A,B,C_in:IN STD_LOGIC;
	      C_out,S:OUT STD_LOGIC);
END onebit_FA;

ARCHITECTURE Behaviour OF onebit_FA IS

COMPONENT mux2to1
	PORT( X: IN STD_LOGIC;
			Y: IN STD_LOGIC;
		 SEL: IN STD_LOGIC;
         Z: OUT STD_LOGIC);
END COMPONENT;

SIGNAL S_GMG: STD_LOGIC; --signal gate mux gate
BEGIN
  S_GMG <= A XOR B;
  S <= C_in XOR S_GMG;
  M0:mux2to1 PORT MAP(B,C_in,S_GMG,C_out);
 END Behaviour;


