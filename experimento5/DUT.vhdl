LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity DUT is
	port(A,B :in STD_LOGIC_VECTOR (3 downto 0);
		S: out STD_LOGIC_VECTOR (4 downto 0));
end entity;

architecture DUT_arch of DUT is

component somadorCompleto is
    port(A, B, Cin: in std_logic;
    S, Cout: out std_logic);
end component;


signal vai_um:STD_LOGIC_VECTOR(2 downto 0);


begin

U0: somadorCompleto port map(A(0), B(0), '0', S(0), vai_um(0));

U1: somadorCompleto port map(A(1), B(1), vai_um(0), S(1), vai_um(1));

U2: somadorCompleto port map(A(2), B(2), vai_um(1), S(2), vai_um(2));

U3: somadorCompleto port map(A(3), B(3), vai_um(2), S(3), S(4));

end DUT_arch;

