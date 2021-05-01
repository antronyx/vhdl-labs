--file hex_to_disp
--it takes, if connected an input for overflow occured ,that display an E

ENTITY hex_to_disp IS
	PORT (HEX_NUM: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			TO_DISP: OUT STD_LOGIC_VECTOR(0 TO 6);
			OVFL:IN STD_LOGIC);
END hex_to_disp;

ARCHITECTURE Behaviour OF hex_to_disp IS
   
	CASE HEX_NUM IS
        WHEN "0000"=> TO_DISP <="0000001";  -- print '0'
        WHEN "0001"=> TO_DISP <="1001111";  -- print '1'
        WHEN "0010"=> TO_DISP <="0010010";  -- print '2'
        WHEN "0011"=> TO_DISP <="0000110";  -- print '3'
        WHEN "0100"=> TO_DISP <="1001100";  -- print '4' 
        WHEN "0101"=> TO_DISP <="0100100";  -- print '5'
        WHEN "0110"=> TO_DISP <="0100000";  -- print '6'
        WHEN "0111"=> TO_DISP <="0001111";  -- print '7'
        WHEN "1000"=> TO_DISP <="0000000";  -- print '8'
        WHEN "1001"=> TO_DISP <="0000100";  -- print '9'
        WHEN "1010"=> TO_DISP <="0001000";  -- print 'A'
        WHEN "1011"=> TO_DISP <="1100000";  -- print 'b'
        WHEN "1100"=> TO_DISP <="0110001";  -- print 'C'
        WHEN "1101"=> TO_DISP <="1000010";  -- print 'd'
        WHEN "1110"=> TO_DISP <="0110000";  -- print 'E'
        WHEN "1111"=> TO_DISP <="0111000";  -- print 'F'
        WHEN OTHERS =>  "1111111";
    END CASE;
	 
	 IF OVFL='1' THEN
		TO_DISP<="1111111";
	 END IF;


END Behaviour;


