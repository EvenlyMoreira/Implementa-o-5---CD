library ieee;
use ieee.std_logic_1164.all;

entity Decrementador is 
	port( A:  in std_logic_vector(9 downto 0);
	      S: out std_logic_vector(9 downto 0)
	);
end Decrementador;

architecture logic of Decrementador is

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

  signal complemento : std_logic_vector(9 downto 0);
  signal B : std_logic_vector(9 downto 0);
  signal notB : std_logic_vector(9 downto 0);
  signal entradaFixa : std_logic_vector(9 downto 0);
  signal Cout : std_logic;

begin

    entradaFixa <= "0000000001";
    B <= "0000000001";
    U1: porta_NOT port map(B, notB);
    U2: somador_10bits port map(notB, entradaFixa, complemento, aux_Cout);

    X1: somador_10bits port map(A, complemento, S, Cout);

end logic;









