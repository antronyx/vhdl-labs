--file FU_CTR.vhd
--generic flipflop component for N counters
--Fondamental Unit CTR

LIBRARY ieee;
use ieee.std_logic_1164.all;

entity FU_CTR is
PORT(A,CLEAR,CLK:IN STD_LOGIC;
		B,Q_out:OUT STD_LOGIC);
end FU_CTR;

ARCHITECTURE be of FU_CTR is

COMPONENT tflipflop
  port (T,RST,CLK,EN: in std_logic;
						 Q: out std_logic);
END COMPONENT;

SIGNAL Q_s:STD_LOGIC;

BEGIN

ff:tflipflop PORT MAP(A,CLEAR,CLK,'1',Q_s);
Q_out<=Q_s; 
B<= A AND Q_s;

END be;