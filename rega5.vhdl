library ieee;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;
entity rega5 is port (
						cs:in std_logic_vector (4 downto 0);
						clk: in std_logic;
				datoin:in signed(3 downto 0);
				reset: in std_logic;
						a:inout signed(3 downto 0));
					end rega5;
architecture impedancia of rega5 is
begin 
process(cs, clk, reset)
variable ares:signed(3 downto 0);
	begin
		if reset = '1' then
				a <= "0000";
		else
				if (clk'event and clk = '1') then
			case cs is
				when "10001" =>
				a <= datoin;
				when "11100" =>
				ares := a;
				when "11101" =>
				a <= ares;
				when others =>
				null ;
			end case;
		end if ;
	end if;
end process;
end;
