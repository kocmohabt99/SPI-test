--  Finished ResetTXFIFO, ResetRXFIFO
--  Remaining SetStopbits and other functions required to initialize UART



package body uart_lpc43xx is

   --------------
   --  Enable  --
   --------------

   procedure Enable (This : pUSART) is
   begin
      This.peripheral.TER.TXEN := True;
   end Enable;

   ---------------
   --  Disable  --
   ---------------

   procedure Disable (This : pUSART) is
   begin
      This.peripheral.TER.TXEN := False;
   end Disable;

   ---------------
   --  Enabled  --
   ---------------

   function Enabled (This : pUSART) return Boolean is
   begin
      return This.peripheral.TER.TXEN;
   end Enabled;

   --------------
   --   Put    --
   --------------

   procedure Put (This : in out pUSART; Data : UInt8) is
   begin
      This.peripheral.THR.THR := Data;
   end Put;

   -----------
   --  Get  --
   -----------

   function Get (This : pUSART) return UInt8 is
   begin
      return This.peripheral.RBR.RBR;
   end Get;

   --------------------
   -- Transmit Ready --
   --------------------

   function TX_Ready (This : pUSART) return Boolean is
   begin
      return This.peripheral.LSR.THRE = Empty;
   end TX_Ready;

   ---------------------
   --  Receive Ready  --
   ---------------------

   function RX_Ready (This : pUSART) return Boolean is
   begin
      return This.peripheral.LSR.RDR = Data;
   end RX_Ready;


   procedure EnableFIFOS (This : in out pUSART; Enable : Boolean) is
   begin
      if Enable then
         This.peripheral.FCR.FIFOEN := Enabled;
      else
         This.peripheral.FCR.FIFOEN := Disabled;
      end if;
   end EnableFIFOS;

   procedure ResetTXFIFO (This : in out pUSART) is
   begin
      This.peripheral.FCR.TXFIFORES := Clear;
   end ResetTXFIFO;

   procedure ResetRXFIFO (This : in out pUSART) is
   begin
      This.peripheral.FCR.TXFIFORES := Clear;
   end ResetRXFIFO;

   procedure Set_Stop_Bits (This : in out pUSART; SBS : LCR_ENUM_1) is
      pragma Unreferenced (SBS);
   begin
      This.peripheral.SCR.PAD := Character'Pos ('f');
   end Set_Stop_Bits;

   procedure Set_Word_Length (This : in out pUSART; WLS : LCR_ENUM) is
   pragma Unreferenced (WLS);
   begin
      This.peripheral.SCR.PAD := Character'Pos ('f');
   end Set_Word_Length;

   procedure Set_Parity (This : in out pUSART; PS : LCR_ENUM_3) is
   pragma Unreferenced (PS);
   begin
      This.peripheral.SCR.PAD := Character'Pos ('f');
   end Set_Parity;

   procedure Set_Baud_Rate (This : in out pUSART; BRS : Baud_Rate_Presets) is
   pragma Unreferenced (BRS);
   begin
      This.peripheral.SCR.PAD := Character'Pos ('f');
   end Set_Baud_Rate;



   function Status (This : in pUSART) return HAL.UART.UART_Status is
   begin
      This.peripheral.SCR.PAD := Character'Pos ('f');
      return HAL.UART.Err_Error;
   end Status;


   procedure Clear_Status (
                           This : in out pUSART;
                           status_flag : HAL.UART.UART_Status
                          )
   is
   pragma Unreferenced (status_flag);
   begin
      This.peripheral.SCR.PAD := Character'Pos ('f');
   end Clear_Status;

   --  BEGIN OVERRIDES

   ---------------
   -- Data Size --
   ---------------

   overriding
   function Data_Size (This : pUSART) return HAL.UART.UART_Data_Size
   is
      pragma Unreferenced (This);
   begin
      --  LPC only allows for 8 bit data packets or smaller (5,6, and 7)
      return HAL.UART.Data_Size_8b;
   end Data_Size;


   --------------
   -- Transmit --
   --------------

   overriding
   procedure Transmit
     (This    : in out pUSART;
      Data    : HAL.UART.UART_Data_8b;
      Status  : out HAL.UART.UART_Status;
      Timeout : Natural := 1000)
   is
      pragma Unreferenced (Status, Timeout);
   begin
      for item of Data loop
         loop
            exit when This.TX_Ready;
         end loop;

         This.Put (item);
      end loop;
      Status := Ok;
   end Transmit;

   --------------
   -- Transmit --
   --------------

   overriding
   procedure Transmit
     (This    : in out pUSART;
      Data    : HAL.UART.UART_Data_9b;
      Status  : out HAL.UART.UART_Status;
      Timeout : Natural := 1000)
   is
      pragma Unreferenced (Data, Status, Timeout);
   begin
      Status := HAL.UART.Err_Error;
   end Transmit;

   -------------
   -- Receive --
   -------------

   overriding
   procedure Receive
     (This    : in out pUSART;
      Data    : out HAL.UART.UART_Data_8b;
      Status  : out HAL.UART.UART_Status;
      Timeout : Natural := 1000)
   is
      pragma Unreferenced (Status, Timeout);
   begin
      for item of Data loop
         loop
            exit when This.RX_Ready;
         end loop;
         item := This.Get;
      end loop;
      Status := Ok;
   end Receive;

   -------------
   -- Receive --
   -------------

   overriding
   procedure Receive
     (This    : in out pUSART;
      Data    : out HAL.UART.UART_Data_9b;
      Status  : out HAL.UART.UART_Status;
      Timeout : Natural := 1000)
   is
      pragma Unreferenced (Data, Status, Timeout);
   begin
      Status := HAL.UART.Err_Error;

   end Receive;

end uart_lpc43xx;
