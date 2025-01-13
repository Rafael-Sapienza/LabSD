library IEEE;
use IEEE.std_logic_1164.all;

entity registradorDeslocamento is
    port(
        CLK, RST, LOAD, DIR, L, R: in std_logic;
        D: in std_logic_vector(3 downto 0);
        Q: out std_logic_vector(3 downto 0);
    )
end registradorDeslocamento;

architecture registradorDeslocamento_arch of registradorDeslocamento is
    signal Qbuf:std_logic_vector(3 downto 0);
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if RST = '1' then Qbuf <= "0000"; -- Reset do registrador
            elsif LOAD = '1' then Qbuf <= D; -- Carregamento via entrada paralela
            else
                case DIR is 
                when '0' => -- Deslocamento para esquerda
                    case L is
                        when '0' => Qbuf <= Qbuf(2 down to 0)&'0';
                        when '1' => Qbuf <= Qbuf(2 down to 0)&'1';
                        when others => Qbuf <= Qbuf;
                        end case;
                when '1' => -- Deslocamento para direita
                case R is
                    when '0' => Qbuf <= '0'&Qbuf(3 down to 1)';
                    when '1' => Qbuf <= '1'&Qbuf(3 down to 1);
                    when others => Qbuf <= Qbuf;
                    end case;
                when others => Qbuf <= Qbuf; -- Sem alterações
                end case;
            end if;
        end if;
    end process;
    Q <= Qbuf; -- Atibuição do buffer à saída
end registradorDeslocamento_arch