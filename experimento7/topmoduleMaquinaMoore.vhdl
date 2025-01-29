library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity topmoduleMaquinaDeVendas is
end topmoduleMaquinaDeVendas;

architecture topmoduleMaquinaDeVendas_arch of topmoduleMaquinaDeVendas is

    component maquinaDeVendas is
        port(clock :in std_logic;
            A: in std_logic_vector(1 downto 0);
            P,M_25,M_50: out std_logic);
    end component;

    component TBMaquinaDeVendas is
    PORT(clock: out std_logic;
        A: out std_logic_vector(1 downto 0));
    end component;

    signal A_v2: std_logic_vector(1 downto 0);
    signal clock_v2: std_logic;
    signal P_v2,M_25_v2,M_50_v2:  std_logic;

begin
    U0: maquinaDeVendas port map(clock_v2,A_v2,P_v2,M_25_v2,M_50_v2);
    U1: TBMaquinaDeVendas port map(clock_v2,A_v2);
end topmoduleMaquinaDeVendas_arch;