entity multiplexadorDuplo is
	port(A,B,C:in STD_LOGIC;
		X,Y: out STD_LOGIC);

architecture multiplexadorDuplo_arch of multiplexadorDuplo is

component MULTIPLEXADOR is
PORT(S: in std_logic_vector(2 downto 0);
	D: in std_logic_vector(7 downto 0);
	Y: out std_logic);
end component;

signal seletoras:STD_LOGIC_VECTOR(1 downto 0);
signal entradas:STD_LOGIC_VECTOR(3 downto 0);

begin

seletoras <= A&B;
entradas <= 1&not(C)&(C)&0;

U0: MULTIPLEXADOR port map(seletoras,entradas,X);

entradas <= C&0&not(C)&1;

U1: MULTIPLEXADOR port map(seletoras,entradas,Y);


end multiplexadorDuplo_arch;

