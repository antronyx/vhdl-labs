-- 7-segment display control trought switches -- 
-- Created by Antonino Cacicia on 19/03/2019 - 15:26 --

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY decoder7s IS

PORT(SW: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		LEDR: OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
		HEX0: OUT STD_LOGIC_VECTOR(0 TO 6));

END decoder7s;

ARCHITECTURE behaviour OF decoder7s IS

BEGIN

	LEDR<=SW;
	
	HEX0(0)<= NOT(SW(0)) OR SW(2);
	HEX0(1)<= (SW(1) XOR SW(0)) OR SW(2);
	HEX0(2)<= (SW(1) XOR SW(0)) OR SW(2);
	HEX0(3)<= NOT(SW(1) OR SW(0))OR SW(2);
	HEX0(4)<= SW(2);
	HEX0(5)<= SW(2);
	HEX0(6)<= SW(1) OR SW(2);

END behaviour;