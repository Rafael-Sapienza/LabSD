LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY TBMaquinaDeVendas IS
PORT(clock: out std_logic;
    A: out std_logic_vector(1 downto 0));
END TBMaquinaDeVendas;

ARCHITECTURE TBMAquinaDeVendas_ARCH OF TBMaquinaDeVendas IS
BEGIN
    process
	begin
		report "Iniciando teste..." severity NOTE;
        --Espera um ciclo de estabilidade
        wait for 20 ns;
        --Nenhuma moeda foi inserida
        A <= "11";
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Inserindo 25 centavos
        A <= "01";
		clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Nenhuma moeda foi inserida
        A <= "00";
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Pedindo troco
        A <= "11";
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Inserindo 25 centavos
        A <= "01";
		clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Inserindo 25 centavos
        A <= "01";
		clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Nenhuma moeda foi inserida
        A <= "00";
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Pedindo troco
        A <= "11";
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Inserindo 25 centavos
        A <= "01";
		clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Inserindo 25 centavos
        A <= "01";
		clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Inserindo 25 centavos
        A <= "01";
		clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Pedindo troco
        A <= "11";
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Inserindo 50 centavos
        A <= "10";
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Inserindo 50 centavos/ libera sem troco
        A <= "10";
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Inserindo 25 centavos
        A <= "01";
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Inserindo 50 centavos
        A <= "10";
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Inserindo 25 centavos/ libera sem troco
        A <= "01";
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Inserindo 25 centavos
        A <= "01";
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Inserindo 50 centavos
        A <= "10";
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        --Inserindo 50 centavos/ libera com troco
        A <= "10";
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;
        clock <= '0';
        wait for 10 ns;
        clock <= '1';
        wait for 10 ns;

		report "Teste finalizado!" severity NOTE;
		wait;
	end process;
	end TBMAquinaDeVendas_ARCH;