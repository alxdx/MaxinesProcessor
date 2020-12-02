library ieee;
use ieee.std_logic_1164.all ;
entity dir_val is port (
                vma: out s td_logic;
                 cs:in std_logic_vector (4 downto 0) ) ;
end;
architecture arq_dir_val of dir_val is
begin
     process(cs)
           begin
            vma <= (not (cs(3)) and cs(2) and cs(l) and not (cs(0)))
  or (cs(3) and not (cs{2)) and not (cs(l)) and not (cs(0)));
  end process;
end; 