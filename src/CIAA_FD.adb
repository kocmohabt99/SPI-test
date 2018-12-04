with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with Ada.Real_Time;         use Ada.Real_Time;
with CIAA_DEVICE;           use CIAA_DEVICE;  --  Board Specific functions
with UART_Aux;              use UART_Aux;  --  required for float parsing
with HAL.UART;              use HAL.UART;
with uart_lpc43xx;          use uart_lpc43xx; --  LPC UART drivers


with LPC43xx.CGU;           use LPC43xx.CGU;
with LPC43xx.CREG;          use LPC43xx.CREG;


procedure CIAA_FD is

   Period : constant Time_Span := Milliseconds (1000);  -- arbitrary
   Next_Release : Time := Clock;

   G : FEBA;

   tstring : UART_Data_8b :=
     (10, 72, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100, 33, 10);
   A_status : UART_Status := Ok;


begin
   CIAA_LEDS_Initialize;
   CIAA_USART_Initialize (USART_2);
   CIAA_SPI_Initialize;

   loop
      CIAA_LEDS_Toggle (LED3_LED);

      Next_Release := Next_Release + Period;
      delay until Next_Release;
   end loop;
end CIAA_FD;
