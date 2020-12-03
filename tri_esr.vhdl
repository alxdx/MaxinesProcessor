library ieee;
use ieee.std_logic_1164.all;

entity tri_esr is port (
		cs:in std_logic_vector (4 downto 0);
		clk: in std_logic;
	operacion:in std_logic_vector (3 downto 0);
		datout:inout std_logic_vector (3 downto 0));
end;
architecture arq_tri of tri_esr is
begin
	process(cs, clk)
	begin
		if (clk'event and clk = '1') then
		case cs is
			when "11000" => datout <= operacion;
			when others => datout <= "ZZZZ";
			end case;
		end if;
	end process;
end;
