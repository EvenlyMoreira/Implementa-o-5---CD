LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Decod6x7 IS 
  PORT(
    A, B, C, D, E, F: IN STD_LOGIC;
    x: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
  );
END ENTITY Decod6x7;

ARCHITECTURE log OF Decod6x7 IS
BEGIN 
x(6) <= A;
x(5) <= B OR A;
x(4) <= ((NOT A)AND C) OR ((NOT A) AND B);
x(3) <= ((NOT A) AND (NOT B) AND D) OR ((NOT A) AND (NOT B) AND C);
x(2) <= ((NOT B) AND (NOT C) AND (NOT D) AND E) OR A;
x(1) <= ((NOT A) AND (NOT C) AND D) OR ((NOT A) AND B);
x(0) <= ((NOT A) AND (NOT B) AND (NOT D) AND F) OR ((NOT A) AND (NOT B) AND (NOT D) AND E) OR ((NOT A) AND (NOT B) AND C);
END ARCHITECTURE log;