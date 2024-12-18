LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity somadorCompleto is
    port(A, B, Cin: in std_logic;
    S, Cout: out std_logic);
end somadorCompleto;

architecture output of somadorCompleto is
begin
    S <= A xor B xor Cin;
    Cout <= (A and B) or (A and Cin) or (B and Cin);
end architecture output;
