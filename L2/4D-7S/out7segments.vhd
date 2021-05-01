-- FILE NAME: out7segments.vhd

-- Implementation of a simple combinatory circuit printing 'H' 'E' 'L' 'O' ' ' 
-- characters and a basic sliding system trought the first 3 switches of 
-- the Altera DE2 board

-- Created by Antonino Cacicia on 21/03/2019 at 00:30


LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY out7segments IS
	-- Declaring witch pinS i need for inputs and outputs on the DE2 board
	PORT (  SW : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
			HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6);
			HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6);
			HEX2 : OUT STD_LOGIC_VECTOR(0 TO 6);
			HEX3 : OUT STD_LOGIC_VECTOR(0 TO 6);
			HEX4 : OUT STD_LOGIC_VECTOR(0 TO 6));
			
END out7segments;


ARCHITECTURE Behavior OF out7segments IS
-----------------------------------------------------------------
	COMPONENT mux_3bit_5to1
		PORT ( S,	U,V,W,X,Y : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
                                        M : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT char_7seg --Convert inputs in single display output
		PORT ( C : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 Display : OUT STD_LOGIC_VECTOR(0 TO 6));
	END COMPONENT;
-----------------------------------------------------------------	

SIGNAL CODE0 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL CODE1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL CODE2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL CODE3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL CODE4 : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN
	M0: mux_3bit_5to1 PORT MAP 

	--Connecting the SWitches to the multiplexer (SW_17~15 for selector, SW_14~0 for chars)
	(SW(17 DOWNTO 15), SW(14 DOWNTO 12), SW(11 DOWNTO 9),
	SW(8 DOWNTO 6), SW(5 DOWNTO 3), SW(2 DOWNTO 0), CODE0);
	-- this mux take the inputs and send the 3-bit toward the Display (encoded)
	H0: char_7seg PORT MAP (CODE0, HEX0); 
	--now the signal is decoded and displayed

	------------ Now doing the same for all the others 7s-display ,switching the pin assignment --------------
	
	M1: mux_3bit_5to1 PORT MAP 
	(SW(17 DOWNTO 15), SW(11 DOWNTO 9), SW(8 DOWNTO 6), SW(5 DOWNTO 3),
	SW(2 DOWNTO 0),  SW(14 DOWNTO 12), CODE1);
	H1: char_7seg PORT MAP (CODE1, HEX1); 
	
	M2: mux_3bit_5to1 PORT MAP 
	(SW(17 DOWNTO 15), SW(8 DOWNTO 6), SW(5 DOWNTO 3), SW(2 DOWNTO 0),
	SW(14 DOWNTO 12),  SW(11 DOWNTO 9), CODE2);
	H2: char_7seg PORT MAP (CODE2, HEX2); 
	
	M3: mux_3bit_5to1 PORT MAP 
	(SW(17 DOWNTO 15), SW(5 DOWNTO 3), SW(2 DOWNTO 0), SW(14 DOWNTO 12),
	SW(11 DOWNTO 9),  SW(8 DOWNTO 6), CODE3);
	H3: char_7seg PORT MAP (CODE3, HEX3); 
	
	M4: mux_3bit_5to1 PORT MAP 
	(SW(17 DOWNTO 15), SW(2 DOWNTO 0),  SW(14 DOWNTO 12), SW(11 DOWNTO 9),
	SW(8 DOWNTO 6), SW(5 DOWNTO 3),  CODE4);
	H4: char_7seg PORT MAP (CODE4, HEX4);
	
END Behavior;

