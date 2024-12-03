LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity multiplexadorDuplo is
	port(A,B,C:in STD_LOGIC;
		X,Y: out STD_LOGIC);
end entity;

architecture multiplexadorDuplo_arch of multiplexadorDuplo is

component INVERSORA is
	PORT(X: in std_logic;
	Y: out std_logic);
end component;


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
signal notC:STD_LOGIC;


begin

seletorasX <= B&C;
entradasX <= "1"&A&"0"&A;

U0: MULTIPLEXADOR4x1 port map(seletorasX,entradasX,X);

seletorasY <= A&B;

U1:INVERSORA port map(C,notC);

entradasY <= C&"0"&notC&"1";

U2: MULTIPLEXADOR4x1 port map(seletorasY,entradasY,Y);


end multiplexadorDuplo_arch;

