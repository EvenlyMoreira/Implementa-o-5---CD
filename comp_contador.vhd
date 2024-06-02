library ieee;
use ieee.std_logic_1164.all;

entity comp_contador is
    port (cont100,cont50,cont25,cont10,cont5,cont1: in  std_logic_vector(9 downto 0);
	  en_comp: in std_logic; 
          comp: out std_logic_vector(5 downto 0)
);
end comp_contador;

architecture log of comp_contador is

	component comp_maior is
 	   port (x,y: in  std_logic_vector(9 downto 0);
           maior: out std_logic
	);
	end component comp_maior;

signal encomp,comp1: std_logic_vector(5 downto 0);

begin
	encomp <= (en_comp,en_comp,en_comp,en_comp,en_comp,en_comp);
	moeda100: comp_maior port map(cont100,"0000000000",comp1(0));
	moeda50: comp_maior port map(cont50,"0000000000",comp1(1));
	moeda25: comp_maior port map(cont25,"0000000000",comp1(2));
	moeda10: comp_maior port map(cont10,"0000000000",comp1(3));
	moeda5: comp_maior port map(cont5,"0000000000",comp1(4));
	moeda1: comp_maior port map(cont1,"0000000000",comp1(5));

        comp <= encomp and comp1;

end log;
