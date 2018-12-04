with LPC43xx.GPIO_PORT; use LPC43xx.GPIO_PORT;
with LPC43xx.USART;     use LPC43xx.USART;
with LPC43xx.CCU1;      use LPC43xx.CCU1;
with LPC43xx.CGU;       use LPC43xx.CGU;
with LPC43xx.SPI;       use LPC43xx.SPI;
with LPC43xx;           use LPC43xx;

with uart_lpc43xx;          use uart_lpc43xx;

package CIAA_DEVICE is

   Internal_USART2 : aliased Internal_USART
     with Import, Volatile, Address => USART2_Base;

   USART_2 : aliased pUSART (Internal_USART2'Access);

   type LED_pin is record
      PINGROUP       : Natural range 0 .. 15;
      PIN            : Natural range 0 .. 31;
   end record;

   RBGR_LED : LED_pin := (PINGROUP => 5, PIN => 0);
   RBGG_LED : LED_pin := (PINGROUP => 5, PIN => 1);
   RBGB_LED : LED_pin := (PINGROUP => 5, PIN => 2);
   LED1_LED : LED_pin := (PINGROUP => 0, PIN => 14);
   LED2_LED : LED_pin := (PINGROUP => 1, PIN => 11);
   LED3_LED : LED_pin := (PINGROUP => 1, PIN => 12);

   CIAA_LEDS : array (0 .. 5) of LED_pin := (
                                             RBGR_LED,
                                             RBGG_LED,
                                             RBGB_LED,
                                             LED1_LED,
                                             LED2_LED,
                                             LED3_LED
                                            );

   procedure CIAA_LEDS_Initialize;

   procedure CIAA_USART_Initialize (iUSART : aliased in out pUSART);

   procedure CIAA_SPI_Initialize;

   procedure CIAA_LEDS_Toggle (LED : LED_pin);

   procedure CIAA_LEDS_ClearALL;

end CIAA_DEVICE;
