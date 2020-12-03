library ieee;
use ieee.std_logic_1164.all;
entity sel_dir is port (
                pcout:in std_logic_vector (7 downto 0);
                 clk:in std_logic;
                 ix:in std_logic_vector (7 downto 0);
          dirección:out std_logic_vector (7 downto 0) ;
                 cs:in std_logic_vector (4 downto 0));
end sel_dir;
architecture arq_sel_dir of sel_dir is
begin
     process(cs, clk)
             begin
             if (clk'event and clk = '1') then
             case cs is
             when "11000" => dirección <= ix;

             when others => dirección <= pcout;
             end case;
             end if;
             end process;
end; 
