LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity muxDecoder is
	port(A,B,C,D,E,F,G:in STD_LOGIC;
		Z: out STD_LOGIC);
end entity;

architecture muxDecoder_arch of muxDecoder is

component orGate is
port(X1: in std_logic;
    X2: in std_logic;
	Y: out std_logic);
end component;


component MULTIPLEXADOR8x1 is
	PORT(S: in std_logic_vector(2 downto 0);
		D: in std_logic_vector(7 downto 0);
		Y: out std_logic);
end component;

component DECODIFICADOR4X16 is
	PORT(A: in std_logic_vector(3 downto 0);
		Y: out std_logic_vector(15 downto 0));
end component;


signal inDecoder:STD_LOGIC_VECTOR(3 downto 0);
signal outDecoder:STD_LOGIC_VECTOR(15 downto 0);
signal selectorsMux:STD_LOGIC_VECTOR(2 downto 0);
signal inMux:STD_LOGIC_VECTOR(7 downto 0);
signal aux1:STD_LOGIC;
signal aux2:STD_LOGIC;

begin

inDecoder <= A&B&C&D;
selectorsMux <= E&F&G;

U0: DECODIFICADOR4X16 port map(inDecoder,outDecoder);

inMux(7) <= '1';
inMux(6) <= outDecoder(11);
inMux(5) <= '0';

U1: orGate port map(outDecoder(9),outDecoder(15),aux1);

inMux(4) <= aux1;
inMux(3) <= '1';
inMux(2) <= outDecoder(7);

U2: orGate port map(outDecoder(0),outDecoder(15),aux2);

inMux(1) <= aux2;
inMux(0) <= '0';

U3: MULTIPLEXADOR8x1 port map(selectorsMux,inMux,Z);


end muxDecoder_arch;

