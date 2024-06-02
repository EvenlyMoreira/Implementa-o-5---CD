library ieee;
use ieee.std_logic_1164.all;

entity comp_moedas is
    port (valor: in  std_logic_vector(9 downto 0);
          comp100,comp50,comp25,comp10,comp5,comp1: out std_logic
);
end comp_moedas;

architecture log of comp_moedas is

	component comp_maior is
 	   port (x,y: in  std_logic_vector(9 downto 0);
           maior: out std_logic
	);
	end component comp_maior;

begin

	moeda100: comp_maior port map("0001100100",valor,comp100);
	moeda50: comp_maior port map("0000110010",valor,comp50);
	moeda25: comp_maior port map("0000011001",valor,comp25);
	moeda10: comp_maior port map("0000001010",valor,comp10);
	moeda5: comp_maior port map("0000000101",valor,comp5);
	moeda1: comp_maior port map("0000000001",valor,comp1);

end log;
