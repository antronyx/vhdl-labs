--mux2to1.vhd file
--Created by Antonino Cacicia on 20/03/2019 at 23:00

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux2to1 IS
        PORT( X: IN STD_LOGIC;
              Y: IN STD_LOGIC;
            SEL: IN STD_LOGIC;
              Z: OUT STD_LOGIC);

END mux2to1;

ARCHITECTURE Behaviour OF mux2to1 IS

BEGIN
        Z<= ((NOT SEL) AND X) OR (SEL AND Y);
       
END Behaviour;
