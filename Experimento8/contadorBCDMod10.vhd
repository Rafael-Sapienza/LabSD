library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contadorMod10 is
port
(
	clock: in std_logic;
	Reset:in std_logic;
	Enable: in std_logic;
	RCI: in std_logic;
	LOAD: in std_logic;
	D: in std_logic_vector(3 downto 0);
	Q: out std_logic_vector(3 downto 0);
	RCO: out std_logic
);
end contadorMod10;

architecture contadorMod10_arch of contadorMod10  is

signal currentState, nextState: std_logic_vector(3 downto 0);

begin

sync_proc: process(clock)
begin
	if rising_edge(clock) then
		currentState <= nextState;
	end if;
end process sync_proc;

comb_proc: process(currentState,RESET,LOAD,ENABLE,RCI,D)
begin
	case currentState is
	when "1011" =>
	nextState <= "0000"; Q <= "0000";

	when "1101" =>
	nextState <= "0000"; Q <= "0000";

	when "1111" =>
	nextState <= "0000"; Q <= "0000";

	when "1001" =>
	Q <= currentState; RCO <= '0';
	if (RESET = '1') then
		nextState <= "0000";
	elsif (LOAD = '1') then
		nextState <= D;
	elsif (ENABLE = '0' and RCI = '0') then
		nextState <= "0000";
	else
		nextState <= currentState;
	end if;

	when others => 
	Q <= currentState; RCO <= '1';
	if (RESET = '1') then
		nextState <= "0000";
	elsif (LOAD = '1') then
		nextState <= D;
	elsif (ENABLE = '0' and RCI = '0') then
		nextState <= unsigned(currentState) +1;
	else
		nextState <= currentState;
	end if;
	end case;

end process comb_proc;

end contadorMod10_arch;