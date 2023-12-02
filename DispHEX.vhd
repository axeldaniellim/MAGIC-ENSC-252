LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;

Entity DispHEx is
	port (D1 :in unsigned(5 downto 0);
			Y0, Y1: out STD_LOGIC_VECTOR( 6 downto 0));
			
end DispHEX;

Architecture structure of DispHEX is 

	component SegDecoder is 
		Port ( D : in std_logic_vector( 3 downto 0 );
			Y : out std_logic_vector( 6 downto 0 ));
		end component; 
		
begin
obj1: SegDecoder 
Port map (D =>	Std_logic_vector(D1(3 downto 0)), Y => Y0);

obj2: SegDecoder 
Port map (D => Std_logic_vector("00" & D1(5 downto 4)), Y => Y1);--add zeros before the 2 bits 
end structure; 
