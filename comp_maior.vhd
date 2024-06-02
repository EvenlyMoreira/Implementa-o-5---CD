library ieee;
use ieee.std_logic_1164.all;

entity comp_maior is
    port (x,y: in  std_logic_vector(9 downto 0);
          maior: out std_logic
);
end comp_maior;

architecture log of comp_maior is

signal w1,w2,w3,w4,w5,w6,w7,w8,w9: std_logic;

begin
    
    w9 <= (x(9) xnor y(9));
    w8 <= ((x(9) xnor y(9)) and (x(8) xnor y(8)));
    w7 <= ((x(9) xnor y(9)) and (x(8) xnor y(8)) and (x(7) xnor y(7)));
    w6 <= ((x(9) xnor y(9)) and (x(8) xnor y(8)) and (x(7) xnor y(7)) and (x(6) xnor y(6)));
    w5 <= ((x(9) xnor y(9)) and (x(8) xnor y(8)) and (x(7) xnor y(7)) and (x(6) xnor y(6))
    and (x(5) xnor y(5)));
    w4 <= ((x(9) xnor y(9)) and (x(8) xnor y(8)) and (x(7) xnor y(7)) and (x(6) xnor y(6))
    and (x(5) xnor y(5)) and (x(4) xnor y(4)));
    w3 <= ((x(9) xnor y(9)) and (x(8) xnor y(8)) and (x(7) xnor y(7)) and (x(6) xnor y(6))
    and (x(5) xnor y(5)) and (x(4) xnor y(4)) and (x(3) xnor y(3)));
    w2 <= ((x(9) xnor y(9)) and (x(8) xnor y(8)) and (x(7) xnor y(7)) and (x(6) xnor y(6))
    and (x(5) xnor y(5)) and (x(4) xnor y(4)) and (x(3) xnor y(3)) and (x(2) xnor y(2)));
    w1 <= ((x(9) xnor y(9)) and (x(8) xnor y(8)) and (x(7) xnor y(7)) and (x(6) xnor y(6))
    and (x(5) xnor y(5)) and (x(4) xnor y(4)) and (x(3) xnor y(3)) and (x(2) xnor y(2)) and (x(1) xnor y(1)));


    maior <= (x(8) and not(y(8)) and w9) or (x(7) and not(y(7)) and w8) or (x(6) and not(y(6)) and w7)
    or (x(5) and not(y(5)) and w6) or (x(4) and not(y(4)) and w5) or (x(3) and not(y(3)) and w4) or 
   (x(2) and not(y(2)) and w3) or (x(1) and not(y(1)) and w2) or (x(0) and not(y(0)) and w1);

end log;
