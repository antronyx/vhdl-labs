library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_hex7seg is
  port (
    HEX : in  std_logic_vector(0 to 6);
    VAL : out integer );   
end tb_hex7seg;

architecture beh of tb_hex7seg is

begin  -- beh

  process (HEX)
  begin  -- process
    case HEX is
      when "0000001" =>
        VAL <= 0;
      when "1001111" =>
        VAL <= 1;
      when "0010010" =>
        VAL <= 2;
      when "0000110" =>
        VAL <= 3;
      when "1001100" =>
        VAL <= 4;
      when "0100100" =>
        VAL <= 5;
      when "0100000" =>
        VAL <= 6;
      when "0001111" =>
        VAL <= 7;
      when "0000000" =>
        VAL <= 8;
      when "0000100" =>
        VAL <= 9;
        when "0001000" =>
        VAL <= 10;
      when   "1100000" =>
        VAL <= 11;
      when "0110001" =>
        VAL <= 12;
      when "1000010" =>
        VAL <= 13;
        when "0110000" =>
        VAL <= 14;
        when "0111000" =>
        VAL <= 15;
      when others =>
        VAL <= -1;
    end case;
  end process;

end beh;

