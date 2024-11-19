LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MULTIPLEXADOR IS
PORT(S: in std_logic_vector(2 downto 0);
	D: in std_logic_vector(7 downto 0);
	Y: out std_logic);
END MULTIPLEXADOR;

ARCHITECTURE MULTIPLEXADOR_ARCH OF MULTIPLEXADOR IS
BEGIN
	Y <= D(0) when S = "000" else
	D(1) when S = "001" else
	D(2) when S = "010" else
	D(3) when S = "011" else
	D(4) when S = "100" else 
	D(5) when S = "101" else 
	D(6) when S = "110" else
	D(7) when S = "111";

END MULTIPLEXADOR_ARCH;