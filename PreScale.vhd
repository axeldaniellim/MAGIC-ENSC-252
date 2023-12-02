--LIBRARY ieee;
--USE ieee.numeric_std.all; 
--USE ieee.std_logic_1164.all;
--
--entity PreScale is 
--generic (dw : integer := 25);
--
--	port (inCLOCK: in std_logic;
--			outCLOCK: out std_logic); 
--end Prescale; 
--
--
--Architecture behaviour of PreScale is 
--
--signal temp: unsigned (dw-1 downto 0):= (others=> '0'); 
--
--Begin 
--process (inCLOCK)
--
--	BEGIN
--		if (rising_edge(inCLOCK)) THEN
--			temp <= temp+1;
--
--		end if;
--	END PROCESS;
--outCLOCK <= temp(dw-1);
--end behaviour; 



LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;

entity PreScale is 
	port (CLKin: in std_logic;
			CLKout: out std_logic); 
end Prescale; 


Architecture behaviour of PreScale is 

signal temp: unsigned (19 downto 0):= (others=> '0'); 

Begin 
process (CLKin)

	BEGIN
		if (rising_edge(CLKin)) THEN
			temp <= temp+1;

		end if;
	END PROCESS;
CLKout <= temp(19);
end behaviour; 