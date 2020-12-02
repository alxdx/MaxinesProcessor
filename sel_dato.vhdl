library ieee;
use ieee.std_logic_1164.all ;
entity sel_dato is port(
			clk:in std_logic;
		datout:in std_logic_vector (3 downto 0);
		datoin:inout std_logic_vector (3 downto 0);
		operacion:in std_logic_vector (3 downto 0);
			cs:in std_logic_vector (4 downto 0)) ;
end;
architecture arq_sel_dato of sel_dato is
begin
		process(cs,clk)
			begin
				if (clk'event and clk = '1') then
					case cs is
						when "10110" => datoin <= datout;
						when "10101" => datoin <= operacion;
						when others => null;
					end case;
					end if;
			end process;
end ;
