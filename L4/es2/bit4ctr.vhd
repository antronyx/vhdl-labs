--file 4bitctr.vhd
LIBRARY ieee;
use ieee.std_logic_1164.all;

entity bit4ctr is
PORT(EN,CLEAR,CLK:IN STD_LOGIC;
		COUNT:OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end bit4ctr;

ARCHITECTURE be of bit4ctr is

SIGNAL q:STD_LOGIC_VECTOR(0 TO 3);
  
SIGNAL t1,t2,t3: std_logic;
COMPONENT tflipflop
  port (T,RST,CLK,EN: in std_logic;
						 Q: out std_logic);
END COMPONENT;


BEGIN


ff0: tflipflop PORT MAP(EN,CLEAR,CLK,'1',q(0));
COUNT(0)<=q(0);
ff1: tflipflop PORT MAP(t1,CLEAR,CLK,'1',q(1));
COUNT(1)<=q(1);
ff2: tflipflop PORT MAP(t2,CLEAR,CLK,'1',q(2));
COUNT(2)<=q(2);
ff3: tflipflop PORT MAP(t3,CLEAR,CLK,'1',q(3));
COUNT(3)<=q(3);

t1<=EN and q(0);
t2<=t1 and q(1);
t3<=t2 and q(2);
END be;
