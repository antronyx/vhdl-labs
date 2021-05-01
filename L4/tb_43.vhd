
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
entity tb_43 is
end tb_43;
 
architecture behave of tb_43 is
  signal EN_s   : std_logic := '1';
  signal CLEAR_s   : std_logic := '0';
  signal CLK_s : std_logic:='0';
  signal count_S:unsigned(15 downto 0):= (others => '0');


component v2_16ctr is
	port( EN: in std_logic;
              CLK: in std_logic;
            CLEAR: in std_logic;
            COUNT: out unsigned(15 downto 0));
end component;


begin
  c0:v2_16ctr port map (EN_S,CLk_S,CLear_S,COUNT_S);
  
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


