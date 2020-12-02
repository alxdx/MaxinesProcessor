library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
entity pe is port(
		elk: in std_logic;
	pcontrol: in std_logic_vector (7 downto 0);
		cs: in std_logic_vector(4 downto 0);
		reset: in std_logic;
		pila: in std_logic_vector (7 downto 0);
		pcout: inout std_logic_vector (7 downto 0)
end;
architecture arq pc of pc is
begin 
	process(elk, cs, reset)
	begin
		if reset = "1" then
		pc <= "00000000";
		else
if (elk'event and elk = '1') then
			case cs is
				when "11110" => pcout <= pcontrol;
				when "11111" => pcout <= pcout + 1;
				when "11101" => pcout <= pila;
				when others => null;
				end case;
			end if;
		end if;
	end process;
end;
