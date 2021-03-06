library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use IEEE.std_logic_textio.all;                                  -- ADDED

library std;
use std.textio.all;
LIBRARY work;
USE work.fixed_pkg.all;
------------------------------------------
---- N bit counter ------
------------------------------------------
-- Behavior
--------------------------------------
entity Counter is
generic ( N : integer:=18);
port ( 
 --DONE: in std_logic; -- from output module
 clk, rst: in std_logic;
 result: out std_logic_vector(15 downto 0):= (others => '0'); -- output
 Q_out: out std_logic_vector(N-1 downto 0):= (others => '0')
 );
end entity;


architecture rtl of Counter is

signal Q: std_logic_vector(N-1 downto 0):= (others => '0');
signal count: std_logic_vector(4 downto 0):="00000";
signal mid_x, mid_y: std_logic_vector(N/2 -1 downto 0);
signal int_x, int_y: integer;
signal fix_x, fix_y, test: sfixed(3 downto -32);
file outfile             : text open write_mode is "output_file.txt";
COMPONENT Math
	
PORT(
		clk, rst					:IN STD_LOGIC;
		x_const, y_const		:IN sfixed(35 downto 0);
		result					:OUT STD_LOGIC_VECTOR(15 downto 0)
	);
END COMPONENT;

begin
	
	process(clk) is
	BEGIN
		IF (clk'EVENT and clk = '1') THEN
			if (count = "11010") then
			count<="00000";
			else
			count<=count+1;	
			end if;
		end if;
	end process;
	process(count) is
	begin
		 if(count="11010") then -- start switch
		 Q <= Q+1;
		 end if;
	 end process;
	Q_out<=Q;
	mid_x <= Q(N-1 downto N/2);
	mid_y <= Q(N/2 -1 downto 0);
	int_x <= to_integer(unsigned(mid_x));
	int_y <= to_integer(unsigned(mid_y));
	fix_x <= resize(to_sfixed(int_x, 8, -32)*4/2**(N/2) -2, fix_x);
	fix_y <= resize(to_sfixed(int_y, 8, -32)*(-4)/2**(N/2) +2, fix_y);
	--test <= to_sfixed(-2,3,-32);
	stage0: Math PORT MAP(clk=>clk, rst=>rst, x_const=>fix_x, y_const=>fix_y, result=>result);
	--process(int_y) is
--	variable row		:line;
--	begin
--	write(row,int_x);
--	write(row,int_y);
--	hwrite(row, result);
--	writeline(outfile,row);
--	if (int_x = 32 and int_y = 32) then
--	file_close(outfile);
--	end if;
--	end process;
end rtl;