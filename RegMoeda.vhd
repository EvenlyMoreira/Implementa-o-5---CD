library ieee;
use ieee.std_logic_1164.all;

entity RegMoeda is
   port (cx, clr_x ,ld_reg,clock: in  std_logic;
                       M : out std_logic);
end RegMoeda;

architecture log of RegMoeda is 

component ffd is
   port (ck, clr, set, d : in  std_logic;
                       q : out std_logic);
end component;


signal V_M: std_logic;
signal Nclr_x: std_logic;
begin
	  V_M<=(ld_reg and cx);
	  Nclr_x<= not (clr_x);
	  M1: ffd port map(clock,Nclr_x,'1',V_M,M);



end log;


