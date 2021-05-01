--part of DE2_mul proj
--file mul.vhd
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY mul IS
	PORT(A,B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			 P: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END mul;

ARCHITECTURE Behaviour OF mul IS

SIGNAL AB0,AB1,AB2,AB3: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL S1,S2,S3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL C1,C2,C3 : STD_LOGIC_VECTOR(3 DOWNTO 0);

COMPONENT onebit_FA IS
	PORT(A,B,C_in:IN STD_LOGIC;
	      C_out,S:OUT STD_LOGIC);
END COMPONENT;



BEGIN
  AB0(0)<=A(0) and B(0); AB1(0)<=A(0) and B(1); AB2(0)<= A(0) and B(2);
  AB0(1)<=A(1) and B(0); AB1(1)<=A(1) and B(1); AB2(1)<= A(1) and B(2);
  AB0(2)<=A(2) and B(0); AB1(2)<=A(2) and B(1); AB2(2)<= A(2) and B(2);
  AB0(3)<=A(3) and B(0); AB1(3)<=A(3) and B(1); AB2(3)<= A(3) and B(2);
  AB3(0)<=A(0) and B(3); AB3(1)<=A(1) and B(3);AB3(2)<=A(2) and B(3);
  AB3(3)<=A(3) and B(3);



  FA0: onebit_FA port map (AB0(1),AB1(0),'0',C1(0),S1(0));
  FA1: onebit_FA port map (AB1(3),C1(2),'0',C1(3),S1(3));
  FA2: onebit_FA port map (S1(1),AB2(0),'0',C2(0),S2(0));
  FA3: onebit_FA port map (S2(1),AB3(0),'0',C3(0),S3(0));

  FA4: onebit_FA port map (AB0(2),AB1(1),C1(0),C1(1),S1(1));
  FA5: onebit_FA port map (AB0(3),AB1(2),C1(1),C1(2),S1(2));
  FA6: onebit_FA port map (S1(2),AB2(1),C2(0),C2(1),S2(1));
  FA7: onebit_FA port map (S1(3),AB2(2),C2(1),C2(2),S2(2));
  FA8: onebit_FA port map (C1(3),AB2(3),C2(2),C2(3),S2(3));
  FA9: onebit_FA port map (S2(2),AB3(1),C3(0),C3(1),S3(1));
  FA10: onebit_FA port map (S2(3),AB3(2),C3(1),C3(2),S3(2));
  FA11: onebit_FA port map (C2(3),AB3(3),C3(2),C3(3),S3(3));
  

  P(7)<=C3(3); P(6)<=S3(3);
  P(5)<=S3(2); P(4)<=S3(1);
  P(3)<=S3(0); P(2)<=S2(0);
  P(1)<=S1(0); P(0)<=AB0(0);
  
  
END Behaviour;
