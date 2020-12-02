--cmicro--
library ieee;
use ieee.std_logic_1164.all ;
package cmicro is
component alu4 port (
                 clk:in std_logic;
                 a,b:in std_logic_vector (3 downto 0);
                 cs:in std_logic_vector (4 downto 0);
                 operacion: inout std_logic_vector (3 dcwnto 0);
 r                e:inout std_logic_vector (3 downto 0));
end component;
component rega5 port (
                  cs:in std_logic_vector (4 downto 0);
                  reset:in std_logic;
                  clk:in std_logic;
                  datoin:in std_logic_vector (3 downto 0);
                  a:inout std_logic_vector (3 downto 0));
end component;
component regb5 port (
               reset:in std_logic;
               cs:in std_logic_vector (4 downto 0);
               clk:in std_logic;
              datoin:in std_logic_vector (3 downto 0);
              b:inout std_logic_vector (3 downto 0));
end corrponent ;
component sel_dato port (
             clk:in std_logic;
             datout:in std_logic_vector (3 downto 0);
             datoin:inout std_logic_vectcr (3 downto 0);
             operacion:in std_logic_vector (3 downto 0);
             cs:in std_logic_vector (4 downto 0));
end component;
component tri_esr port (
            cs:in std_logic_vector (4 downto 0) ;
            operacion:in std_logic_vector (3 downto 0) ;
            datout:inout std_logic_vector (3 downto 0));
end component;
component pe port (
           clk: in std_logic;
           reset: in std_logic;
            pcontrol, pila: in std_logic_vector (7 downto 0) ;
           es: in std_logic_vector(4 dcwnto 0) ;
            pcout: inout std_logic_vector (7 downto 0));
end component;
component stack port (
           clk: in std_logic;
           pcout: in std_logic_vector (7 downto 0);
           reset: in std_logic;
           pila: inout std_logic_vector (7 downto 0);
           es: in std_logic_vector (4 downto 0) ) ;
end component;
component Índice port (
             clk: in std_logic;
             pcontrol: in std_logic_vector (7 downto 0);
            reset:in std_logic;
             es: in std_logic_vector(4 downto 0);
             ix: inout std_logic_vector (7 downto 0)) ;
end component;
component sel_dir port (
            pcout:in std_logic_vector (7 downto 0);
           clk:in std_logic;
            ix:in std_logic_vector (7 downto 0);
           dirección:out std_logic_vector (7 downto 0);
           cs:in std_logic_vector (4 downto 0));
end component;
component dir_val port (
          vma:out s td_log i c; 
end component;
         component control port (
         reset,clk: in std_logic;
         irq: in std_logic_vector (1 downto 0) ;
         rw: inout std_logic;
         datoin: in std_logic_vector (3 downto 0);
          pcontrol: inout std_logic_vector (7 downto 0);
         re: in std_logic_vector (3 downto 0) ;
         peout: in std_logic_vector (7 downto 0);
          cs: inout std_logic_vector (4 dcwnto 0) ) ;
end component;
end cmicro;