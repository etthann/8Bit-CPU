
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU2 IS
PORT (
A ,B : IN unsigned(7 DOWNTO 0);
OP: IN unsigned(15 downto 0);
neg, neg1: OUT STD_LOGIC;
R1: OUT unsigned(3 DOWNTO 0);--lower 4bits of 8bits Result
R2: OUT unsigned(3 DOWNTO 0));--higher 4bits of 8bits Result
END ALU2;

ARCHITECTURE Behavior OF ALU2 IS
signal Result: unsigned(7 DOWNTO 0);

BEGIN
PROCESS (OP,A,B)
BEGIN
CASE (OP) IS

WHEN "0000000000000001" => --Function 1 - decrement B by 9

Result <= B - "1001" ;
if Result(7) = '1' then
neg <= '1';
elsif Result(3) = '1' then
neg1 <= '1';
else 
neg <= '0' ;
neg1 <= '0' ;
end if;

WHEN "0000000000000010"  => --Function 2 - swap the lower and upper 4 bits of B
neg <= '0';
neg1 <= '0';

Result(0) <= B(4);
Result(1) <= B(5);
Result(2) <= B(6);
Result(3) <= B(7);
Result(4) <= B(0);
Result(5) <= B(1);
Result(6) <= B(2);
Result(7) <= B(3);

WHEN "0000000000000100" =>--Function 3 - shift A to the left by 2 bits , input bit = 0
neg <= '0';
neg1 <= '0';

Result <=  A sll 2 ;

WHEN "0000000000001000" =>--Function 4 - NAND of A and B
neg <= '0';
neg1 <= '0';

Result <= NOT(A AND B);

WHEN "0000000000010000" =>--Function 5 - find the greatest result of A and B
neg <= '0';
neg1 <= '0';

if (A > B) then 
Result <= A;
else
Result <= B;
end if;

WHEN "0000000000100000" =>--Function 6 - invert the even bits of B 
neg <= '0';
neg1 <= '0';

Result(0) <= not(B(0));
Result(1) <= B(1);
Result(2) <= not(B(2));
Result(3) <= B(3);
Result(4) <= not(B(4));
Result(5) <= B(5);
Result(6) <= not(B(6));
Result(7) <= B(7);

WHEN "0000000001000000" =>--Function 7 - produce null
neg <= '0';
neg1 <= '0';

Result <= null; 

WHEN "0000000010000000" =>--Function 8 - replace the upper 4 bits of B by the upper 4 bits of A
neg <= '0';
neg1 <= '0';

Result(0) <= B(0);
Result(1) <= B(1);
Result(2) <= B(2);
Result(3) <= B(3);
Result(4) <= A(4);
Result(5) <= A(5);
Result(6) <= A(6);
Result(7) <= A(7);

WHEN OTHERS => -- don't care
END CASE;
END PROCESS;
R1 <= Result(3 DOWNTO 0);
R2 <= Result(7 DOWNTO 4);

END Behavior;
