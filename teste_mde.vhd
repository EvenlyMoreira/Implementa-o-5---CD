library ieee;
use ieee.std_logic_1164.all;

entity teste_mde is
   port (ck, rst : in  std_logic;
	 BS, Cx, Clr_f, Nor_sreg, comp : in std_logic;
         clear, ld_reg, sub_load, en_comp, L : out std_logic;
	 s : out std_logic_vector(1 downto 0)
	 );
end teste_mde;

architecture log of teste_mde is

  type st is (Inicio, Check, Calcular, Liberar);  
  signal estado : st; 
                         
begin

  process (ck, rst)
  begin
    if rst = '1' then                 
      estado <= Inicio;
      clear <= '1';
      ld_reg <= '0';
      sub_load <= '0';
      en_comp <= '0';
      L <= '1';                   
    elsif (ck'event and ck ='1') then    
      case estado is

        when Inicio =>                         
          if Bs = '1' then estado <= Check;
             clear <= '0';
             ld_reg <= '1';
             sub_load <= '0';
             en_comp <= '0';
             L <= '0'; 
          end if;

        when Check =>                         
          if Cx = '1' then estado <= Calcular;
             clear <= '0';
             ld_reg <= '0';
             sub_load <= '1';
             en_comp <= '0';
             L <= '1'; 
          else             estado <= Inicio;
             clear <= '1';
             ld_reg <= '0';
             sub_load <= '0';
             en_comp <= '0';
             L <= '1';
          end if;

        when Calcular =>                        
          if Clr_f = '1' then estado <= Liberar;
             clear <= '0';
             ld_reg <= '0';
             sub_load <= '0';
             en_comp <= '1';
             L <= '1'; 
          elsif (Clr_f = '0' and Nor_sreg = '0') then estado <= Check;
             clear <= '0';
             ld_reg <= '1';
             sub_load <= '0';
             en_comp <= '0';
             L <= '0'; 
          elsif (Clr_f = '0' and Nor_sreg = '1') then estado <= Inicio;
             clear <= '1';
             ld_reg <= '0';
             sub_load <= '0';
             en_comp <= '0';
             L <= '1';
          end if;

        when Liberar =>                         
          if comp = '1' then estado <= Inicio;
             clear <= '1';
             ld_reg <= '0';
             sub_load <= '0';
             en_comp <= '0';
             L <= '1';
          end if;

       end case;
    end if;
  end process;

  with estado select  
          s <= "00" when Inicio,
               "01" when Check, 
               "10" when Calcular, 
               "11" when Liberar;

end log; 









