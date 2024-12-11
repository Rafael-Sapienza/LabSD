LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY orGate IS
PORT(X1: in std_logic;
    X2: in std_logic;
	Y: out std_logic);
END orGate;

ARCHITECTURE orGate_ARCH OF orGate IS
BEGIN
	Y <= X1 or X2;

END orGate_ARCH;