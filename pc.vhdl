library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity pc is port(
		clk: in std_logic;
	pcontrol: in signed(7 downto 0);
		cs: in std_logic_vector(4 downto 0);
		reset: in std_logic;
		pila: in signed(7 downto 0);
		pcout: inout signed (7 downto 0));
end pc;
architecture arq_pc of pc is
begin 
	process(clk, cs, reset)
	begin
		if reset = '1' then
		pcout <= "00000000";
		else
if (clk'event and clk = '1') then
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
