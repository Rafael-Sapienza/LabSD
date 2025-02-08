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
	when "0000" =>
	Q <= "0000"; RCO <= '1';
	if (RESET = '1') then
		nextState <= "0000";
	elsif (LOAD = '1') then
		nextState <= D;
	elsif (ENABLE = '0' and RCI = '0') then
		nextState <= unsigned(currentState) +1;
	else
		nextState <= currentState;
	end if;

	when "0001" =>
	Q <= "0001"; RCO <= '1';
	if (RESET = '1') then
		nextState <= "0000";
	elsif (LOAD = '1') then
		nextState <= D;
	elsif (ENABLE = '0' and RCI = '0') then
		nextState <= unsigned(currentState) + 1;
	else
		nextState <= currentState;
	end if;

	when "0010" =>
	Q <= "0010"; RCO <= '1';
	if (RESET = '1') then
		nextState <= "0000";
	elsif (LOAD = '1') then
		nextState <= D;
	elsif (ENABLE = '0' and RCI = '0') then
		nextState <= unsigned(currentState) + 1;
	else
		nextState <= currentState;
	end if;

	when "0011" =>
	Q <= "0011"; RCO <= '1';
	if (RESET = '1') then
		nextState <= "0000";
	elsif (LOAD = '1') then
		nextState <= D;
	elsif (ENABLE = '0' and RCI = '0') then
		nextState <= unsigned(currentState) + 1;
	else
		nextState <= currentState;
	end if;

	when "0100" =>
	Q <= "0100"; RCO <= '1';
	if (RESET = '1') then
		nextState <= "0000";
	elsif (LOAD = '1') then
		nextState <= D;
	elsif (ENABLE = '0' and RCI = '0') then
		nextState <= unsigned(currentState) + 1;
	else
		nextState <= currentState;
	end if;

	when "0101" =>
	Q <= "0101"; RCO <= '1';
	if (RESET = '1') then
		nextState <= "0000";
	elsif (LOAD = '1') then
		nextState <= D;
	elsif (ENABLE = '0' and RCI = '0') then
		nextState <= unsigned(currentState) + 1;
	else
		nextState <= currentState;
	end if;

	when "0110" =>
	Q <= "0110"; RCO <= '1';
	if (RESET = '1') then
		nextState <= "0000";
	elsif (LOAD = '1') then
		nextState <= D;
	elsif (ENABLE = '0' and RCI = '0') then
		nextState <= unsigned(currentState) + 1;
	else
		nextState <= currentState;
	end if;

	when "0111" =>
	Q <= "0111"; RCO <= '1';
	if (RESET = '1') then
		nextState <= "0000";
	elsif (LOAD = '1') then
		nextState <= D;
	elsif (ENABLE = '0' and RCI = '0') then
		nextState <= unsigned(currentState) + 1;
	else
		nextState <= currentState;
	end if;

	when "1000" =>
	Q <= "1000"; RCO <= '1';
	if (RESET = '1') then
		nextState <= "0000";
	elsif (LOAD = '1') then
		nextState <= D;
	elsif (ENABLE = '0' and RCI = '0') then
		nextState <= unsigned(currentState) + 1;
	else
		nextState <= currentState;
	end if;

	when "1001" =>
	Q <= "1001"; RCO <= '0';
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
	nextState <= "0000";
	end case;

end process comb_proc;

end contadorMod10_arch;



