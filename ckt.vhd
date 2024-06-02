library ieee;
use ieee.std_logic_1164.all;

entity ckt  is
	port(V: in std_logic_vector(9 downto 0);
	    C: in std_logic_vector(5 downto 0);
	    T,clock,rst: in std_logic;
            L: out std_logic;
            I: out std_logic_vector(5 downto 0)
	);
end ckt ;

architecture log of ckt is

component teste_mde is
   port (ck, rst : in  std_logic;
	 BS, Cx, Clr_f, Nor_sreg, comp : in std_logic;
         clear, ld_reg, sub_load, en_comp, L : out std_logic;
	 s : out std_logic_vector(1 downto 0)
	 );
end component teste_mde;

component operacional is
	port( V: in std_logic_vector(9 downto 0);
	    C: in std_logic_vector(5 downto 0);
	    T,clear,ld_reg,en_comp,sub_load,clock: in std_logic;
            B_S,clrf,Cx,Nor_sreg,comp: out std_logic;
            I: out std_logic_vector(5 downto 0)
	);
end component operacional;

signal BS,Cx, Clr_f, Nor_sreg, comp,clear, ld_reg, sub_load, en_comp: std_logic;
signal s: std_logic_vector(1 downto 0);

begin
        bloco_operacional: operacional port map(V,C,T,clear,ld_reg,en_comp,sub_load,clock,BS,Clr_f,Cx,Nor_sreg,comp,I);
	mde: teste_mde port map(clock, rst,BS, Cx, Clr_f, Nor_sreg,comp,clear, ld_reg, sub_load, en_comp, L,s);

end log;
