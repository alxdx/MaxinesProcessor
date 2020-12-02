library ieee;
use ieee.std_logic_1164.all;
use work.std_ari th.all;
entity alu4 is port (
            clk:in std_logic;
            a,b:in std_logic_vector (3 downto 0);
               cs:in std_logic_vector (4 downto 0);
        operacion:inout std_logic_vector (3 downto 0);
               re:inout std_logic_vector (3 downto 0));
end alu4;
architecture sumar of alu4 is
signal el:std_logic_vector (1 downto 0);
begin
     process(clk)
     variable Cout: std_logic;
     begin
     if (clk 'event and clk = '1') then
--Selecciona una operación,
       case cs is
       when "00001" =>
       operacion <= (a + b) ;
       cl(0)<=(a(l) and b(l)) or ((a(0) and b(0)) ard (a(l) xorb(l)));
       cl(l)<= (a(2) and b(2)) or (cl(0) and (a(2) xorb(2)));
       Cout:=(a(3) andb(3)) or (cl(l) and (a(3) xor b(3)));
                   when "00010" =>
                   operacion <= (a - b) ;
                   if (a >= b) then
                   Cout := '1';
                   C1(0)<= '1 ^1 ;
                   else
                   Cout := ' 0 ' ;
                   cl(0)<= •0';
                   end if;
                   when "00011" =>
                   operacion <= (a and b) ;
                   Cout := ^1 0 ^1;
                   cl(0)<= '0';
                   when "00100" =>
                   operacion <= (a or b) ;
                   Cout := ' 0 ' ;
                   cl(0)<= ^1 0 ^1;
                   when "00101" =>
                   operacion <= (not a) ;
                   Cout := '0 ^1;
                   cl (0)<= ' 0 ' ;
                   when "00110" =>
                   operacion <= (a xor b) ;
                   Cout := '0';
                   cl (0)<= '0';

                   when "00111" =>
                   operacion <= (a and "1111");
                   Cout := Cout;
                   cl(0) <= cl(0);
          
                   when others =>
                   null ;
             end case;
             end if;
                 rc(3)<= Cout xor cl(l); -- Sobreflujo
                 rc(2)<= not(operacion(3) or operacion(2) or
 operacion(1) or operacion(0));
                 -- Cero
                 rc(l)<= operacion(3); —Signo
                 rc(0)<= Cout; --Acarreo
          end process;
    end;