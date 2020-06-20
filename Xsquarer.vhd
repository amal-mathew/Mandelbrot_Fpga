library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all ;
------------------------------------------
---- N bit counter ------
------------------------------------------
-- Behavior
--------------------------------------
entity squarer is
generic ( N : integer:=4 );
port ( 
 XCORD: in std_logic_vector(N-1 downto 0);
 XSQ: out std_logic_vector(2*N-1 downto 0);
 YCORD: in std_logic_vector(N-1 downto 0);
 YSQ: out std_logic_vector(2*N-1 downto 0)
 );
end entity;


architecture rtl of squarer is
begin
process(XCORD)
begin
 XSQ<=XCORD*XCORD;
 end process;
 process(YCORD)
begin
 YSQ<=YCORD*YCORD;
 end process;
end rtl;