
-- Implementation of a MUX5TO1 3-bit wide on Altera DE2 board--
-- Created by Antonino Cacicia at 15/03/2019 - 19:20 --

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY mux5to1 IS
	PORT ( SW : IN STD_LOGIC_VECTOR(17 DOWNTO 0);

		LEDR : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
		LEDG: OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END mux5to1;

ARCHITECTURE funct OF mux5to1 IS
	SIGNAL U: STD_LOGIC_VECTOR (2 downto 0);
	SIGNAL V: STD_LOGIC_VECTOR (2 downto 0);
	SIGNAL W: STD_LOGIC_VECTOR (2 downto 0);
	SIGNAL X: STD_LOGIC_VECTOR (2 downto 0);
	SIGNAL Y: STD_LOGIC_VECTOR (2 downto 0);
	SIGNAL M: STD_LOGIC_VECTOR (2 downto 0);
	SIGNAL SEL: STD_LOGIC_VECTOR (2 downto 0);
BEGIN
	LEDR<=SW; --Turn on the LEDR(N) when SW(N) is ON
	-- Assignment of the pins --
	SEL<=SW(17) & SW(16) & SW(15);
	
	U<=SW(14) & SW(13) & SW(12);
	V<=SW(11) & SW(10) & SW(9);
	W<=SW(8) & SW(7) & SW(6);
	X<=SW(5) & SW(4) & SW(3);
	Y<=SW(2) & SW(1) & SW(0);
	
	M<=U WHEN SEL="000" ELSE
		V WHEN SEL="001" ELSE
		W WHEN SEL="010" ELSE
		X WHEN SEL="011" ELSE
		Y;
	-- Now "Print" Results --
	LEDG(2)<=M(2);
	LEDG(1)<=M(1);
	LEDG(0)<=M(0);	
END funct;