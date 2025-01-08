library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flipflopJK is
Port (PR,CLR,CLK,J,K: in std_logic;
	Q: out std_logic);
end flipflopJK;

architecture flipflopJK_arch of flipflopJK is
signal Qbuf : std_logic;
signal JK:std_logic_vector(1 downto 0);
begin
JK <= J&K;
process(PR,CLR,CLK,J,K)
begin
	if PR = '1' then Q <= '1';
	elsif CLR = '1' then Q <= '0';
	elsif rising_edge(CLK) then
		case JK is
		when "00" => Qbuf <= Qbuf;
		when "01" => Qbuf <= '0';
		when "10" => Qbuf <= '1';
		when "11" => Qbuf <= not(Qbuf);
		when others => Qbuf <= Qbuf;
		end case;
	else Qbuf <= Qbuf;
	end if;
	Q <= Qbuf;
end process;
end flipflopJK_arch;