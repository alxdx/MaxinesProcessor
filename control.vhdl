library ieee;
use ieee.std_logic_1164.all ;
use work.std_arith.all;
entity control is port(
            reset,clk: in std_logic;
                  irq: in std_logic_vector (1 downto 0);
                   rw: inout std_logic;
               datoin: in std_logic_vector (3 downto 0);
             pcontrol: inout std_logic_vector {7 downto 0);
                   re: in std_logic_vector (3 downto 0);

                pcout: in std_logic_vector (7 downto 0);
                   cs: inout std_logic_vector (4 downto 0));
end control;
architecture arq_control of control is
type estados is (dO, di, d2, d3, d4, d5, d6, d7, d8, d9, dlO,
dll, dl2, dl3, dl4, dl5, dl6, dl7);
signal edo_presente, edo_futuro: estados;
signal f: std_logic_vector {7 downto 0);
begin
      procesol: process (edo_presente, irq, reset)
            begin
              if reset = ' 1 ' then
                 edo_futuro <= d0;
                 pcontrol <= "11111111";
                      rw <= ' 0'; 
                      CS <= "11110";
              else
          case edo_presente is
                  when dO =>
                  if irq = "10" then
                     es <= "11100";
                     edo futuro <= di;
                  elsif irq = "01" then
                     es <= "11100";
                     edo_futuro <= di;
                  else
                     edo_futuro <= d3;
                     es < = "11111";
                     end if;
                  when di =>
                  if irq = "10" then
                     pcontrol <= "01000000";
                     edo_futuro <= di;
                  elsif irq = "01" then
                     pcontrol <= "10000000';
                     edo_futuro <= di;
                  else
                     es <= "11110";
                     edo_futuro <= d3;
                  end if;
                  when d2 =>
                     es <= es;
                     edo_futuro <= d5;
                  when d3 =>
                     es <= "10110";
                     rw <= '1';
                     edo_futuro <= d4;
                  when d4 =>
                     rw <= ' 0';
                  if datoin = "0000" then
                     es <= "00001";
                  edo_futuro < = d2;
                     elsif datoin = "0001" then
                         es <= "00010";
                  edo_futuro <= d5; 
                    elsif datoin = "0010" then
                    cs <= "00011";
                  edo_futuro <= d5;
                  elsif datoin = "0011" then
                    cs <= "00100";
                  edo_futuro <= d5;
                    elsif datoin = "0100" then
                    cs <= "00101";
                  edo_futuro <= d5;
                  elsif datoin = "0101" then
                     cs <= "00110";
                  edo_futuro <= d5;
                  elsif datoin = "0110" then
                  cs <= "11111";
                  edo_futuro <= d6;
                  elsif datoin = "0111" then
                   cs <= "11111";
                  edo_futuro <= d7;
                  elsif datoin = "1000" then
                   cs <= "11111";
                  edo_futuro <= d8;
                  elsif datoin = "1001" then
                     cs <= "00111";
                  edo_futuro <= d9;
                  elsif datoin = "1010" then
                       cs <= "11011";
                  edo_futuro <= d0;
                  elsif datoin = "1011" then
                  cs <= "11111"; 
                  if re (0) = '1' then
                      edo_futuro <= dlO;
                  else
                      edo_futuro <= dO;
                  end if;
                  elsif datoin = "1100" then
                   es <= "11111";
                  if re (2) = '1' then
                       edo_futuro <= dlO;
                  else
                      edo_futuro <= dO;
                  end if;
                  elsif datoin = "1101" then
                   es <= "11111";
                   if re (1) = ' 1' then
                     edo_futuro <= dlO;
                   else
                    edo_futuro <= dO;
                  end if;
                  elsif datoin = "1110" then
                   es <= "11111";
                  if re (3) = '1' then
                    edo_futuro <= dlO;
                  else
                    edo_futuro <= dO;
                  end if;
else
es <= "11101";
edo_futuro <= dO;
end if;
when d5 =>
es "10101";
edo_futuro <= dll;
when d6 =>
es <= "10110";
rv; <= ' 1' ;
edo_futuro <= dl2; 
when d7 =>
cs <= "10110";
rw <=^1 1 ^1;
edo_futuro <= dll;
when d8 =>
cs <= "10110";
rw < = '1';
edo_futuro <= dl5;
when d9 =>
cs <= "11000";
edo_futuro <= dO;
when dlO =>
cs <= "10110";
rw <= ' 1' ;
edo_futuro <= dl6;
when dll =>
CS <= "10001";
rw <= '01;
edo_futuro <= dO;
when di 2 =>
CS <= "11111";
rw <=^1 0';
pcontrol(O) <= datoin(O);
pcontrol(1) <= datoin(l);
pcontrol(2) <= datoin(2);
pcontrol(3) <= datoin(3);
pcontrol(4) <= pcontrol(4);
pcontrol(5) <= pcontrol(5);
pcontrol(6) <= pcontrol(6);
pcontrol(7) <= pcontrol(7); 
when dl3 =>
es <= "10110";
rw <= '1';
edo_futuro <= dl4;
when dl4 =>
rw <= '0';
es <= "11010";
pcontrol(0) <= pcontrol(0);
pcontrol(l) <= pcontrol(l);
pcontrol(2) <= pcontrol(2);
pcontrol(3) <= pcontrol(3);
pcontrol(4) <= datoin(0);
pcontrol(5) <= datoin(l);
pcontrol(6) <= datoin(2);
pcontrol(7) <= datoin(3);
edo_futuro <= dO;
when di5 =>
es <= "10010";
rw <= ' 01;
edo_futuro <= dO;
when di6 =>
es <= "10000";
f (0)<= datoin(0);
f(1)<= datoin(1);
f(2)<= datoin(2);
f (3)<= '0' ;
f (4) <= " 0 ' ;
f(5)<= '0' ;
f(6)<= '0' ;
f(7)<= '0' ;
if datoin(3) = '0' then
pcontrol <= pcout + f;
edo_futuro <= dl7;
else
pcontrol <= pcout - f;
edo_futuro <= dl7;
end if;
when di7 =>
cs <= "11110";
edo_futuro <= dO;
end case;
end if;
end process procesol ;
proceso2: process(clk, reset)
begin
if (clk1 event and clk = '1') then
if reset = ' 0' then
edo_presente <= edo_futuro;
else
null ;
end if;
end if;
end process proceso2;
end; 