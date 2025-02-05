library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contadorMod100 is
port
(
	clock: in std_logic;
	Reset:in std_logic;
	Enable: in std_logic;
	LOAD: in std_logic;
	D_UNIDADE: in std_logic_vector(3 downto 0);
	D_DEZENA: in std_logic_vector(3 downto 0);
	Q_UNIDADE: out std_logic_vector(3 downto 0);
	Q_DEZENA: out std_logic_vector(3 downto 0)
);
end contadorMod100;

architecture contadorMod100_arch of contadorMod100 is

    component contadorMod10 is
        port(clock :in std_logic;
	Reset:in std_logic;
	Enable: in std_logic;
	RCL: in std_logic;
	LOAD: in std_logic;
	D: in std_logic_vector(3 downto 0);
	Q: out std_logic_vector(3 downto 0);
	RCO: out std_logic);
    end component;

    signal RCO_v2,RCO_v3: std_logic;

begin
    U0: contadorMod10 port map(clock,RESET,ENABLE,ENABLE,LOAD,D_UNIDADE,Q_UNIDADE,RCO_v2);
    U1: contadorMod10 port map(clock,RESET,ENABLE,RCO_v2,LOAD,D_DEZENA,Q_DEZENA,RCO_v3);
end contadorMod100_arch;
