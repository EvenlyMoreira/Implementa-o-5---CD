library ieee;
use ieee.std_logic_1164.all;

entity Incrementador is
	port( A:  in std_logic_vector(9 downto 0);
	      S: out std_logic_vector(9 downto 0)
	);
end Incrementador;

architecture logic of Incrementador is

component somador_10bits is
  port( A, B: in std_logic_vector(9 downto 0);
	O: out std_logic_vector(9 downto 0);
	Cout: out std_logic);
end component;

  signal entradaFixa : std_logic_vector(9 downto 0);
  signal Cout : std_logic;

begin

    entradaFixa <= "0000000001";
    I : somador_10bits port map(A, entradaFixa, S, Cout);

end logic;









