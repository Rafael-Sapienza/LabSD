library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity topmoduleMaquinaDeVendas is
end topmoduleMaquinaDeVendas;

architecture topmoduleMaquinaDeVendas_arch of topmoduleMaquinaDeVendas is

    component maquinaDeVendas is
        port(clock :in std_logic;
            A: in std_logic_vector(1 downto 0);
            P,M_25,M_50: out std_logic;
    end component;

    component TBMaquinaDeVendas IS
    PORT(clock: in std_logic;
        A: out std_logic_vector(1 downto 0));
    end component;

    signal A: std_logic_vector(1 downto 0);
    signal P,M_25,M_50:  std_logic;

begin
    U0: maquinaDeVendas port map(clock,A,P,M_25,M_50);
    U1: TBMaquinaDeVendas port map(clock,A);
end topmoduleMaquinaDeVendas;