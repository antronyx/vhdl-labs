--Part of DE2_mul proj
-- file  hex_to_disp.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY hex_to_disp is
    Port ( HEX_NUM : IN STD_LOGIC_VECTOR (3 downto 0);
           TO_DISP : OUT  STD_LOGIC_VECTOR (0 to 6));
END hex_to_disp;

architecture Behavior of hex_to_disp  is

begin

--'a' corresponds to MSB of TO_DISP and 'g' corresponds to LSB of TO_DISP.
PROCESS (HEX_NUM)
BEGIN
    CASE HEX_NUM IS
        WHEN "0000"=> TO_DISP <="0000001";  -- '0'
        WHEN "0001"=> TO_DISP <="1001111";  -- '1'
        WHEN "0010"=> TO_DISP <="0010010";  -- '2'
        WHEN "0011"=> TO_DISP <="0000110";  -- '3'
        WHEN "0100"=> TO_DISP <="1001100";  -- '4' 
        WHEN "0101"=> TO_DISP <="0100100";  -- '5'
        WHEN "0110"=> TO_DISP <="0100000";  -- '6'
        WHEN "0111"=> TO_DISP <="0001111";  -- '7'
        WHEN "1000"=> TO_DISP <="0000000";  -- '8'
        WHEN "1001"=> TO_DISP <="0000100";  -- '9'
        WHEN "1010"=> TO_DISP <="0001000";  -- 'A'
        WHEN "1011"=> TO_DISP <="1100000";  -- 'b'
        WHEN "1100"=> TO_DISP <="0110001";  -- 'C'
        WHEN "1101"=> TO_DISP <="1000010";  -- 'd'
        WHEN "1110"=> TO_DISP <="0110000";  -- 'E'
        WHEN "1111"=> TO_DISP <="0111000";  -- 'F'
        WHEN others =>  NULL;
    END CASE;
END PROCESS;

END Behavior;
