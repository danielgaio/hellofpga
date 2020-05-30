library ieee;   
  use ieee.std_logic_1164.all;   
  entity pisca_led is   
  port   
  (   
    sys_clk_50mhz : in std_logic;   
    sys_rst : in std_logic;   
    led : out std_logic   
  );   
  end entity pisca_led;   
  architecture rtl of pisca_led is   
  signal led_delay : NATURAL range 0 to 50000000;   
  signal led_reg : std_logic;   
  begin   
  led <= led_reg; -- Atribui a porta de saída chamada led o valor do registrador
  process(sys_clk_50mhz, sys_rst) -- Executado a cada pulso de clock ou reset   
  begin   
    if sys_rst = '0' then -- Reset assíncrono, independe do clock  
       led_delay <= 0;   
       led_reg <= '0';   
    elsif rising_edge(sys_clk_50mhz) then   
       led_delay <= led_delay + 1;   
       if led_delay = 50000000 then   
         led_delay <= 0;   
         led_reg <= not led_reg; -- Inverte o valor do registrador do led  
       end if;   
    end if;   
  end process;   
  end architecture rtl;