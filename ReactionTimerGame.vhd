LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ReactionTimerGame is
	port( SW: in STD_logic_VECtor(17 downto 0);
	KEY: in STD_LOGIC_VECTOR(3 downto 0);
	HEX0, HEX1: out STD_LOGIC_VECTOR(6 downto 0);
	ClOCK_50: in std_logic);
	
	
end ReactionTimerGame;



architecture behaviour of ReactionTimerGame is


component DispHEx 
	port (D1 :in unsigned(5 downto 0);
			Y0, Y1: out STD_LOGIC_VECTOR( 6 downto 0));

end component; 


component RandomNumberGenerator
 Port ( clk : in STD_LOGIC;
           btn_change : in STD_LOGIC;
           rand_out : out unsigned(5 downto 0));
    
	 
end component;


component PreScale is 
	port (CLKin: in std_logic;
			CLKout: out std_logic); 
end component; 



signal clk_sig : std_logic;

signal temp: unsigned (5 downto 0);


begin 
 
obj1:  DispHEx 

port map (D1=>temp, Y0=> HEX0, Y1=> HEX1);


obj2:  RandomNumberGenerator

Port map ( clk=> clk_sig, btn_change => KEY(1), rand_out => temp ); 

obj3: PreScale
port map (CLKin => CLOCK_50, CLKout => clk_sig);


end behaviour;