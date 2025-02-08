library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity topModuleBCDMod100 is
end topModuleBCDMod100;

architecture topModuleBCDMod100_arch of topModuleBCDMod100 is

    component contadorMod100 is
    port(clock: in std_logic;
        Reset:in std_logic;
        Enable: in std_logic;
        LOAD: in std_logic;
        D_UNIDADE: in std_logic_vector(3 downto 0);
        D_DEZENA: in std_logic_vector(3 downto 0);
        Q_UNIDADE: out std_logic_vector(3 downto 0);
        Q_DEZENA: out std_logic_vector(3 downto 0));
    end component;

    component TB_BCDMod100 IS
    PORT(DUT_UNIDADE, DUT_DEZENA: in std_logic_vector (3 downto 0);
        clock: out std_logic;
        RESET: out std_logic;
        ENABLE: out std_logic;
        LOAD: out std_logic;
        D_UNIDADE, D_DEZENA: out std_logic_vector (3 downto 0));
    end component;

    signal DUT_DEZENA_v2, DUT_UNIDADE_v2: std_logic_vector(3 downto 0);
    signal D_DEZENA_v2, D_UNIDADE_v2: std_logic_vector(3 downto 0);
    signal RESET_v2,ENABLE_v2,LOAD_v2,clock_v2: std_logic;


begin
    U0: contadorMod100 port map(clock_v2,RESET_v2,ENABLE_v2,LOAD_v2,D_UNIDADE_v2,D_DEZENA_v2,DUT_UNIDADE_v2,DUT_DEZENA_v2);
    U1: TB_BCDMod100 port map(DUT_UNIDADE_v2,DUT_DEZENA_v2,clock_v2,RESET_v2,ENABLe_v2,LOAD_v2,D_UNIDADE_v2,D_DEZENA_v2);
end topModuleBCDMod100_arch;