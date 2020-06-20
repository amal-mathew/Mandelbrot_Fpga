library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all ;
entity test is
port(
op: out std_logic_vector(7 downto 0));
end entity;

architecture rtl of test is
begin 
process is
type y is range -1000.00 to 1000.00;
type x is range -1000.00 to 1000.00;

begin
y:=x*x;
op<=y;
wait;

end process;
end rtl;