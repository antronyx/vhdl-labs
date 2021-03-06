library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity v2_16ctr is
	port( EN: in std_logic;
			CLK: in std_logic;
		 CLEAR: in std_logic;
	  	COUNT: out unsigned(15 downto 0));
end v2_16ctr;

architecture be of v2_16ctr is

signal q: unsigned(15 downto 0);

begin   
process(CLK,CLEAR)
   begin
      if CLEAR='1' then
         q <= (others => '0');
      elsif(rising_edge(CLK)) then
         if EN='1' then
               q <= q + 1;
         end if;
      end if;
   end process;
   COUNT <= q;

end be;