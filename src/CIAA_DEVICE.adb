with LPC43xx.SCU;       use LPC43xx.SCU;
with System;            use System;

package body CIAA_DEVICE is

   procedure CIAA_LEDS_Initialize is
   begin
      SCU_Periph.SFSP2 (0).EPUN := Enable_Pull_Up;
      SCU_Periph.SFSP2 (0).EPD := Disable_Pull_Down;
      SCU_Periph.SFSP2 (0).EZI := Enable_Input_Buffer;
      SCU_Periph.SFSP2 (0).MODE := Function_4;

      SCU_Periph.SFSP2 (1).EPUN := Enable_Pull_Up;
      SCU_Periph.SFSP2 (1).EPD := Disable_Pull_Down;
      SCU_Periph.SFSP2 (1).EZI := Enable_Input_Buffer;
      SCU_Periph.SFSP2 (1).MODE := Function_4;

      SCU_Periph.SFSP2 (2).EPUN := Enable_Pull_Up;
      SCU_Periph.SFSP2 (2).EPD := Disable_Pull_Down;
      SCU_Periph.SFSP2 (2).EZI := Enable_Input_Buffer;
      SCU_Periph.SFSP2 (2).MODE := Function_4;

      GPIO_PORT_Periph.DIR (5) := (As_Array => True,
                        Arr => (0 => True, 1 => True, 2 => True, others => <>));
      GPIO_PORT_Periph.CLR (5) := (As_Array => True,
                        Arr => (0 => True, 1 => True, 2 => True, others => <>));

      --  SFSP2 ranges from 0 to 6 pointing to pins 6 to 12

      SCU_Periph.SFSP2_2 (4).EPUN := Enable_Pull_Up;
      SCU_Periph.SFSP2_2 (4).EPD := Disable_Pull_Down;
      SCU_Periph.SFSP2_2 (4).EZI := Enable_Input_Buffer;
      SCU_Periph.SFSP2_2 (4).MODE := Function_0_Default;

      GPIO_PORT_Periph.DIR (0) := (As_Array => True,
                                             Arr => (14 => True, others => <>));
      GPIO_PORT_Periph.CLR (0) := (As_Array => True,
                                   Arr => (14 => True, others => <>));

      --  SFSP2 ranges from 0 to 6 pointing to pins 6 to 12

      SCU_Periph.SFSP2_2 (5).EPUN := Enable_Pull_Up;
      SCU_Periph.SFSP2_2 (5).EPD := Disable_Pull_Down;
      SCU_Periph.SFSP2_2 (5).EZI := Enable_Input_Buffer;
      SCU_Periph.SFSP2_2 (5).MODE := Function_0_Default;

      SCU_Periph.SFSP2_2 (6).EPUN := Enable_Pull_Up;
      SCU_Periph.SFSP2_2 (6).EPD := Disable_Pull_Down;
      SCU_Periph.SFSP2_2 (6).EZI := Enable_Input_Buffer;
      SCU_Periph.SFSP2_2 (6).MODE := Function_0_Default;

      GPIO_PORT_Periph.DIR (1) := (As_Array => True,
                                 Arr => (11 => True, 12 => True, others => <>));
      GPIO_PORT_Periph.CLR (1) := (As_Array => True,
                                 Arr => (11 => True, 12 => True, others => <>));
   end CIAA_LEDS_Initialize;

   procedure CIAA_USART_Initialize (iUSART : aliased in out pUSART) is
   begin
      if iUSART.peripheral.all'Address = USART2_Base then


         CCU1_Periph.CLK_M4_USART2_CFG.AUTO := Enabled;
         CCU1_Periph.CLK_M4_USART2_CFG.WAKEUP := Enabled;
         CCU1_Periph.CLK_M4_USART2_CFG.RUN := Enabled;

         USART2_Periph.FCR.FIFOEN := Enabled;
         USART2_Periph.FCR.TXFIFORES := Clear;
         USART2_Periph.FCR.RXFIFORES := Clear;

         USART2_Periph.TER.TXEN := False;

         USART2_Periph.IER.RBRIE := Disable;
         USART2_Periph.IER.THREIE := Disable;
         USART2_Periph.IER.RXIE := Disable;
         USART2_Periph.IER.ABEOINTEN := Disable;
         USART2_Periph.IER.ABTOINTEN := Disable;

         USART2_Periph.LCR.WLS := Val_8_Bit_Character_Leng;
         USART2_Periph.LCR.SBS := Val_1_Stop_Bit;
         USART2_Periph.LCR.PE := Disable_Parity_Gener;
         USART2_Periph.LCR.PS := Odd_Parity;
         USART2_Periph.LCR.BC := Disabled;
         USART2_Periph.LCR.DLAB := Disabled;

         USART2_Periph.RS485CTRL.NMMEN := Disabled;
         USART2_Periph.RS485CTRL.RXDIS := Enabled;
         USART2_Periph.RS485CTRL.AADEN := Disabled;
         USART2_Periph.RS485CTRL.DCTRL := Disabled;
         USART2_Periph.RS485CTRL.OINV := Low;

         USART2_Periph.RS485DLY.DLY := 0;
         USART2_Periph.RS485ADRMATCH.ADRMATCH := 0;

         USART2_Periph.ACR.START := Stop;
         USART2_Periph.ACR.MODE := Mode_0;
         USART2_Periph.ACR.AUTORESTART := No_Restart;
         USART2_Periph.ACR.ABEOINTCLR := No_Effect;
         USART2_Periph.ACR.ABTOINTCLR := No_Effect;

         USART2_Periph.FDR.DIVADDVAL := 5;  --  Modified to 5 instead of 0
         USART2_Periph.FDR.MULVAL := 15;  --  Modified to 15 instead of 1

         USART2_Periph.LCR.DLAB := Enabled;
         USART2_Periph.DLL.DLLSB := 83;  --  Modified to 83 from 111
         USART2_Periph.DLM.DLMSB := 0;
         USART2_Periph.LCR.DLAB := Disabled;

         USART2_Periph.FCR.FIFOEN := Enabled;
         USART2_Periph.FCR.RXTRIGLVL := Level_0;

         USART2_Periph.TER.TXEN := True;

         SCU_Periph.SFSP7 (1).EPD := Enable_Pull_Down;
         SCU_Periph.SFSP7 (1).EPUN := Disable_Pull_Up;
         SCU_Periph.SFSP7 (1).MODE := Function_6;

         SCU_Periph.SFSP7 (2).EPD := Disable_Pull_Down;
         SCU_Periph.SFSP7 (2).EPUN := Disable_Pull_Up;
         SCU_Periph.SFSP7 (2).EZI := Enable_Input_Buffer;
         SCU_Periph.SFSP7 (2).ZIF := Disable_Input_Glitch;
         SCU_Periph.SFSP7 (2).MODE := Function_6;

      end if;
   end CIAA_USART_Initialize;

   procedure CIAA_SPI_Initialize is
   begin
      CCU1_Periph.CLK_SPI_CFG.RUN := Enabled;

      SPI_Periph.CR.MSTR := Master;

      SPI_Periph.CR.BITENABLE := The_Spi_Controller_S;
      SPI_Periph.CR.BITS := Val_8_Bits_Per_Transfer;
      SPI_Periph.CR.CPHA := First_Edge;
      SPI_Periph.CR.CPOL := Sck_Is_Active_High;
      SPI_Periph.CR.LSBF := Msb;

      SPI_Periph.CCR.COUNTER := 240; --  Rate of 850k

      --  SCLK
      --      SCU_MODE_INACT
      --      SCU_MODE_HIGHSPEEDSLEW_EN
      --      SCU_MODE_INBUFF_EN
      --      SCU_MODE_ZIF_DIS
      SCU_Periph.SFSP3_3.EPD := Disable_Pull_Down;
      SCU_Periph.SFSP3_3.EPUN := Disable_Pull_Up;
      SCU_Periph.SFSP3_3.EHS := High_Speed_Medium_N;
      SCU_Periph.SFSP3_3.EZI := Enable_Input_Buffer;
      SCU_Periph.SFSP3_3.ZIF := Disable_Input_Filter;
      SCU_Periph.SFSP3_3.MODE := Function_1;

      --  MOSI
      --      SCU_MODE_INACT
      --      SCU_MODE_INBUFF_EN
      --      SCU_MODE_ZIF_DIS
      SCU_Periph.SFSP3_1 (2).EPD := Disable_Pull_Down;
      SCU_Periph.SFSP3_1 (2).EPUN := Disable_Pull_Up;
      SCU_Periph.SFSP3_1 (2).EZI := Enable_Input_Buffer;
      SCU_Periph.SFSP3_1 (2).ZIF := Disable_Input_Glitch;
      SCU_Periph.SFSP3_1 (2).MODE := Function_1;

      --  MISO
      --      SCU_MODE_INACT
      --      SCU_MODE_INBUFF_EN
      --      SCU_MODE_ZIF_DIS
      SCU_Periph.SFSP3_1 (3).EPD := Disable_Pull_Down;
      SCU_Periph.SFSP3_1 (3).EPUN := Disable_Pull_Up;
      SCU_Periph.SFSP3_1 (3).EZI := Enable_Input_Buffer;
      SCU_Periph.SFSP3_1 (3).ZIF := Disable_Input_Glitch;
      SCU_Periph.SFSP3_1 (3).MODE := Function_1;

      --  SSEL
      --      SCU_MODE_INACT
      --      SCU_MODE_INBUFF_EN
      --      SCU_MODE_ZIF_DIS
      SCU_Periph.SFSP3_1 (3).EPD := Disable_Pull_Down;
      SCU_Periph.SFSP3_1 (3).EPUN := Disable_Pull_Up;
      SCU_Periph.SFSP3_1 (3).MODE := Function_1;

   end CIAA_SPI_Initialize;









   procedure CIAA_LEDS_Toggle (LED : LED_pin) is
      LEDs : NOT_NOTP_Field_Array := (others => <>);
   begin
      --  Should be implemented using HAL.GPIO, i.e. GPIO_POINT
      LEDs (LED.PIN) := True;
      GPIO_PORT_Periph.NOT_k (LED.PINGROUP) := (As_Array => True,
                                                Arr => LEDs
                                               );
   end CIAA_LEDS_Toggle;

   procedure CIAA_LEDS_ClearALL is
      LEDs : CLR_CLRP_Field_Array := (others => <>);
   begin
      for item of CIAA_LEDS loop
         LEDs (item.PIN) := True;
         GPIO_PORT_Periph.CLR (item.PINGROUP) := (As_Array => True,
                                                Arr => LEDs
                                               );
      end loop;
   end CIAA_LEDS_ClearALL;

end CIAA_DEVICE;
