library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity maquinaDeVendas is
port
(
	clock: in std_logic;
	A:in std_logic_vector(1 downto 0);
	Produto, Moeda_25, Moeda_50: out std_logic
);
end maquinaDeVendas;

architecture maquinaDeVendas_arch of maquinaDeVendas is

type estado is (Idle, Centavos_25, Centavos_50, Centavos_75, Troco_25, Troco_50, Troco_75, LiberaComTroco_25, LiberaSemTroco);

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
	Produto <= '0'; Moeda_25 <= '0'; Moeda_50 <= '0';
	if (A = "01") then
		nextState <= Centavos_25;
	elsif (A = "10") then
		nextState <= Centavos_50;
	else 
		nextState <= currentState;
	end if;

	when Centavos_25 =>
	Produto <= '0'; Moeda_25 <= '0'; Moeda_50 <= '0';
	if (A = "01") then
		nextState <= Centavos_50;
	elsif (A = "10") then 
		nextState <= Centavos_75;
	elsif (A = "11") then
		nextState <= Troco_25;
	else
		nextState <= currentState;
	end if;

	when Centavos_50 =>
	Produto <= '0'; Moeda_25 <= '0'; Moeda_50 <= '0';
	if (A = "01") then
		nextState <= Centavos_75;
	elsif (A = "10") then 
		nextState <= LiberaSemTroco;
	elsif (A = "11") then
		nextState <= Troco_50;
	else
		nextState <= currentState;
	end if;

	when Centavos_75 =>
	Produto <= '0'; Moeda_25 <= '0'; Moeda_50 <= '0';
	if (A = "01") then
		nextState <= LiberaSemTroco;
	elsif (A = "10") then 
		nextState <= LiberaComTroco_25;
	elsif (A = "11") then
		nextState <= Troco_75;
	else
		nextState <= currentState;
	end if;

	when Troco_25 =>
	Produto <= '0'; Moeda_25 <= '1'; Moeda_50 <= '0';
	nextState <= Idle;

	when Troco_50 =>
	Produto <= '0'; Moeda_25 <= '0'; Moeda_50 <= '1';
	nextState <= Idle;

	when Troco_75 =>
	Produto <= '0'; Moeda_25 <= '1'; Moeda_50 <= '1';
	nextState <= Idle;

	when LiberaComTroco_25 =>
	Produto <= '1'; Moeda_25 <= '1'; Moeda_50 <= '0';
	nextState <= Idle;

	when LiberaSemTroco =>
	Produto <= '1'; Moeda_25 <= '0'; Moeda_50 <= '0';
	nextState <= Idle;

	when others => 
	Produto <= '0'; Moeda_25 <= '0'; Moeda_50 <= '0';
	end case;
end process comb_proc;

end maquinaDeVendas_arch;



