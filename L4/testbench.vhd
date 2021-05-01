
library ieee;
use ieee.std_logic_1164.all;
 
entity testbench is
end testbench;
 
architecture behave of testbench is
  signal r_SIG   : std_logic := '0';
  signal s_SIG   : std_logic := '0';
  signal clk_SIG : std_logic;
  signal Q_OUT : std_logic;
  
   
COMPONENT SRlatch IS
PORT ( Clk, R, S : IN STD_LOGIC;
Q : OUT STD_LOGIC);
END COMPONENT;
   
begin
   
 tb : SRlATCH
    port map (
      clk    => clk_SIG,r=> r_SIG,s => s_sig,q=>Q_OUT);
 
  clock_in:process is
  begin
    clk_SIG<='0';
    wait for 100 ns;
    clk_SIG<='1'; 
    wait for 100 ns;
  end process clock_in;

  s_in:process is
    begin
    s_SIG<='0';
    wait for 50 ns;
    s_SIG<='1';
     wait for 50 ns;
  end process s_in;

  r_in:process is
  begin
    r_SIG<='0';
    wait for 25 ns;
    r_SIG<='1'; 
  wait for 25 ns;
  end process r_in;
     
end behave;