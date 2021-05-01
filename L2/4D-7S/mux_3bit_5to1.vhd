
-- File mux_3bit_5to1.vhd
-- implements a 3-bit wide 5-to-1 multiplexer
--Created by Antonino Cacicia on 20/03/2019 at 21:00

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_3bit_5to1 IS
	PORT ( S, U, V, W, X, Y : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
								 M : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END mux_3bit_5to1;


ARCHITECTURE Behavior OF mux_3bit_5to1 IS

	COMPONENT mux2to1
		PORT (X,Y: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
				SEL: IN STD_LOGIC;
				  Z: OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
	END COMPONENT;

SIGNAL SGN_A: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL SGN_B: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL SGN_C: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL SGN_D: STD_LOGIC_VECTOR(2 DOWNTO 0);	

BEGIN
	M_A: mux2to1 PORT MAP 
	(U, V, S(0), SGN_A);
	
	M_B: mux2to1 PORT MAP 
	(W, X, S(0), SGN_B);
	
	M_D: mux2to1 PORT MAP 
	(SGN_A, SGN_B, S(1), SGN_D);
	
	M_C: mux2to1 PORT MAP 
	(SGN_D, Y, S(2), M);
			
END Behavior;
