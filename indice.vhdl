library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity indice is port (
			clk: in std_logic;
		pcontrol: in std_logic_vector (7 downto 0);
			cs: in std_logic_vector(4 downto 0);
		reset: in std_logic;
			ix: inout  signed(7 downto 0));
end;
architecture arq_indice of indice is
begin
		process(clk, cs, reset)
		begin
		if reset = '1' then
			ix <= "00000000";
		else
	if (clk'event and clk = '1') then
					case cs is
					when "11010" => ix <= pcontrol;
					when "11011" => ix <= ix + 1;
					when others => null;
					end case;
				end if;
			end if;
		end process;
end; 
