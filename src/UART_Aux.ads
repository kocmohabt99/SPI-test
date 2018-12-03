with HAL;            use HAL;

with LPC43xx.CGU;           use LPC43xx.CGU;
with LPC43xx.CREG;          use LPC43xx.CREG;

package UART_Aux is

   --  required to create FEBA
   type UInt4_Array is array (Natural range <>) of UInt4
     with Component_Size => 4;

   --  required to create FEBA
   type UInt2_Array is array (Natural range <>) of UInt2
     with Component_Size => 2;

   --  Float or Extended Bit Array type used to reasseble bloat bytes
   type feba_option is (as_float, as_1, as_2, as_byte);

   type FEBA (as_option : feba_option := as_byte)
   is record
      case as_option is
         when as_float =>
            floatval  : Float := 0.0;
         when as_1 =>
            A1  : BASE_SPI_CLK_Register;
         when as_2 =>
            A2  : CREG6_Register;
         when as_byte =>
            byteval   : UInt8_Array (0 .. 3) := (0, 0, 0, 0);
      end case;
   end record with Unchecked_Union;

   for FEBA use record
      floatval  at 0 range 0 .. 31;
      A1        at 0 range 0 .. 31;
      A2        at 0 range 0 .. 31;
      byteval   at 0 range 0 .. 31;
   end record;

end UART_Aux;
