--file 4bitctr.vhd
LIBRARY ieee;
use ieee.std_logic_1164.all;

entity bit16ctr is
PORT(EN,CLEAR,CLK:IN STD_LOGIC;
		COUNT:OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
end bit16ctr;

ARCHITECTURE be of bit16ctr is

COMPONENT tflipflop
  port (T,RST,CLK,EN: in std_logic;
						 Q: out std_logic);
END COMPONENT;

COMPONENT FU_CTR
  PORT(A,CLEAR,CLK:IN STD_LOGIC;
		B,Q_out:OUT STD_LOGIC);
END COMPONENT;
SIGNAL COUNT_s:STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL WIRE:STD_LOGIC_VECTOR(0 TO 14);
BEGIN

	FU_CTR0:FU_CTR PORT MAP(EN,CLEAR,CLK,WIRE(0),COUNT_s(0));

	gen_FU:for I in 1 to 14  generate
	ffI: FU_CTR PORT MAP(WIRE(I-1),CLEAR,CLK,WIRE(I),COUNT_s(I));
	end generate gen_fu;
	
	ff15:tflipflop PORT MAP(WIRE(14),CLEAR,CLK,'1',COUNT_s(15));
	
	COUNT<=COUNT_s;

END be;