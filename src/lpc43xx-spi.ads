--  This spec has been automatically generated from LPC43xx_43Sxx.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package LPC43xx.SPI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_RESERVED_Field is HAL.UInt2;

   --  The SPI controller sends and receives 8 bits of data per transfer.
   type CR_ENUM is
     (
      --  Reset value for the field
      Cr_Enum_Reset,
      --  The SPI controller sends and receives the number of bits selected by
      --  bits 11:8.
      The_Spi_Controller_S)
     with Size => 1;
   for CR_ENUM use
     (Cr_Enum_Reset => 0,
      The_Spi_Controller_S => 1);

   --  Clock phase control determines the relationship between the data and the
   --  clock on SPI transfers, and controls when a slave transfer is defined as
   --  starting and ending.
   type CR_ENUM_1 is
     (
      --  Data is sampled on the first clock edge of SCK. A transfer starts and
      --  ends with activation and deactivation of the SSEL signal.
      First_Edge,
      --  Data is sampled on the second clock edge of the SCK. A transfer
      --  starts with the first clock edge, and ends with the last sampling
      --  edge when the SSEL signal is active.
      Second_Edge)
     with Size => 1;
   for CR_ENUM_1 use
     (First_Edge => 0,
      Second_Edge => 1);

   --  Clock polarity control.
   type CR_ENUM_2 is
     (
      --  SCK is active high.
      Sck_Is_Active_High,
      --  SCK is active low.
      Sck_Is_Active_Low)
     with Size => 1;
   for CR_ENUM_2 use
     (Sck_Is_Active_High => 0,
      Sck_Is_Active_Low => 1);

   --  Master mode select.
   type CR_ENUM_3 is
     (
      --  The SPI operates in Slave mode.
      Slave,
      --  The SPI operates in Master mode.
      Master)
     with Size => 1;
   for CR_ENUM_3 use
     (Slave => 0,
      Master => 1);

   --  LSB First controls which direction each byte is shifted when
   --  transferred.
   type CR_ENUM_4 is
     (
      --  SPI data is transferred MSB (bit 7) first.
      Msb,
      --  SPI data is transferred LSB (bit 0) first.
      Lsb)
     with Size => 1;
   for CR_ENUM_4 use
     (Msb => 0,
      Lsb => 1);

   --  Serial peripheral interrupt enable.
   type CR_ENUM_5 is
     (
      --  SPI interrupts are inhibited.
      Intblock,
      --  A hardware interrupt is generated each time the SPIF or MODF bits are
      --  activated.
      Hwint)
     with Size => 1;
   for CR_ENUM_5 use
     (Intblock => 0,
      Hwint => 1);

   --  When bit 2 of this register is 1, this field controls the number of bits
   --  per transfer:
   type CR_ENUM_6 is
     (
      --  16 bits per transfer
      Val_16_Bits_Per_Transfer,
      --  8 bits per transfer
      Val_8_Bits_Per_Transfer,
      --  9 bits per transfer
      Val_9_Bits_Per_Transfer,
      --  10 bits per transfer
      Val_10_Bits_Per_Transfer,
      --  11 bits per transfer
      Val_11_Bits_Per_Transfer,
      --  12 bits per transfer
      Val_12_Bits_Per_Transfer,
      --  13 bits per transfer
      Val_13_Bits_Per_Transfer,
      --  14 bits per transfer
      Val_14_Bits_Per_Transfer,
      --  15 bits per transfer
      Val_15_Bits_Per_Transfer)
     with Size => 4;
   for CR_ENUM_6 use
     (Val_16_Bits_Per_Transfer => 0,
      Val_8_Bits_Per_Transfer => 8,
      Val_9_Bits_Per_Transfer => 9,
      Val_10_Bits_Per_Transfer => 10,
      Val_11_Bits_Per_Transfer => 11,
      Val_12_Bits_Per_Transfer => 12,
      Val_13_Bits_Per_Transfer => 13,
      Val_14_Bits_Per_Transfer => 14,
      Val_15_Bits_Per_Transfer => 15);

   subtype CR_RESERVED_Field_1 is HAL.UInt20;

   --  SPI Control Register. This register controls the operation of the SPI.
   type CR_Register is record
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED   : CR_RESERVED_Field := 16#0#;
      --  The SPI controller sends and receives 8 bits of data per transfer.
      BITENABLE  : CR_ENUM := Cr_Enum_Reset;
      --  Clock phase control determines the relationship between the data and
      --  the clock on SPI transfers, and controls when a slave transfer is
      --  defined as starting and ending.
      CPHA       : CR_ENUM_1 := LPC43xx.SPI.First_Edge;
      --  Clock polarity control.
      CPOL       : CR_ENUM_2 := LPC43xx.SPI.Sck_Is_Active_High;
      --  Master mode select.
      MSTR       : CR_ENUM_3 := LPC43xx.SPI.Slave;
      --  LSB First controls which direction each byte is shifted when
      --  transferred.
      LSBF       : CR_ENUM_4 := LPC43xx.SPI.Msb;
      --  Serial peripheral interrupt enable.
      SPIE       : CR_ENUM_5 := LPC43xx.SPI.Intblock;
      --  When bit 2 of this register is 1, this field controls the number of
      --  bits per transfer:
      BITS       : CR_ENUM_6 := LPC43xx.SPI.Val_16_Bits_Per_Transfer;
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED_1 : CR_RESERVED_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      RESERVED   at 0 range 0 .. 1;
      BITENABLE  at 0 range 2 .. 2;
      CPHA       at 0 range 3 .. 3;
      CPOL       at 0 range 4 .. 4;
      MSTR       at 0 range 5 .. 5;
      LSBF       at 0 range 6 .. 6;
      SPIE       at 0 range 7 .. 7;
      BITS       at 0 range 8 .. 11;
      RESERVED_1 at 0 range 12 .. 31;
   end record;

   subtype SR_RESERVED_Field is HAL.UInt3;
   subtype SR_RESERVED_Field_1 is HAL.UInt24;

   --  SPI Status Register. This register shows the status of the SPI.
   type SR_Register is record
      --  Read-only. Reserved, user software should not write ones to reserved
      --  bits. The value read from a reserved bit is not defined.
      RESERVED   : SR_RESERVED_Field;
      --  Read-only. Slave abort. When 1, this bit indicates that a slave abort
      --  has occurred. This bit is cleared by reading this register.
      ABRT       : Boolean;
      --  Read-only. Mode fault. when 1, this bit indicates that a Mode fault
      --  error has occurred. This bit is cleared by reading this register,
      --  then writing the SPI0 control register.
      MODF       : Boolean;
      --  Read-only. Read overrun. When 1, this bit indicates that a read
      --  overrun has occurred. This bit is cleared by reading this register.
      ROVR       : Boolean;
      --  Read-only. Write collision. When 1, this bit indicates that a write
      --  collision has occurred. This bit is cleared by reading this register,
      --  then accessing the SPI Data Register.
      WCOL       : Boolean;
      --  Read-only. SPI transfer complete flag. When 1, this bit indicates
      --  when a SPI data transfer is complete. When a master, this bit is set
      --  at the end of the last cycle of the transfer. When a slave, this bit
      --  is set on the last data sampling edge of the SCK. This bit is cleared
      --  by first reading this register, then accessing the SPI Data Register.
      --  Note: this is not the SPI interrupt flag. This flag is found in the
      --  SPINT register.
      SPIF       : Boolean;
      --  Read-only. Reserved, user software should not write ones to reserved
      --  bits. The value read from a reserved bit is not defined.
      RESERVED_1 : SR_RESERVED_Field_1;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      RESERVED   at 0 range 0 .. 2;
      ABRT       at 0 range 3 .. 3;
      MODF       at 0 range 4 .. 4;
      ROVR       at 0 range 5 .. 5;
      WCOL       at 0 range 6 .. 6;
      SPIF       at 0 range 7 .. 7;
      RESERVED_1 at 0 range 8 .. 31;
   end record;

   subtype DR_DATALOW_Field is HAL.UInt8;
   subtype DR_DATAHIGH_Field is HAL.UInt8;
   subtype DR_RESERVED_Field is HAL.UInt16;

   --  SPI Data Register. This bi-directional register provides the transmit
   --  and receive data for the SPI. Transmit data is provided to the SPI0 by
   --  writing to this register. Data received by the SPI0 can be read from
   --  this register.
   type DR_Register is record
      --  *** This field is modified following a read operation ***. SPI
      --  Bi-directional data port.
      DATALOW  : DR_DATALOW_Field := 16#0#;
      --  *** This field is modified following a read operation ***. If bit 2
      --  of the SPCR is 1 and bits 11:8 are other than 1000, some or all of
      --  these bits contain the additional transmit and receive bits. When
      --  less than 16 bits are selected, the more significant among these bits
      --  read as zeroes.
      DATAHIGH : DR_DATAHIGH_Field := 16#0#;
      --  *** This field is modified following a read operation ***. Reserved,
      --  user software should not write ones to reserved bits. The value read
      --  from a reserved bit is not defined.
      RESERVED : DR_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR_Register use record
      DATALOW  at 0 range 0 .. 7;
      DATAHIGH at 0 range 8 .. 15;
      RESERVED at 0 range 16 .. 31;
   end record;

   subtype CCR_COUNTER_Field is HAL.UInt8;
   subtype CCR_RESERVED_Field is HAL.UInt24;

   --  SPI Clock Counter Register. This register controls the frequency of a
   --  master's SCK0.
   type CCR_Register is record
      --  SPI0 Clock counter setting.
      COUNTER  : CCR_COUNTER_Field := 16#0#;
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED : CCR_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR_Register use record
      COUNTER  at 0 range 0 .. 7;
      RESERVED at 0 range 8 .. 31;
   end record;

   subtype TCR_TEST_Field is HAL.UInt7;
   subtype TCR_RESERVED_Field is HAL.UInt24;

   --  SPI Test Control register. For functional testing only.
   type TCR_Register is record
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED   : Boolean := False;
      --  SPI test mode. When 0, the SPI operates normally. When 1, SCK will
      --  always be on, independent of master mode select and data availability
      --  setting.
      TEST       : TCR_TEST_Field := 16#0#;
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED_1 : TCR_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TCR_Register use record
      RESERVED   at 0 range 0 .. 0;
      TEST       at 0 range 1 .. 7;
      RESERVED_1 at 0 range 8 .. 31;
   end record;

   subtype TSR_RESERVED_Field is HAL.UInt3;
   subtype TSR_RESERVED_Field_1 is HAL.UInt24;

   --  SPI Test Status register. For functional testing only.
   type TSR_Register is record
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED   : TSR_RESERVED_Field := 16#0#;
      --  Slave abort.
      ABRT       : Boolean := False;
      --  Mode fault.
      MODF       : Boolean := False;
      --  Read overrun.
      ROVR       : Boolean := False;
      --  Write collision.
      WCOL       : Boolean := False;
      --  SPI transfer complete flag.
      SPIF       : Boolean := False;
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED_1 : TSR_RESERVED_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSR_Register use record
      RESERVED   at 0 range 0 .. 2;
      ABRT       at 0 range 3 .. 3;
      MODF       at 0 range 4 .. 4;
      ROVR       at 0 range 5 .. 5;
      WCOL       at 0 range 6 .. 6;
      SPIF       at 0 range 7 .. 7;
      RESERVED_1 at 0 range 8 .. 31;
   end record;

   subtype INT_RESERVED_Field is HAL.UInt7;
   subtype INT_RESERVED_Field_1 is HAL.UInt24;

   --  SPI Interrupt Flag. This register contains the interrupt flag for the
   --  SPI interface.
   type INT_Register is record
      --  SPI interrupt flag. Set by the SPI interface to generate an
      --  interrupt. Cleared by writing a 1 to this bit. Note: this bit will be
      --  set once when SPIE = 1 and at least one of SPIF and WCOL bits is 1.
      --  However, only when the SPI Interrupt bit is set and SPI0 Interrupt is
      --  enabled in the NVIC, SPI based interrupt can be processed by
      --  interrupt handling software.
      SPIF       : Boolean := False;
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED   : INT_RESERVED_Field := 16#0#;
      --  Reserved, user software should not write ones to reserved bits. The
      --  value read from a reserved bit is not defined.
      RESERVED_1 : INT_RESERVED_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for INT_Register use record
      SPIF       at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 7;
      RESERVED_1 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  SPI
   type SPI_Peripheral is record
      --  SPI Control Register. This register controls the operation of the
      --  SPI.
      CR  : aliased CR_Register;
      --  SPI Status Register. This register shows the status of the SPI.
      SR  : aliased SR_Register;
      --  SPI Data Register. This bi-directional register provides the transmit
      --  and receive data for the SPI. Transmit data is provided to the SPI0
      --  by writing to this register. Data received by the SPI0 can be read
      --  from this register.
      DR  : aliased DR_Register;
      --  SPI Clock Counter Register. This register controls the frequency of a
      --  master's SCK0.
      CCR : aliased CCR_Register;
      --  SPI Test Control register. For functional testing only.
      TCR : aliased TCR_Register;
      --  SPI Test Status register. For functional testing only.
      TSR : aliased TSR_Register;
      --  SPI Interrupt Flag. This register contains the interrupt flag for the
      --  SPI interface.
      INT : aliased INT_Register;
   end record
     with Volatile;

   for SPI_Peripheral use record
      CR  at 16#0# range 0 .. 31;
      SR  at 16#4# range 0 .. 31;
      DR  at 16#8# range 0 .. 31;
      CCR at 16#C# range 0 .. 31;
      TCR at 16#10# range 0 .. 31;
      TSR at 16#14# range 0 .. 31;
      INT at 16#1C# range 0 .. 31;
   end record;

   --  SPI
   SPI_Periph : aliased SPI_Peripheral
     with Import, Address => System'To_Address (16#40100000#);

end LPC43xx.SPI;
