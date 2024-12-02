LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity multiplexadorDuplo is
	port(A,B,C:in STD_LOGIC;
		X,Y: out STD_LOGIC);
end entity;

architecture multiplexadorDuplo_arch of multiplexadorDuplo is

component MULTIPLEXADOR4x1 is
PORT(S: in std_logic_vector(1 downto 0);
	D: in std_logic_vector(3 downto 0);
	Y: out std_logic);
end component;

--Definindo sinais seletores e de entrada para
--o multiplexador com saida X
signal seletorasX:STD_LOGIC_VECTOR(1 downto 0);
signal entradasX:STD_LOGIC_VECTOR(3 downto 0);

--Definindo sinais seletores e de entrada para
--o multiplexador com saida Y
signal seletorasY:STD_LOGIC_VECTOR(1 downto 0);
signal entradasY:STD_LOGIC_VECTOR(3 downto 0);

begin

seletoras <= B&C;
entradas <= "1"&A&"0"&A;

U0: MULTIPLEXADOR port map(seletorasX,entradasX,X);

seletoras <= A&B;
entradas <= C&"0"&not(C)&"1";

U1: MULTIPLEXADOR port map(seletorasY,entradasY,Y);


end multiplexadorDuplo_arch;
