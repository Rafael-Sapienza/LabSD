LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity multiplexeador is
    port(S : in std_logic_vector(1 downto 0);
        D : in std_logic_vector(3 downto 0);
        Y : out std_logic);
end multiplexeador;

architecture output of multiplexeador is
    signal AUX : std_logic_vector(3 downto 0);
begin
    AUX(0) <= (not S(1)) and (not S(0));
    AUX(1) <= (not S(1)) and (S(0));
    AUX(2) <= (S(1)) and (not S(0));
    AUX(3) <= (S(1)) and (S(0));
    
    Y <= (D(0) and AUX(0)) or (D(1) and AUX(1)) or 
    (D(2) and AUX(2)) or (D(3) and AUX(3));  

end architecture output;