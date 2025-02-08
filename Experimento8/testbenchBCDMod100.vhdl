LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY TB_BCDMod100 IS
PORT(DUT_UNIDADE,DUT_DEZENA: in std_logic_vector (3 downto 0);
    clock: out std_logic;
    RESET: out std_logic;
    ENABLE: out std_logic;
    LOAD: out std_logic;
    D_UNIDADE,D_DEZENA: out std_logic_vector (3 downto 0));
END TB_BCDMod100;

ARCHITECTURE TB_BCDMod100_arch OF TB_BCDMod100 IS
BEGIN
	process 
		variable DEZENA_VEC, UNIDADE_VEC : STD_LOGIC_VECTOR(3 downto 0);
	begin
		report "Iniciando teste..." severity NOTE;
        --Forçando entradas do conatador a assumirem certos valores iniciais
        RESET <= '0';
        ENABLE <= '1';
        LOAD <= '0';
        D_UNIDADE <= "0000";
        D_DEZENA <= "0000";

        --Verificando se RESET funciona
        RESET <= '1';
        clock <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; --Pulso de clock
        assert(DUT_DEZENA = "0000" and DUT_UNIDADE = "0000") report "Falha no RESET" severity ERROR;
        RESET <= '0';
        
        --Verificando se a entrada LOAD funciona

        --LOAD ligado
        LOAD <= '1';
        D_DEZENA <= "1000"; D_UNIDADE <= "0001";
        clock <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; --Pulso de clock
        assert(DUT_DEZENA = "1000" and DUT_UNIDADE = "0001") report "Falha com LOAD ligado" severity ERROR;

        --LOAD desligado
        LOAD <= '0';
        D_DEZENA <= "0101"; D_UNIDADE <= "1001";
        clock <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; --Pulso de clock
        assert(DUT_DEZENA = "1000" and DUT_UNIDADE = "0001") report "Falha com LOAD desligado" severity ERROR;

        --Zerando DUT_DEZENA e DUT_UNIDADE
        RESET <= '1';
        clock <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; --Pulso de clock
        assert(DUT_DEZENA = "0000" and DUT_UNIDADE = "0000") report "Falha no RESET" severity ERROR;
        RESET <= '0'; --para poder testar o ENABLE

        --Verificando se o ENABLE funciona
        --e se o contadorBCDMod100 conta de 0 até 99
        
        ENABLE <= '0'; --ENABLE ativo
        
        --Há 100 iterações nesse loop
        for DEZENA_INT in 0 to 9 loop
            for UNIDADE_INT in 0 to 9 loop
                DEZENA_VEC := std_logic_vector(to_unsigned(DEZENA_INT,4)); -- 4 é o número de bits 
                UNIDADE_VEC := std_logic_vector(to_unsigned(UNIDADE_INT,4));

                assert(DEZENA_VEC = DUT_DEZENA and UNIDADE_VEC = DUT_UNIDADE)
                report "Falha na contagem de " 
                & integer'image(DEZENA_INT) &  integer'image(UNIDADE_INT) severity error;

                clock <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; --Pulso de clock
            end loop;
        end loop;

        --Verificando se volta para 0 depois de 99
        assert(DUT_DEZENA = "0000" and DUT_UNIDADE = "0000") report "Contador nao reiniciou" severity ERROR;
        
		report "Teste bem-sucedido!" severity NOTE;
        wait;

end process;
end TB_BCDMod100_arch;