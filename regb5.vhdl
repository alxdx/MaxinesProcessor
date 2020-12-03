library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regb5 is port(
				cs:in std_logic_vector (4 downto 0);
			clk,reset : in std_logic;
			datoin:in signed(3 downto 0);
				b: inout signed (3 downto 0));
end;
architecture impedancia of regb5 is
begin
		process(cs, clk, reset)
		variable bres : signed(3 downto 0);
	begin
		if reset = '1' then
			b <= "0000";
			else
			if (clk'event and clk = '1') then
			case cs is
when "10010" =>
					b <= datoin;
					when "11100" =>
					bres := b;
					when "11101" =>
					b <= bres;
					when others =>
					null;
			end case;
		end if;
	end if;
end process;
end;
