--cmicro--
library ieee;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;

package cmicro is
component alu4 port (
                 clk:in std_logic;
                 a,b:in signed(3 downto 0);
                 cs:in std_logic_vector (4 downto 0);
                 operacion: inout signed(3 downto 0);
                 rc:inout std_logic_vector (3 downto 0));
end component;
component rega5 port (
                  cs:in std_logic_vector (4 downto 0);
                  reset:in std_logic;
                  clk:in std_logic;
                  datoin:in signed(3 downto 0);
                  a:inout signed(3 downto 0));
end component;
component regb5 port (
               reset:in std_logic;
               cs:in std_logic_vector (4 downto 0);
               clk:in std_logic;
              datoin:in signed(3 downto 0);
              b:inout signed(3 downto 0));
end component ;
component sel_dato port (
             clk:in std_logic;
             datout:in signed(3 downto 0);
             datoin:inout signed(3 downto 0);
             operacion:in signed(3 downto 0);
             cs:in std_logic_vector (4 downto 0));
end component;
component tri_esr port (
            cs:in std_logic_vector (4 downto 0) ;
            operacion:in signed(3 downto 0) ;
            datout:inout signed(3 downto 0));
end component;
component pc port (
           clk: in std_logic;
           reset: in std_logic;
            pcontrol, pila: in signed(7 downto 0) ;
           cs: in std_logic_vector(4 downto 0) ;
            pcout: inout signed(7 downto 0));
end component;
component stack port (
           clk: in std_logic;
           pcout: in signed(7 downto 0);
           reset: in std_logic;
           pila: inout signed(7 downto 0);
           cs: in std_logic_vector (4 downto 0) ) ;
end component;
component indice port (
             clk: in std_logic;
             pcontrol: in signed(7 downto 0);
            reset:in std_logic;
             cs: in std_logic_vector(4 downto 0);
             ix: inout signed(7 downto 0)) ;
end component;
component sel_dir port (
            pcout:in signed(7 downto 0);
           clk:in std_logic;
            ix:in signed(7 downto 0);
           direccion:out signed(7 downto 0);
           cs:in std_logic_vector (4 downto 0));
end component;
component dir_val port (
          vma:out std_logic;
          cs:in std_logic_vector (4 downto 0) ) ;
end component;

component control port (
         reset,clk: in std_logic;
         irq: in std_logic_vector (1 downto 0) ;
         rw: inout std_logic;
         datoin: in std_logic_vector (3 downto 0);
          pcontrol: inout signed(7 downto 0);
         rc: in std_logic_vector (3 downto 0) ;
         pcout: in signed(7 downto 0);
          cs: inout std_logic_vector (4 downto 0) ) ;
end component;
end cmicro;