library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity alu4 is port (
            clk:in std_logic;
            a,b:in  signed(3 downto 0);
               cs:in std_logic_vector (4 downto 0);
        operacion:inout signed(3 downto 0);
               rc:inout std_logic_vector (3 downto 0));
end alu4;

architecture sumar of alu4 is
signal cl:std_logic_vector (1 downto 0);
begin
     process(clk)
     variable Cout: std_logic;
     begin
     if (clk 'event and clk = '1') then
--Selecciona una operación,
       case cs is
       when "00001" =>
       operacion <= (a + b) ;
       cl(0)<=(a(1) and b(1)) or ((a(0) and b(0)) and (a(1) xor b(1)));
       cl(1)<= (a(2) and b(2)) or (cl(0) and (a(2) xor b(2)));
       Cout:=(a(3) and b(3)) or (cl(1) and (a(3) xor b(3)));
                   when "00010" =>
                   operacion <= (a - b) ;
                   if (a >= b) then
                   Cout := '1';
                   cl(0)<= '1';
                   else
                   Cout := '0' ;
                   cl(0)<= '0';
                   end if;
                   when "00011" =>
                   operacion <= (a and b) ;
                   Cout := '0';
                   cl(0)<= '0';
                   when "00100" =>
                   operacion <= (a or b) ;
                   Cout := '0' ;
                   cl(0)<= '0';
                   when "00101" =>
                   operacion <= (not a) ;
                   Cout := '0';
                   cl (0)<= '0' ;
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
                 rc(3)<= Cout xor cl(1); -- Sobreflujo
                 rc(2)<= not(operacion(3) or operacion(2) or operacion(1) or operacion(0));
                 -- Cero
                 rc(1)<= operacion(3); --Signo
                 rc(0)<= Cout; --Acarreo
          end process;
    end;
