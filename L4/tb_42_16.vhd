
library ieee;
use ieee.std_logic_1164.all;
 
entity tb_42_16 is
end tb_42_16;
 
architecture behave of tb_42_16 is
  signal EN_s   : std_logic := '1';
  signal CLEAR_s   : std_logic := '0';
  signal CLK_s : std_logic:='0';
  signal count_S:std_logic_vector(15 downto 0):= (others => '0');

component bit16ctr is
PORT(EN,CLEAR,CLK:IN STD_LOGIC;
		COUNT:OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;


begin
  c0:bit16ctr port map (EN_S,CLEAR_S,CLK_S,COUNT_S);
  
  process is
  begin
    CLK_S <= '0';
    wait for 1 ns;
    CLK_S <= '1';
    wait for 1 ns;
end process;

process is
  begin
    EN_s <= '1';
    wait for 141070 ns;
    EN_s <= '0';
    wait for 100 ns;
  end process;


  process is
  begin
    CLEAR_S <= '0';
    wait for 151070 ns;
    CLear_S <= '1';
    wait for 400 ns;
  end process;

     
end behave;

