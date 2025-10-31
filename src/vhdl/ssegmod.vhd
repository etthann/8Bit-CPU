LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY ssegmod IS
PORT ( bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
leds: OUT STD_LOGIC_VECTOR(0 TO 6) ) ;
END ssegmod ;

ARCHITECTURE Behavior OF ssegmod IS
BEGIN
PROCESS ( bcd )

BEGIN

CASE bcd IS          --abcdefg
WHEN "0000" =>leds <= "1000100"; -- y
WHEN "0001" =>leds <= "1101010"; -- n


WHEN OTHERS =>leds <= "-------" ;
END CASE ;
END PROCESS ;
END Behavior ;
