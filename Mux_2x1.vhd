library ieee;
use ieee.std_logic_1164.all;

entity Mux_2x1 is
	port(   E0, E1 : in std_logic_vector(9 downto 0);
		sel :  in std_logic;
		S : out std_logic_vector(9 downto 0)
	);
end Mux_2x1;

architecture logic of Mux_2x1 is

begin

	S(0) <= (E0(0) and not(sel)) or (E1(0) and sel);
	S(1) <= (E0(1) and not(sel)) or (E1(1) and sel);
	S(2) <= (E0(2) and not(sel)) or (E1(2) and sel);
	S(3) <= (E0(3) and not(sel)) or (E1(3) and sel);
	S(4) <= (E0(4) and not(sel)) or (E1(4) and sel);
	S(5) <= (E0(5) and not(sel)) or (E1(5) and sel);
	S(6) <= (E0(6) and not(sel)) or (E1(6) and sel);
	S(7) <= (E0(7) and not(sel)) or (E1(7) and sel);
	S(8) <= (E0(8) and not(sel)) or (E1(8) and sel);
	S(9) <= (E0(9) and not(sel)) or (E1(9) and sel);

end logic;