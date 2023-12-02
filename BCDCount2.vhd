LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;


Entity BCDCount2 is 

port (clear, enable, clk: in std_logic ;
		BCD0: out std_logic_vector(3 downto 0); 
		BCD1: out std_logic_vector(3 downto 0)); 
		
end BCDCount2; 

Architecture behaviour of BCDCount2 is 

component Count4 is 

port (load, enable, clk: in std_logic ;
		D: in std_logic_vector(3 downto 0); 
		Q: out std_logic_vector(3 downto 0)); 
		
end component; 
signal and_sig, or_sig: std_logic_vector (1 downto 0); 
signal Qsig1, Qsig2: std_logic_vector (3 downto 0); 

begin

obj1: Count4
port map (clk=>clk, load=> or_sig(0), enable => enable, D => "0000", Q => Qsig1);


obj2: Count4
port map (clk=>clk, load => or_sig(1), enable => and_sig(0), D => "0000", Q => Qsig2);

or_sig(0) <= and_sig(0) or clear;
or_sig(1) <= and_sig(1) or clear;
and_sig(0) <= Qsig1(0) and Qsig1(3);
and_sig(1) <= Qsig2(0) and Qsig2(3) and and_sig(0);
BCD0 <= Qsig1;
BCD1 <= Qsig2;

end behaviour;



 