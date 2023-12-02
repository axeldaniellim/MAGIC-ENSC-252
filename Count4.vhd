LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;


Entity Count4 is 

port (load, enable, clk: in std_logic ;
		D: in std_logic_vector(3 downto 0); 
		Q: out std_logic_vector(3 downto 0)); 
		
end Count4; 

Architecture behaviour of Count4 is

signal xor_out, inQ: std_logic_vector(3 downto 0 ) ; 
signal and_out: std_logic_vector (4 downto 0);
begin	 
	 and_out(0) <= enable and inQ(0); 
	 xor_out(0) <= inQ(0) xor enable; 

-- xor & and
	 
gg : for z in  1 to 3 generate
	 and_out(z)<= and_out(z-1)  and inQ(z);
	 xor_out(z) <= inQ(z) xor and_out(z-1); 
end generate gg; 

-- mux & flip-flop

ff : for i in 0 to 3 generate
process (clk)
begin 
	if (rising_edge(clk)) then 
		if (load ='1') then
			inQ(i)<= D(i); 
			else 
			inQ(i) <= xor_out(i);
		end if;
	end if;
end process;
end generate ff;
Q <= inQ;

end behaviour; 