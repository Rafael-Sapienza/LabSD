library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity topmodule is
end topmodule;

architecture topmodule_arch of topmodule is

    component DUT is
        port(A,B :in STD_LOGIC_VECTOR (3 downto 0);
            S: out STD_LOGIC_VECTOR (4 downto 0));
    end component;

    component GM IS
    PORT(A,B: in std_logic_vector(3 downto 0);
        S: out std_logic_vector(4 downto 0));
    end component; 

    component TB IS
    PORT(f_DUT,f_GM: in std_logic_vector (4 downto 0);
        A,B: out std_logic_vector(3 downto 0));
    end component;

    signal A,B: STD_LOGIC_VECTOR (3 downto 0);
    signal f_DUT,f_GM:  STD_LOGIC_VECTOR (4 downto 0);

begin
    U0: DUT port map(A,B,f_DUT);
    U1: GM port map(A,B,f_GM);
    U2: TB port map(f_DUT,f_GM,A,B);
end topmodule_arch;