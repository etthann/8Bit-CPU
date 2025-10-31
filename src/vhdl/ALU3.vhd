LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU3 IS
PORT (
A ,B : IN unsigned(7 DOWNTO 0);
OP: IN unsigned(15 downto 0);
student_id: IN unsigned(3 downto 0);
neg: OUT STD_LOGIC;
Result: OUT unsigned(3 DOWNTO 0));
END ALU3;

ARCHITECTURE Behavior OF ALU3 IS

BEGIN
PROCESS (OP,A,B)
BEGIN
CASE (OP) IS

WHEN "0000000000000001" => 
neg <= '0';

if A(7 downto 4) < student_id then
Result <= "0000";
elsif A(3 downto 0) < student_id then
Result <= "0000";
else
Result <= "0001";
end if;

WHEN "0000000000000010"  => 
neg <= '0';

if A(7 downto 4) < student_id then
Result <= "0000";
elsif A(3 downto 0) < student_id then
Result <= "0000";
else
Result <= "0001";
end if;

WHEN "0000000000000100" =>
neg <= '0';

if A(7 downto 4) < student_id then
Result <= "0000";
elsif A(3 downto 0) < student_id then
Result <= "0000";
else
Result <= "0001";
end if;

WHEN "0000000000001000" =>

if A(7 downto 4) < student_id then
Result <= "0000";
elsif A(3 downto 0) < student_id then
Result <= "0000";
else
Result <= "0001";
end if;

WHEN "0000000000010000" =>
neg <= '0';

if A(7 downto 4) < student_id then
Result <= "0000";
elsif A(3 downto 0) < student_id then
Result <= "0000";
else
Result <= "0001";
end if;

WHEN "0000000000100000" =>
neg <= '0';

if A(7 downto 4) < student_id then
Result <= "0000";
elsif A(3 downto 0) < student_id then
Result <= "0000";
else
Result <= "0001";
end if;

WHEN "0000000001000000" =>
neg <= '0';

if A(7 downto 4) < student_id then
Result <= "0000";
elsif A(3 downto 0) < student_id then
Result <= "0000";
else
Result <= "0001";
end if;

WHEN "0000000010000000" =>
neg <= '0';

if A(7 downto 4) < student_id then
Result <= "0000";
elsif A(3 downto 0) < student_id then
Result <= "0000";
else
Result <= "0001";
end if;

WHEN OTHERS => -- don't care
END CASE;
END PROCESS;


END Behavior;
