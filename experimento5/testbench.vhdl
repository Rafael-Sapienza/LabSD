LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY testbench IS
PORT(f_DUT,f_GM: in std_logic_vector (4 downto 0);
	A,B: out std_logic_vector(3 downto 0));
END orGate;

ARCHITECTURE orGate_ARCH OF orGate IS
BEGIN
	Y <= X1 or X2;

END orGate_ARCH;