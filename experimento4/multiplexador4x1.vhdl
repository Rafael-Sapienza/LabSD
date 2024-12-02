LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MULTIPLEXADOR4x1 IS
PORT(S: in std_logic_vector(1 downto 0);
	D: in std_logic_vector(3 downto 0);
	Y: out std_logic);
END MULTIPLEXADOR4x1;

ARCHITECTURE MULTIPLEXADOR4x1_ARCH OF MULTIPLEXADOR4x1 IS
BEGIN
	Y <= D(0) when S = "00" else
	D(1) when S = "01" else
	D(2) when S = "10" else
	D(3) when S = "11";

END MULTIPLEXADOR4x1_ARCH;