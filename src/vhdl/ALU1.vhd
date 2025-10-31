
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY ALU1 IS
PORT (
A ,B : IN std_logic_vector(7 DOWNTO 0);
OP: IN std_logic_vector(15 downto 0);
neg: OUT STD_LOGIC;
R1: OUT std_logic_vector(3 DOWNTO 0);--lower 4bits of 8bits Result
R2: OUT std_logic_vector(3 DOWNTO 0));--higher 4bits of 8bits Result
END ALU1;

ARCHITECTURE Behavior OF ALU1 IS
signal Result: std_logic_vector(7 DOWNTO 0);

BEGIN
PROCESS (OP,A,B)
BEGIN
CASE (OP) IS
WHEN "0000000000000001" => --Function 1 - addition
neg <= '0';
Result <= A + B;
WHEN "0000000000000010"  => --Function 2 - subtraction

if (A < B) then
Result <= B - A;
neg <= '1';
elsif (B < A) then
Result <= A - B;
neg <= '0';
end if;

WHEN "0000000000000100" =>--Function 3 - NOT
neg <= '0';
Result <= NOT(A);
WHEN "0000000000001000" =>--Function 4 -NAND
neg <= '0';
Result <= NOT(A AND B);
WHEN "0000000000010000" =>--Function 5 -NOR
neg <= '0';
Result <= NOT(A OR B);
WHEN "0000000000100000" =>--Function 6 -AND
neg <= '0';
Result <= (A AND B);
WHEN "0000000001000000" =>--Function 7 -XOR
neg <= '0';
Result <= (A XOR B);
WHEN "0000000010000000" =>--Function 8 -OR
neg <= '0';
Result <= (A OR B);
WHEN OTHERS => -- don't care
END CASE;
END PROCESS;
R1 <= Result(3 DOWNTO 0);
R2 <= Result(7 DOWNTO 4);

END Behavior;
