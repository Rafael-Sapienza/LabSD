library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity maquinaDeVendas is
port
(
	clock: in std_logic;
	A:in std_logic_vector(1 downto 0);
	P, M_25, M_50: out std_logic
);
end maquinaDeVendas;

architecture maquinaDeVendas_arch of maquinaDeVendas is

type estado is (Idle, C_25, C_50, C_75, T_25, T_50, T_75, LiberaComT_25, LiberaSemT);

signal currentState, nextState: estado;

begin

sync_proc: process(clock)
begin
	if rising_edge(clock) then
		currentState <= nextState;
	end if;
end process sync_proc;

comb_proc: process(currentState,A)
begin
	case currentState is
	when Idle =>
	P <= '0'; M_25 <= '0'; M_50 <= '0';
	if (A = "01") then
		nextState <= C_25;
	elsif (A = "10") then
		nextState <= C_50;
	else 
		nextState <= currentState;
	end if;

	when C_25 =>
	P <= '0'; M_25 <= '0'; M_50 <= '0';
	if (A = "01") then
		nextState <= C_50;
	elsif (A = "10") then 
		nextState <= C_75;
	elsif (A = "11") then
		nextState <= T_25;
	else
		nextState <= currentState;
	end if;

	when C_50 =>
	P <= '0'; M_25 <= '0'; M_50 <= '0';
	if (A = "01") then
		nextState <= C_75;
	elsif (A = "10") then 
		nextState <= LiberaSemT;
	elsif (A = "11") then
		nextState <= T_50;
	else
		nextState <= currentState;
	end if;

	when C_75 =>
	P <= '0'; M_25 <= '0'; M_50 <= '0';
	if (A = "01") then
		nextState <= LiberaSemT;
	elsif (A = "10") then 
		nextState <= LiberaComT_25;
	elsif (A = "11") then
		nextState <= T_75;
	else
		nextState <= currentState;
	end if;

	when T_25 =>
	P <= '0'; M_25 <= '1'; M_50 <= '0';
	nextState <= Idle;

	when T_50 =>
	P <= '0'; M_25 <= '0'; M_50 <= '1';
	nextState <= Idle;

	when T_75 =>
	P <= '0'; M_25 <= '1'; M_50 <= '1';
	nextState <= Idle;

	when LiberaComT_25 =>
	P <= '1'; M_25 <= '1'; M_50 <= '0';
	nextState <= Idle;

	when LiberaSemT =>
	P <= '1'; M_25 <= '0'; M_50 <= '0';
	nextState <= Idle;

	when others => 
	P <= '0'; M_25 <= '0'; M_50 <= '0';
	end case;
end process comb_proc;

end maquinaDeVendas_arch;



