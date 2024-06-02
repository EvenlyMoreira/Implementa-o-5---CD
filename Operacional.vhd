library ieee;
use ieee.std_logic_1164.all;

entity operacional is
	port( V: in std_logic_vector(9 downto 0);
	    C: in std_logic_vector(5 downto 0);
	    T,clear,ld_reg,en_comp,sub_load,clock: in std_logic;
            B_S,clrf,Cx,Nor_sreg,comp: out std_logic;
            I: out std_logic_vector(5 downto 0)
	);
end operacional;

architecture log of operacional is

	component BS IS 
 	PORT(
	BS_in, ck: IN STD_LOGIC;
	BS_out: OUT STD_LOGIC
	);
	END component BS;

	component Reg_valor is
 	Port (
        clock,load: in std_logic;
        valor,subtracao : in std_logic_vector(9 downto 0);
        valor_reg: out std_logic_vector(9 downto 0)
	);
	end component Reg_valor;

	component subtrator_de_valor is
	port(   V_reg : in std_logic_vector(9 downto 0);
		decod : in std_logic_vector(6 downto 0);
		sub_load : in std_logic;
		Saida : out std_logic_vector(9 downto 0)
	);
	end component subtrator_de_valor;

	component Decod6x7 IS 
	PORT(
	    A, B, C, D, E, F: IN STD_LOGIC;
	    x: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
	END component Decod6x7;

	component RegMoeda is
	port (cx, clr_x ,ld_reg,clock: in  std_logic;
                M : out std_logic);
	end component RegMoeda;

	component comp_moedas is
	port (valor: in  std_logic_vector(9 downto 0);
          comp100,comp50,comp25,comp10,comp5,comp1: out std_logic
	);
	end component comp_moedas;

	component Cod6x3 IS
	PORT(
	A, B, C, D, E, F: IN STD_LOGIC;
	s: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
	END component Cod6x3;

	component Demux_1x6 is
	port(   E : in std_logic;
		s : in std_logic_vector(2 downto 0);
		d: out std_logic_vector(5 downto 0));
	end component Demux_1x6;

	component Contador is 
	port( en_comp:  in std_logic;
	          cnt:  in std_logic;
		clear:  in std_logic;
	        clock:  in std_logic;
	            S: out std_logic_vector(9 downto 0)
	);
	end component Contador;

	component comp_contador is
        port (cont100,cont50,cont25,cont10,cont5,cont1: in  std_logic_vector(9 downto 0);
	      en_comp: in std_logic; 
              comp: out std_logic_vector(5 downto 0)
	);
	end component comp_contador;


signal Botaosincrono,clr_a,clr_b,clr_c,clr_d,clr_e,clr_f,a,b,cc,d,e,f: std_logic;
signal V_reg,sub_valor: std_logic_vector(9 downto 0);
signal moedas100,moedas50,moedas25,moedas10,moedas5,moedas1: std_logic_vector(9 downto 0);
signal decod: std_logic_vector(6 downto 0);
signal cod: std_logic_vector(2 downto 0);
signal de,cnt,comp_qnt: std_logic_vector(5 downto 0);

begin

        botao: BS port map(T,clock,Botaosincrono);
	regvalor: reg_valor port map(clock,Botaosincrono,V,sub_valor,V_reg);
        subtrator: subtrator_de_valor port map(V_reg,decod,sub_load,sub_valor);
	decodificador: decod6x7 port map(a,b,cc,d,e,f,decod);
	reg_moeda1: regmoeda port map(C(5),clr_a,ld_reg,clock,a);
	reg_moeda2: regmoeda port map(C(4),clr_b,ld_reg,clock,b);
	reg_moeda3: regmoeda port map(C(3),clr_c,ld_reg,clock,cc);
	reg_moeda4: regmoeda port map(C(2),clr_d,ld_reg,clock,d);
	reg_moeda5: regmoeda port map(C(1),clr_e,ld_reg,clock,e);
	reg_moeda6: regmoeda port map(C(0),clr_f,ld_reg,clock,f);
        compmoeda: comp_moedas port map(V_reg,clr_a,clr_b,clr_c,clr_d,clr_e,clr_f);

        codificador: cod6x3 port map(a,b,cc,d,e,f,cod);
	demux: demux_1x6 port map('1',cod,de);
	cnt <= de or comp_qnt;
	qntmoedas100: contador port map(en_comp,cnt(0),clear,clock,moedas100);
	qntmoedas50: contador port map(en_comp,cnt(1),clear,clock,moedas50);
	qntmoedas25: contador port map(en_comp,cnt(2),clear,clock,moedas25);
	qntmoedas10: contador port map(en_comp,cnt(3),clear,clock,moedas10);
	qntmoedas5: contador port map(en_comp,cnt(4),clear,clock,moedas5);
	qntmoedas1: contador port map(en_comp,cnt(5),clear,clock,moedas1);
	comp_cnt: comp_contador port map(moedas100,moedas50,moedas25,moedas10,moedas5,moedas1,en_comp,comp_qnt);
	i(0) <= comp_qnt(0) and clock;
	i(1) <= comp_qnt(1) and clock;
	i(2) <= comp_qnt(2) and clock;
	i(3) <= comp_qnt(3) and clock;
	i(4) <= comp_qnt(4) and clock;
	i(5) <= comp_qnt(5) and clock;
        comp <= not(comp_qnt(0) or comp_qnt(1) or comp_qnt(2) or comp_qnt(3) or comp_qnt(4) or comp_qnt(5));
        B_S <= botaosincrono;
        clrf <= clr_f;
        Cx <= C(0) or C(1) or C(2) or C(3) or C(4) or C(5);
        nor_sreg <= not(a or b or cc or d or e or f);

end log;