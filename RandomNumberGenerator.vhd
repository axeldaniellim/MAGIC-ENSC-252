--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--
--entity RandomNumberGenerator is
--    Port ( clk : in STD_LOGIC;
--           rst : in STD_LOGIC;
--           rand_out : out unsigned(5 downto 0));
--end RandomNumberGenerator;
--
--architecture Behavioral of RandomNumberGenerator is
--    signal lfsr_reg : unsigned(5 downto 0) := "001000";
--begin
--    process(clk, rst)
--    begin
--        if rst = '1' then
--            lfsr_reg <= "000000";
--        elsif rising_edge(clk) then
--            lfsr_reg(0) <= lfsr_reg(0) XOR lfsr_reg(1);
--            lfsr_reg(1) <= lfsr_reg(1) XOR lfsr_reg(2);
--            lfsr_reg(2) <= lfsr_reg(2) XOR lfsr_reg(3);
--            lfsr_reg(3) <= lfsr_reg(3) XOR lfsr_reg(4);
--            lfsr_reg(4) <= lfsr_reg(4) XOR lfsr_reg(5);
--            lfsr_reg(5) <= lfsr_reg(0);
--        end if;
--    end process;
--
--    rand_out <= lfsr_reg(5 downto 0);
--end Behavioral;



--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--
--entity RandomNumberGenerator is
--    Port ( clk : in STD_LOGIC;
--           rst : in STD_LOGIC;
--           rand_out : out STD_LOGIC_VECTOR(5 downto 0));
--end RandomNumberGenerator;
--
--architecture Behavioral of RandomNumberGenerator is
--    signal lfsr_reg : STD_LOGIC_VECTOR(5 downto 0) := "000001";
--begin
--    process(clk, rst)
--    variable feedback : STD_LOGIC;
--    begin
--        if rst = '1' then
--            lfsr_reg <= "000001";
--        elsif rising_edge(clk) then
--            feedback := lfsr_reg(0) XOR lfsr_reg(5);
--            lfsr_reg(0) <= lfsr_reg(1);
--            lfsr_reg(1) <= lfsr_reg(2);
--            lfsr_reg(2) <= lfsr_reg(3);
--            lfsr_reg(3) <= lfsr_reg(4);
--            lfsr_reg(4) <= lfsr_reg(5);
--            lfsr_reg(5) <= feedback;
--        end if;
--    end process;
--
--    rand_out <= lfsr_reg;
--end Behavioral;




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RandomNumberGenerator is
    Port ( clk : in STD_LOGIC;
           btn_change : in STD_LOGIC;  -- Assuming a button to trigger a change
           rand_out : out STD_LOGIC_VECTOR(5 downto 0)
    );
end RandomNumberGenerator;

architecture Behavioral of RandomNumberGenerator is
    signal lfsr_reg : STD_LOGIC_VECTOR(5 downto 0) := "100100";  -- Initial seed value
    signal change_request : BOOLEAN := FALSE;

    function lfsr_shift_internal(lfsr : STD_LOGIC_VECTOR(5 downto 0)) return STD_LOGIC_VECTOR is
        variable new_bit : STD_LOGIC;
    begin
        new_bit := lfsr(0) xor lfsr(1) xor lfsr(2) xor lfsr(5);
        return new_bit & lfsr(5 downto 1);
    end function;

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if btn_change = '0' then
                change_request <= TRUE;
            end if;

            if change_request = TRUE then
                lfsr_reg <= lfsr_shift_internal(lfsr_reg);
                change_request <= FALSE;
            end if;
        end if;
    end process;

    rand_out <= lfsr_reg;

end Behavioral;
