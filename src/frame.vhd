
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use IEEE.std_logic_textio.all;                                  -- ADDED

library std;
use std.textio.all;
LIBRARY work;
USE work.fixed_pkg.all;

entity Frame is
 generic ( N : integer:=18);
port ( 
 clk, rst: in std_logic
 );
end entity;


architecture behavior of frame is


component Printer is
port ( 
 --DONE: in std_logic; -- from output module
 result: in std_logic_vector(15 downto 0):= (others => '0'); -- output
 Q_out: in std_logic_vector(N-1 downto 0):= (others => '0')
 );
end component;



Component Counter is
port ( 
 --DONE: in std_logic; -- from output module
 clk, rst: in std_logic;
 result: out std_logic_vector(15 downto 0):= (others => '0'); -- output
 Q_out: out std_logic_vector(N-1 downto 0):= (others => '0')
 );
end component;

signal Qwire	:std_logic_vector(N-1 downto 0):= (others => '0');
signal Resultwire	:std_logic_vector(15 downto 0):= (others => '0');


begin

countermap: Counter PORT MAP(clk=>clk, rst=>rst, result=>Resultwire, Q_out=>Qwire);
printermap: Printer PORT MAP(result=>Resultwire, Q_out=>Qwire);

end Behavior;
