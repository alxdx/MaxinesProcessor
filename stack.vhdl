library ieee;
use ieee.std_logic_1164.all;
use work.std_arith.all;
entity stack is port (
					clk: in std_logic;
					pcout: in std_logic_vector (7 downto 0);
					pila: inout std_logic_vector (7 downto 0);
					reset: in std_logic;



						es: in std_logic_vector (4 downto 0));
end;
architecture arq_stack of stack is
begin
		process (elk, cs, reset)
		variable q: std_logic_vector (7 downto 0);
		begin
			if reset = '1' then
				pila <="00000000";
			else
				if (elk1event and elk = '1') then
					case cs is
					when "11100" => pila <= pcout;
					when others => null;
					end case;
				end if;
			end if;
			end process;
end;
