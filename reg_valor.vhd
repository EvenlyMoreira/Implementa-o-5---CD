library ieee;
use ieee.std_logic_1164.all;

entity Reg_valor is
    Port (
        clock,load: in std_logic;
        valor,subtracao : in std_logic_vector(9 downto 0);
        valor_reg: out std_logic_vector(9 downto 0)
    );
end Reg_valor;

architecture log of Reg_valor is
	component ffd is
   	port (ck, clr, set, d : in  std_logic;
                       q : out std_logic
	);
	end component ffd;

	component Mux_2x1 is
	port(   E0, E1 : in std_logic_vector(9 downto 0);
		sel :  in std_logic;
		S : out std_logic_vector(9 downto 0)
	);
	end component Mux_2x1;

signal D: std_logic_vector(9 downto 0);

begin

    MUX: Mux_2x1 port map(subtracao,valor,load,D);
    FF_0: ffd port map (Clock,'1','1', D(0), valor_reg(0));

    FF_1: ffd port map (Clock,'1','1', D(1), valor_reg(1));

    FF_2: ffd port map (Clock,'1','1', D(2), valor_reg(2));

    FF_3: ffd port map (Clock,'1','1', D(3), valor_reg(3));

    FF_4: ffd port map (Clock,'1','1', D(4), valor_reg(4));

    FF_5: ffd port map (Clock,'1','1', D(5), valor_reg(5));

    FF_6: ffd port map (Clock,'1','1', D(6), valor_reg(6));

    FF_7: ffd port map (Clock,'1','1', D(7), valor_reg(7));

    FF_8: ffd port map (Clock,'1','1', D(8), valor_reg(8));

    FF_9: ffd port map (Clock,'1','1', D(9), valor_reg(9));

end log;
