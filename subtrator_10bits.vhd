library ieee;
use ieee.std_logic_1164.all;

entity subtrator_10bits is 
	port( A, B: in std_logic_vector(9 downto 0);
	      O: out std_logic_vector(9 downto 0);
	      Cout: out std_logic);
end subtrator_10bits;

architecture log of subtrator_10bits is

component somador_10bits is
  port( A, B: in std_logic_vector(9 downto 0);
	O: out std_logic_vector(9 downto 0);
	Cout: out std_logic);
end component;

component porta_NOT is
  port (A: in std_logic_vector(9 downto 0);
	O: out std_logic_vector(9 downto 0));
end component;

  signal aux_Cout : std_logic;

  signal complementoB : std_logic_vector(9 downto 0);
  signal notB : std_logic_vector(9 downto 0);
  signal entradaFixa : std_logic_vector(9 downto 0);
 

begin

    entradaFixa <= "0000000001";
    U1: porta_NOT port map(B, notB);
    U2: somador_10bits port map(notB, entradaFixa, complementoB, aux_Cout);

    X1: somador_10bits port map(A, complementoB, O, Cout);

end log;