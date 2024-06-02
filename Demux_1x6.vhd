library ieee;
use ieee.std_logic_1164.all;

entity Demux_1x6 is
	port(   E : in std_logic;
		s: in std_logic_vector(2 downto 0);
		d: out std_logic_vector(5 downto 0));
end Demux_1x6;

architecture logic of Demux_1x6 is

begin

	d(0) <= E and not(s(2)) and not(s(1)) and not(s(0));
	d(1) <= E and not(s(2)) and not(s(1)) and     s(0) ;
	d(2) <= E and not(s(2)) and     s(1)  and not(s(0));
	d(3) <= E and not(s(2)) and     s(1)  and     s(0) ;
	d(4) <= E and     s(2)  and not(s(1)) and not(s(0));
	d(5) <= E and     s(2)  and not(s(1)) and     s(0) ;

end logic;