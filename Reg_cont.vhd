library ieee;
use ieee.std_logic_1164.all;

entity Reg_cont is
	port( 	    E: in std_logic_vector(9 downto 0);
	         load: in std_logic;
		clear: in std_logic;
		clock: in std_logic;
		    S: out std_logic_vector(9 downto 0)
	);
end Reg_cont;

architecture logic of Reg_cont is
	
component ffd is
	port(ck, clr, set, d :  in std_logic;
			   q : out std_logic
	);
end component;

component Mux_2x1 is
	port(E0, E1 :  in std_logic_vector(9 downto 0);
		 sel :  in std_logic;
		  S : out std_logic_vector(9 downto 0)
	);
end component;

signal D, Q : std_logic_vector(9 downto 0);
signal set  : std_logic := '1';
signal clr : std_logic;

begin

        clr <= not(clear);

	M9 : Mux_2x1 port map(Q, E, load, D);
	F9 : ffd port map(clock, clr, set, D(9), Q(9));

	F8 : ffd port map(clock, clr, set, D(8), Q(8));

	F7 : ffd port map(clock, clr, set, D(7), Q(7));

	F6 : ffd port map(clock, clr, set, D(6), Q(6));

	F5 : ffd port map(clock, clr, set, D(5), Q(5));

	F4 : ffd port map(clock, clr, set, D(4), Q(4));
	
	F3 : ffd port map(clock, clr, set, D(3), Q(3));

	F2 : ffd port map(clock, clr, set, D(2), Q(2));

	F1 : ffd port map(clock, clr, set, D(1), Q(1));

	F0 : ffd port map(clock, clr, set, D(0), Q(0));

	S <= Q;

end logic;
