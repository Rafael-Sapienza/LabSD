LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

ENTITY GM IS
PORT(A,B: in std_logic_vector(3 downto 0);
    S: out std_logic_vector(4 downto 0));
END GM;

ARCHITECTURE GM_ARCH OF GM IS
BEGIN
	S <= ('0' & unsigned(A)) + ('0' & unsigned(B));

END GM_ARCH;