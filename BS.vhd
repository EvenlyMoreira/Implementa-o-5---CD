LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY BS IS 
  PORT(
    BS_in, ck: IN STD_LOGIC;
    BS_out: OUT STD_LOGIC
  );
END ENTITY BS;

ARCHITECTURE log OF BS IS
  COMPONENT ffd IS
   	PORT (ck, clr, set, d : IN  std_logic;
                       q : OUT std_logic
	);
	end component ffd;

  SIGNAL S1, S0: STD_LOGIC;
  SIGNAL N1, N0: STD_LOGIC;
  SIGNAL AND1, AND2: STD_LOGIC;
  
BEGIN
  ffd1: ffd port map (ck, '1', '1', N0, S0);
  ffd2: ffd port map (ck, '1', '1', N1, S1);
      
  BS_out <= (NOT S1) AND S0;
  AND1 <= BS_in AND (NOT S1) AND S0;
  AND2 <= BS_in AND (NOT S0) AND S1;
  N1 <= AND1 OR AND2;
  N0 <= BS_in AND (NOT S1) AND (NOT S0);
  
END ARCHITECTURE log;

  
  
