-- File char 7seg.vhd

-- Created by Antonino Cacicia on 20/03/2019 - 20:30

-- This file contain the decription of a generic
-- driver that return a 7-wide byte for a 7-segment display  

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY char_7seg IS
		PORT ( C : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 Display : OUT STD_LOGIC_VECTOR(0 TO 6));
END char_7seg;


ARCHITECTURE Behavior OF char_7seg IS
BEGIN
		Display(0)<= NOT(C(0)) OR C(2);
		Display(1)<= (C(1) XOR C(0)) OR C(2);
		Display(2)<= (C(1) XOR C(0)) OR C(2);
		Display(3)<= NOT(C(1) OR C(0))OR C(2);
		Display(4)<= C(2);
		Display(5)<= C(2);
		Display(6)<= C(1) OR C(2);

END Behavior;
