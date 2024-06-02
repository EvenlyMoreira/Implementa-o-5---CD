library ieee;
use ieee.std_logic_1164.all;

entity subtrator_de_valor is
	port(   V_reg : in std_logic_vector(9 downto 0);
		decod : in std_logic_vector(6 downto 0);
		sub_load : in std_logic;
		Saida : out std_logic_vector(9 downto 0)
	);
end subtrator_de_valor;

architecture logic of subtrator_de_valor is

component Mux_2x1 is
	port(   E0, E1 : in std_logic_vector(9 downto 0);
		sel :  in std_logic;
		S : out std_logic_vector(9 downto 0));
end component;

component subtrator_10bits is 
	port( A, B: in std_logic_vector(9 downto 0);
	      O: out std_logic_vector(9 downto 0);
	      Cout: out std_logic);
end component;

signal decod_10bits : std_logic_vector(9 downto 0);
signal vetor_zero : std_logic_vector(9 downto 0);
signal aux : std_logic_vector(9 downto 0);

begin

	decod_10bits <= "000" & decod;
	vetor_zero <= "0000000000";

	M1: Mux_2x1 port map(vetor_zero, decod_10bits, sub_load, aux);

	S1: subtrator_10bits port map(V_reg, aux, Saida);

end logic;