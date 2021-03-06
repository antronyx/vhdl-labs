--file DE2_COUNTER.vhd
LIBRARY ieee;
use ieee.std_logic_1164.all;

ENTITY DE2_COUNTER IS

	PORT(KEY:IN STD_LOGIC_VECTOR(0 downto 0);
		SW:IN STD_LOGIC_VECTOR(1 DOWNTO 0);--EN and reset respectively
		HEX3:OUT STD_LOGIC_VECTOR (0 TO 6);
		HEX2:OUT STD_LOGIC_VECTOR (0 TO 6);
		HEX1:OUT STD_LOGIC_VECTOR (0 TO 6);
		HEX0:OUT STD_LOGIC_VECTOR (0 TO 6));
END DE2_COUNTER;


ARCHITECTURE Be of DE2_COUNTER IS
COMPONENT bit16ctr IS
PORT(EN,CLEAR,CLK:IN STD_LOGIC;
		COUNT:OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END COMPONENT;

COMPONENT hex_to_disp is
    Port ( HEX_NUM : IN STD_LOGIC_VECTOR (3 downto 0);
           TO_DISP : OUT  STD_LOGIC_VECTOR (0 to 6));
END COMPONENT;
SIGNAL NUM:STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN

	ctr:bit16ctr PORT MAP(SW(1),SW(0),KEY(0),NUM);
	
	d0:hex_to_disp PORT MAP(NUM(3 DOWNTO 0),HEX0);
	d1:hex_to_disp PORT MAP(NUM(7 DOWNTO 4),HEX1);
	d2:hex_to_disp PORT MAP(NUM(11 DOWNTO 8),HEX2);
	d3:hex_to_disp PORT MAP(NUM(15 DOWNTO 12),HEX3);
	
END Be;
