--file tflipflop.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tflipflop is
   port (T,RST,CLK,EN: in std_logic;
	 Q: out std_logic);
end tflipflop;
 
architecture be of tflipflop is	 
	signal temp: std_logic;
begin
    process (RST,CLK) 
    begin
        if (CLK'EVENT AND CLK = '1') then  
			if RST='1' then   
                temp <= '0';  		
            elsif EN ='1' then
                temp <= T XOR temp;
            end if;
        end if; 
    end process;
    Q <= temp;	   
end be;