library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_42_16_de2 is
end tb_42_16_de2;






architecture be of tb_42_16_de2 is
  component de2_counter is
    	PORT(KEY:IN STD_LOGIC;
		SW:IN STD_LOGIC_VECTOR(1 DOWNTO 0);--EN and reset respectively
		HEX3:OUT STD_LOGIC_VECTOR (0 TO 6);
		HEX2:OUT STD_LOGIC_VECTOR (0 TO 6);
		HEX1:OUT STD_LOGIC_VECTOR (0 TO 6);
		HEX0:OUT STD_LOGIC_VECTOR (0 TO 6));
  end component;

  component tb_hex7seg is
    port (
      HEX : in  std_logic_vector(0 to 6);
      VAL : out integer ); 
  end component;

    
  signal en_s:std_logic;
  signal clear_s:std_logic;

  signal key_s:std_logic;
  signal sw_s:std_logic_vector(1 downto 0);

  
  signal hex3_sout:std_logic_vector(0 to 6);
  signal hex2_sout:std_logic_vector(0 to 6);
  signal hex1_sout:std_logic_vector(0 to 6);
  signal hex0_sout:std_logic_vector(0 to 6);

  signal d0:integer ;
  signal d1:integer ;
  signal d2:integer ;
  signal d3:integer ;
  
begin

  process
  begin
    key_s<='0';
    wait for 1 ns;
    key_s<='1';
    wait for 1 ns;
  end process;

  process
  begin
    en_s<='1';
    wait for 35000 ns;
    en_s<='0';
    wait for 100 ns;
  end process;

  process
  begin
    clear_s<='1';
    wait for 1 ns;
    clear_s<='0';
    wait for 35000 ns;
  end process;

  sw_s<=en_s & clear_s;
  

  boar:de2_counter port map(key_s,sw_s,hex3_sout,hex2_sout,hex1_sout,hex0_sout);
  dis0:tb_hex7seg port map(hex0_sout,d0);
  dis1:tb_hex7seg port map(hex1_sout,d1);
  dis2:tb_hex7seg port map(hex2_sout,d2);
  dis3:tb_hex7seg port map(hex3_sout,d3);
  


  
end be;
