LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY TB IS
PORT(f_DUT,f_GM: in std_logic_vector (4 downto 0);
	A,B: out std_logic_vector(3 downto 0));
END TB;

ARCHITECTURE TB_ARCH OF TB IS
BEGIN
	process 
		variable contbin : STD_LOGIC_VECTOR(7 downto 0);
	begin
		report "Iniciando teste..." severity NOTE;

		contbin := "00000000";

		for i in 1 to 256 loop
			A(0) <= contbin(7);
			A(1) <= contbin(6);
			A(2) <= contbin(5);
			A(3) <= contbin(4);
			B(0) <= contbin(3);
			B(1) <= contbin(2);
			B(2) <= contbin(1);
			B(3) <= contbin(0);
			wait for 500 ns;
			assert (f_GM = f_DUT) report "Falhou i = " & integer'image(i) severity ERROR;
			contbin := contbin + 1;
		end loop;
		report "Teste finalizado!" severity NOTE;
		wait;
	end process;
	end TB_ARCH;