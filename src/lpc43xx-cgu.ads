--  This spec has been automatically generated from LPC43xx_43Sxx.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package LPC43xx.CGU is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype FREQ_MON_RCNT_Field is HAL.UInt9;
   subtype FREQ_MON_FCNT_Field is HAL.UInt14;

   --  Measure frequency
   type FREQ_MON_ENUM is
     (
      --  RCNT and FCNT disabled
      Rcnt_And_Fcnt_Disabl,
      --  Frequency counters started
      Frequency_Counters_S)
     with Size => 1;
   for FREQ_MON_ENUM use
     (Rcnt_And_Fcnt_Disabl => 0,
      Frequency_Counters_S => 1);

   --  Clock-source selection for the clock to be measured. All other values
   --  are reserved.
   type FREQ_MON_ENUM_1 is
     (
      --  32 kHz oscillator (default)
      Val_32_Khz_Oscillator_D,
      --  IRC
      Irc,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Reserved
      Reserved,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0USB
      Pll0Usb,
      --  PLL0AUDIO
      Pll0Audio,
      --  PLL1
      Pll1,
      --  Reserved
      Reserved_1,
      --  Reserved
      Reserved_2,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for FREQ_MON_ENUM_1 use
     (Val_32_Khz_Oscillator_D => 0,
      Irc => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Reserved => 5,
      Crystal_Oscillator => 6,
      Pll0Usb => 7,
      Pll0Audio => 8,
      Pll1 => 9,
      Reserved_1 => 10,
      Reserved_2 => 11,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype FREQ_MON_RESERVED_Field is HAL.UInt3;

   --  Frequency monitor register
   type FREQ_MON_Register is record
      --  9-bit reference clock-counter value
      RCNT     : FREQ_MON_RCNT_Field := 16#0#;
      --  14-bit selected clock-counter value
      FCNT     : FREQ_MON_FCNT_Field := 16#0#;
      --  Measure frequency
      MEAS     : FREQ_MON_ENUM := LPC43xx.CGU.Rcnt_And_Fcnt_Disabl;
      --  Clock-source selection for the clock to be measured. All other values
      --  are reserved.
      CLK_SEL  : FREQ_MON_ENUM_1 := LPC43xx.CGU.Val_32_Khz_Oscillator_D;
      --  Reserved
      RESERVED : FREQ_MON_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FREQ_MON_Register use record
      RCNT     at 0 range 0 .. 8;
      FCNT     at 0 range 9 .. 22;
      MEAS     at 0 range 23 .. 23;
      CLK_SEL  at 0 range 24 .. 28;
      RESERVED at 0 range 29 .. 31;
   end record;

   --  Oscillator-pad enable. Do not change the BYPASS and ENABLE bits in one
   --  write-action: this will result in unstable device operation!
   type XTAL_OSC_CTRL_ENUM is
     (
      --  Enable
      Enable,
      --  Power-down (default)
      Power_Down)
     with Size => 1;
   for XTAL_OSC_CTRL_ENUM use
     (Enable => 0,
      Power_Down => 1);

   --  Configure crystal operation or external-clock input pin XTAL1. Do not
   --  change the BYPASS and ENABLE bits in one write-action: this will result
   --  in unstable device operation!
   type XTAL_OSC_CTRL_ENUM_1 is
     (
      --  Crystal. Operation with crystal connected (default).
      Crystal,
      --  Bypass mode. Use this mode when an external clock source is used
      --  instead of a crystal.
      Bypass_Mode)
     with Size => 1;
   for XTAL_OSC_CTRL_ENUM_1 use
     (Crystal => 0,
      Bypass_Mode => 1);

   --  Select frequency range
   type XTAL_OSC_CTRL_ENUM_2 is
     (
      --  Low. Oscillator low-frequency mode (crystal or external clock source
      --  1 to 20 MHz). Between 15 MHz and 20 MHz, the state of the HF bit is
      --  don't care.
      Low,
      --  High. Oscillator high-frequency mode; crystal or external clock
      --  source 15 to 25 MHz. Between 15 MHz and 20 MHz, the state of the HF
      --  bit is don't care.
      High)
     with Size => 1;
   for XTAL_OSC_CTRL_ENUM_2 use
     (Low => 0,
      High => 1);

   subtype XTAL_OSC_CTRL_RESERVED_Field is HAL.UInt29;

   --  Crystal oscillator control register
   type XTAL_OSC_CTRL_Register is record
      --  Oscillator-pad enable. Do not change the BYPASS and ENABLE bits in
      --  one write-action: this will result in unstable device operation!
      ENABLE   : XTAL_OSC_CTRL_ENUM := LPC43xx.CGU.Power_Down;
      --  Configure crystal operation or external-clock input pin XTAL1. Do not
      --  change the BYPASS and ENABLE bits in one write-action: this will
      --  result in unstable device operation!
      BYPASS   : XTAL_OSC_CTRL_ENUM_1 := LPC43xx.CGU.Crystal;
      --  Select frequency range
      HF       : XTAL_OSC_CTRL_ENUM_2 := LPC43xx.CGU.High;
      --  Reserved
      RESERVED : XTAL_OSC_CTRL_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for XTAL_OSC_CTRL_Register use record
      ENABLE   at 0 range 0 .. 0;
      BYPASS   at 0 range 1 .. 1;
      HF       at 0 range 2 .. 2;
      RESERVED at 0 range 3 .. 31;
   end record;

   subtype PLL0USB_STAT_RESERVED_Field is HAL.UInt30;

   --  PLL0USB status register
   type PLL0USB_STAT_Register is record
      --  Read-only. PLL0 lock indicator
      LOCK     : Boolean;
      --  Read-only. PLL0 free running indicator
      FR       : Boolean;
      --  Read-only. Reserved
      RESERVED : PLL0USB_STAT_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL0USB_STAT_Register use record
      LOCK     at 0 range 0 .. 0;
      FR       at 0 range 1 .. 1;
      RESERVED at 0 range 2 .. 31;
   end record;

   --  PLL0 power down
   type PLL0USB_CTRL_ENUM is
     (
      --  PLL0 enabled
      Pll0_Enabled,
      --  PLL0 powered down
      Pll0_Powered_Down)
     with Size => 1;
   for PLL0USB_CTRL_ENUM use
     (Pll0_Enabled => 0,
      Pll0_Powered_Down => 1);

   --  Input clock bypass control
   type PLL0USB_CTRL_ENUM_1 is
     (
      --  CCO clock sent to post-dividers. Use this in normal operation.
      Cco_Clock_Sent_To_Po,
      --  PLL0 input clock sent to post-dividers (default).
      Pll0_Input_Clock_Sen)
     with Size => 1;
   for PLL0USB_CTRL_ENUM_1 use
     (Cco_Clock_Sent_To_Po => 0,
      Pll0_Input_Clock_Sen => 1);

   --  PLL0USB_CTRL_RESERVED array
   type PLL0USB_CTRL_RESERVED_Field_Array is array (1 .. 4) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for PLL0USB_CTRL_RESERVED
   type PLL0USB_CTRL_RESERVED_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  RESERVED as a value
            Val : HAL.UInt4;
         when True =>
            --  RESERVED as an array
            Arr : PLL0USB_CTRL_RESERVED_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for PLL0USB_CTRL_RESERVED_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Block clock automatically during frequency change
   type PLL0USB_CTRL_ENUM_2 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for PLL0USB_CTRL_ENUM_2 use
     (Disabled => 0,
      Enabled => 1);

   subtype PLL0USB_CTRL_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type PLL0USB_CTRL_ENUM_3 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for PLL0USB_CTRL_ENUM_3 use
     (Val_32_Khz_Oscillator => 0,
      Irc => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype PLL0USB_CTRL_RESERVED_Field_2 is HAL.UInt3;

   --  PLL0USB control register
   type PLL0USB_CTRL_Register is record
      --  PLL0 power down
      PD         : PLL0USB_CTRL_ENUM := LPC43xx.CGU.Pll0_Powered_Down;
      --  Input clock bypass control
      BYPASS     : PLL0USB_CTRL_ENUM_1 := LPC43xx.CGU.Pll0_Input_Clock_Sen;
      --  PLL0 direct input
      DIRECTI    : Boolean := False;
      --  PLL0 direct output
      DIRECTO    : Boolean := False;
      --  PLL0 clock enable
      CLKEN      : Boolean := False;
      --  Reserved
      RESERVED   : Boolean := False;
      --  Free running mode
      FRM        : Boolean := False;
      --  Reserved
      RESERVED_1 : PLL0USB_CTRL_RESERVED_Field :=
                    (As_Array => False, Val => 16#0#);
      --  Block clock automatically during frequency change
      AUTOBLOCK  : PLL0USB_CTRL_ENUM_2 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_2 : PLL0USB_CTRL_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : PLL0USB_CTRL_ENUM_3 := LPC43xx.CGU.Irc;
      --  Reserved
      RESERVED_3 : PLL0USB_CTRL_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL0USB_CTRL_Register use record
      PD         at 0 range 0 .. 0;
      BYPASS     at 0 range 1 .. 1;
      DIRECTI    at 0 range 2 .. 2;
      DIRECTO    at 0 range 3 .. 3;
      CLKEN      at 0 range 4 .. 4;
      RESERVED   at 0 range 5 .. 5;
      FRM        at 0 range 6 .. 6;
      RESERVED_1 at 0 range 7 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_2 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_3 at 0 range 29 .. 31;
   end record;

   subtype PLL0USB_MDIV_MDEC_Field is HAL.UInt17;
   subtype PLL0USB_MDIV_SELP_Field is HAL.UInt5;
   subtype PLL0USB_MDIV_SELI_Field is HAL.UInt6;
   subtype PLL0USB_MDIV_SELR_Field is HAL.UInt4;

   --  PLL0USB M-divider register
   type PLL0USB_MDIV_Register is record
      --  Decoded M-divider coefficient value. Select values for the M-divider
      --  between 1 and 131071.
      MDEC : PLL0USB_MDIV_MDEC_Field := 16#5B6A#;
      --  Bandwidth select P value
      SELP : PLL0USB_MDIV_SELP_Field := 16#1C#;
      --  Bandwidth select I value
      SELI : PLL0USB_MDIV_SELI_Field := 16#17#;
      --  Bandwidth select R value; SELR = 0.
      SELR : PLL0USB_MDIV_SELR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL0USB_MDIV_Register use record
      MDEC at 0 range 0 .. 16;
      SELP at 0 range 17 .. 21;
      SELI at 0 range 22 .. 27;
      SELR at 0 range 28 .. 31;
   end record;

   subtype PLL0USB_NP_DIV_PDEC_Field is HAL.UInt7;
   subtype PLL0USB_NP_DIV_RESERVED_Field is HAL.UInt5;
   subtype PLL0USB_NP_DIV_NDEC_Field is HAL.UInt10;
   subtype PLL0USB_NP_DIV_RESERVED_Field_1 is HAL.UInt10;

   --  PLL0USB N/P-divider register
   type PLL0USB_NP_DIV_Register is record
      --  Decoded P-divider coefficient value
      PDEC       : PLL0USB_NP_DIV_PDEC_Field := 16#2#;
      --  Reserved
      RESERVED   : PLL0USB_NP_DIV_RESERVED_Field := 16#0#;
      --  Decoded N-divider coefficient value
      NDEC       : PLL0USB_NP_DIV_NDEC_Field := 16#B1#;
      --  Reserved
      RESERVED_1 : PLL0USB_NP_DIV_RESERVED_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL0USB_NP_DIV_Register use record
      PDEC       at 0 range 0 .. 6;
      RESERVED   at 0 range 7 .. 11;
      NDEC       at 0 range 12 .. 21;
      RESERVED_1 at 0 range 22 .. 31;
   end record;

   subtype PLL0AUDIO_STAT_RESERVED_Field is HAL.UInt30;

   --  PLL0AUDIO status register
   type PLL0AUDIO_STAT_Register is record
      --  Read-only. PLL0 lock indicator
      LOCK     : Boolean;
      --  Read-only. PLL0 free running indicator
      FR       : Boolean;
      --  Read-only. Reserved
      RESERVED : PLL0AUDIO_STAT_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL0AUDIO_STAT_Register use record
      LOCK     at 0 range 0 .. 0;
      FR       at 0 range 1 .. 1;
      RESERVED at 0 range 2 .. 31;
   end record;

   --  PLL0 power down
   type PLL0AUDIO_CTRL_ENUM is
     (
      --  PLL0 enabled
      Pll0_Enabled,
      --  PLL0 powered down
      Pll0_Powered_Down)
     with Size => 1;
   for PLL0AUDIO_CTRL_ENUM use
     (Pll0_Enabled => 0,
      Pll0_Powered_Down => 1);

   --  Input clock bypass control
   type PLL0AUDIO_CTRL_ENUM_1 is
     (
      --  CCO clock sent to post-dividers. Use this in normal operation.
      Cco_Clock_Sent_To_Po,
      --  PLL0 input clock sent to post-dividers (default).
      Pll0_Input_Clock_Sen)
     with Size => 1;
   for PLL0AUDIO_CTRL_ENUM_1 use
     (Cco_Clock_Sent_To_Po => 0,
      Pll0_Input_Clock_Sen => 1);

   --  PLL0AUDIO_CTRL_RESERVED array
   type PLL0AUDIO_CTRL_RESERVED_Field_Array is array (1 .. 4) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for PLL0AUDIO_CTRL_RESERVED
   type PLL0AUDIO_CTRL_RESERVED_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  RESERVED as a value
            Val : HAL.UInt4;
         when True =>
            --  RESERVED as an array
            Arr : PLL0AUDIO_CTRL_RESERVED_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for PLL0AUDIO_CTRL_RESERVED_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Block clock automatically during frequency change
   type PLL0AUDIO_CTRL_ENUM_2 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for PLL0AUDIO_CTRL_ENUM_2 use
     (Disabled => 0,
      Enabled => 1);

   --  Select fractional divider.
   type PLL0AUDIO_CTRL_ENUM_3 is
     (
      --  FRAC Enabled. Enable fractional divider.
      Frac_Enabled,
      --  MDEC enabled. Fractional divider not used.
      Mdec_Enabled)
     with Size => 1;
   for PLL0AUDIO_CTRL_ENUM_3 use
     (Frac_Enabled => 0,
      Mdec_Enabled => 1);

   --  Sigma-Delta modulator power-down
   type PLL0AUDIO_CTRL_ENUM_4 is
     (
      --  Enabled. Sigma-Delta modulator enabled
      Enabled,
      --  Disabled. Sigma-Delta modulator powered down
      Disabled)
     with Size => 1;
   for PLL0AUDIO_CTRL_ENUM_4 use
     (Enabled => 0,
      Disabled => 1);

   subtype PLL0AUDIO_CTRL_RESERVED_Field_1 is HAL.UInt9;

   --  Clock source selection. All other values are reserved.
   type PLL0AUDIO_CTRL_ENUM_5 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for PLL0AUDIO_CTRL_ENUM_5 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype PLL0AUDIO_CTRL_RESERVED_Field_2 is HAL.UInt3;

   --  PLL0AUDIO control register
   type PLL0AUDIO_CTRL_Register is record
      --  PLL0 power down
      PD           : PLL0AUDIO_CTRL_ENUM := LPC43xx.CGU.Pll0_Powered_Down;
      --  Input clock bypass control
      BYPASS       : PLL0AUDIO_CTRL_ENUM_1 :=
                      LPC43xx.CGU.Pll0_Input_Clock_Sen;
      --  PLL0 direct input
      DIRECTI      : Boolean := False;
      --  PLL0 direct output
      DIRECTO      : Boolean := False;
      --  PLL0 clock enable
      CLKEN        : Boolean := False;
      --  Reserved
      RESERVED     : Boolean := False;
      --  Free running mode
      FRM          : Boolean := False;
      --  Reserved
      RESERVED_1   : PLL0AUDIO_CTRL_RESERVED_Field :=
                      (As_Array => False, Val => 16#0#);
      --  Block clock automatically during frequency change
      AUTOBLOCK    : PLL0AUDIO_CTRL_ENUM_2 := LPC43xx.CGU.Disabled;
      --  Fractional PLL word write request. Set this bit to 1 if the
      --  fractional divider is enabled in the SEL_EXT bit.
      PLLFRACT_REQ : Boolean := False;
      --  Select fractional divider.
      SEL_EXT      : PLL0AUDIO_CTRL_ENUM_3 := LPC43xx.CGU.Frac_Enabled;
      --  Sigma-Delta modulator power-down
      MOD_PD       : PLL0AUDIO_CTRL_ENUM_4 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_2   : PLL0AUDIO_CTRL_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL      : PLL0AUDIO_CTRL_ENUM_5 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_3   : PLL0AUDIO_CTRL_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL0AUDIO_CTRL_Register use record
      PD           at 0 range 0 .. 0;
      BYPASS       at 0 range 1 .. 1;
      DIRECTI      at 0 range 2 .. 2;
      DIRECTO      at 0 range 3 .. 3;
      CLKEN        at 0 range 4 .. 4;
      RESERVED     at 0 range 5 .. 5;
      FRM          at 0 range 6 .. 6;
      RESERVED_1   at 0 range 7 .. 10;
      AUTOBLOCK    at 0 range 11 .. 11;
      PLLFRACT_REQ at 0 range 12 .. 12;
      SEL_EXT      at 0 range 13 .. 13;
      MOD_PD       at 0 range 14 .. 14;
      RESERVED_2   at 0 range 15 .. 23;
      CLK_SEL      at 0 range 24 .. 28;
      RESERVED_3   at 0 range 29 .. 31;
   end record;

   subtype PLL0AUDIO_MDIV_MDEC_Field is HAL.UInt17;
   subtype PLL0AUDIO_MDIV_RESERVED_Field is HAL.UInt15;

   --  PLL0AUDIO M-divider register
   type PLL0AUDIO_MDIV_Register is record
      --  Decoded M-divider coefficient value. Select values for the M-divider
      --  between 1 and 131071.
      MDEC     : PLL0AUDIO_MDIV_MDEC_Field := 16#5B6A#;
      --  Reserved
      RESERVED : PLL0AUDIO_MDIV_RESERVED_Field := 16#2FC#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL0AUDIO_MDIV_Register use record
      MDEC     at 0 range 0 .. 16;
      RESERVED at 0 range 17 .. 31;
   end record;

   subtype PLL0AUDIO_NP_DIV_PDEC_Field is HAL.UInt7;
   subtype PLL0AUDIO_NP_DIV_RESERVED_Field is HAL.UInt5;
   subtype PLL0AUDIO_NP_DIV_NDEC_Field is HAL.UInt10;
   subtype PLL0AUDIO_NP_DIV_RESERVED_Field_1 is HAL.UInt10;

   --  PLL0AUDIO N/P-divider register
   type PLL0AUDIO_NP_DIV_Register is record
      --  Decoded P-divider coefficient value
      PDEC       : PLL0AUDIO_NP_DIV_PDEC_Field := 16#2#;
      --  Reserved
      RESERVED   : PLL0AUDIO_NP_DIV_RESERVED_Field := 16#0#;
      --  Decoded N-divider coefficient value
      NDEC       : PLL0AUDIO_NP_DIV_NDEC_Field := 16#B1#;
      --  Reserved
      RESERVED_1 : PLL0AUDIO_NP_DIV_RESERVED_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL0AUDIO_NP_DIV_Register use record
      PDEC       at 0 range 0 .. 6;
      RESERVED   at 0 range 7 .. 11;
      NDEC       at 0 range 12 .. 21;
      RESERVED_1 at 0 range 22 .. 31;
   end record;

   subtype PLL0AUDIO_FRAC_PLLFRACT_CTRL_Field is HAL.UInt22;
   subtype PLL0AUDIO_FRAC_RESERVED_Field is HAL.UInt10;

   --  PLL0AUDIO fractional divider register
   type PLL0AUDIO_FRAC_Register is record
      --  PLL fractional divider control word
      PLLFRACT_CTRL : PLL0AUDIO_FRAC_PLLFRACT_CTRL_Field := 16#200000#;
      --  Reserved
      RESERVED      : PLL0AUDIO_FRAC_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL0AUDIO_FRAC_Register use record
      PLLFRACT_CTRL at 0 range 0 .. 21;
      RESERVED      at 0 range 22 .. 31;
   end record;

   subtype PLL1_STAT_RESERVED_Field is HAL.UInt31;

   --  PLL1 status register
   type PLL1_STAT_Register is record
      --  Read-only. PLL1 lock indicator
      LOCK     : Boolean;
      --  Read-only. Reserved
      RESERVED : PLL1_STAT_RESERVED_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL1_STAT_Register use record
      LOCK     at 0 range 0 .. 0;
      RESERVED at 0 range 1 .. 31;
   end record;

   --  PLL1 power down
   type PLL1_CTRL_ENUM is
     (
      --  PLL1 enabled
      Pll1_Enabled,
      --  PLL1 powered down
      Pll1_Powered_Down)
     with Size => 1;
   for PLL1_CTRL_ENUM use
     (Pll1_Enabled => 0,
      Pll1_Powered_Down => 1);

   --  Input clock bypass control
   type PLL1_CTRL_ENUM_1 is
     (
      --  Normal. CCO clock sent to post-dividers. Use for normal operation.
      Normal,
      --  Input clock. PLL1 input clock sent to post-dividers (default).
      Input_Clock)
     with Size => 1;
   for PLL1_CTRL_ENUM_1 use
     (Normal => 0,
      Input_Clock => 1);

   subtype PLL1_CTRL_RESERVED_Field is HAL.UInt3;

   --  PLL feedback select.
   type PLL1_CTRL_ENUM_2 is
     (
      --  CCO out. CCO output is used as feedback divider input clock.
      Cco_Out,
      --  PLL out. PLL output clock (clkout) is used as feedback divider input
      --  clock. Use for normal operation.
      Pll_Out)
     with Size => 1;
   for PLL1_CTRL_ENUM_2 use
     (Cco_Out => 0,
      Pll_Out => 1);

   --  PLL direct CCO output
   type PLL1_CTRL_ENUM_3 is
     (
      --  Disabled
      Disabled,
      --  Enabled
      Enabled)
     with Size => 1;
   for PLL1_CTRL_ENUM_3 use
     (Disabled => 0,
      Enabled => 1);

   --  Post-divider division ratio P. The value applied is 2xP.
   type PLL1_CTRL_ENUM_4 is
     (
      --  1
      Val_1,
      --  2 (default)
      Peq2,
      --  4
      Peq4,
      --  8
      Val_8)
     with Size => 2;
   for PLL1_CTRL_ENUM_4 use
     (Val_1 => 0,
      Peq2 => 1,
      Peq4 => 2,
      Val_8 => 3);

   --  Pre-divider division ratio N
   type PLL1_CTRL_ENUM_5 is
     (
      --  1
      Val_1,
      --  2
      Neq2,
      --  3 (default)
      Neq3,
      --  4
      Val_4)
     with Size => 2;
   for PLL1_CTRL_ENUM_5 use
     (Val_1 => 0,
      Neq2 => 1,
      Neq3 => 2,
      Val_4 => 3);

   subtype PLL1_CTRL_RESERVED_Field_1 is HAL.UInt2;
   subtype PLL1_CTRL_MSEL_Field is HAL.UInt8;

   --  Clock-source selection.
   type PLL1_CTRL_ENUM_6 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Reserved
      Reserved,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0USB
      Pll0Usb,
      --  PLL0AUDIO
      Pll0Audio,
      --  Reserved
      Reserved_1,
      --  Reserved
      Reserved_2,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for PLL1_CTRL_ENUM_6 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Reserved => 5,
      Crystal_Oscillator => 6,
      Pll0Usb => 7,
      Pll0Audio => 8,
      Reserved_1 => 9,
      Reserved_2 => 10,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   --  PLL1 control register
   type PLL1_CTRL_Register is record
      --  PLL1 power down
      PD         : PLL1_CTRL_ENUM := LPC43xx.CGU.Pll1_Powered_Down;
      --  Input clock bypass control
      BYPASS     : PLL1_CTRL_ENUM_1 := LPC43xx.CGU.Input_Clock;
      --  Reserved. Do not write one to this bit.
      RESERVED   : Boolean := False;
      --  Reserved. Do not write one to these bits.
      RESERVED_1 : PLL1_CTRL_RESERVED_Field := 16#0#;
      --  PLL feedback select.
      FBSEL      : PLL1_CTRL_ENUM_2 := LPC43xx.CGU.Cco_Out;
      --  PLL direct CCO output
      DIRECT     : PLL1_CTRL_ENUM_3 := LPC43xx.CGU.Disabled;
      --  Post-divider division ratio P. The value applied is 2xP.
      PSEL       : PLL1_CTRL_ENUM_4 := LPC43xx.CGU.Val_1;
      --  Reserved
      RESERVED_2 : Boolean := False;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : PLL1_CTRL_ENUM_3 := LPC43xx.CGU.Disabled;
      --  Pre-divider division ratio N
      NSEL       : PLL1_CTRL_ENUM_5 := LPC43xx.CGU.Val_1;
      --  Reserved
      RESERVED_3 : PLL1_CTRL_RESERVED_Field_1 := 16#0#;
      --  Feedback-divider division ratio (M) 00000000 = 1 00000001 = 2 ...
      --  11111111 = 256
      MSEL       : PLL1_CTRL_MSEL_Field := 16#0#;
      --  Clock-source selection.
      CLK_SEL    : PLL1_CTRL_ENUM_6 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_4 : PLL1_CTRL_RESERVED_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL1_CTRL_Register use record
      PD         at 0 range 0 .. 0;
      BYPASS     at 0 range 1 .. 1;
      RESERVED   at 0 range 2 .. 2;
      RESERVED_1 at 0 range 3 .. 5;
      FBSEL      at 0 range 6 .. 6;
      DIRECT     at 0 range 7 .. 7;
      PSEL       at 0 range 8 .. 9;
      RESERVED_2 at 0 range 10 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      NSEL       at 0 range 12 .. 13;
      RESERVED_3 at 0 range 14 .. 15;
      MSEL       at 0 range 16 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_4 at 0 range 29 .. 31;
   end record;

   --  Integer divider A power down
   type IDIVA_CTRL_ENUM is
     (
      --  Enabled. IDIVA enabled (default)
      Enabled,
      --  Power-down
      Power_Down)
     with Size => 1;
   for IDIVA_CTRL_ENUM use
     (Enabled => 0,
      Power_Down => 1);

   --  Integer divider A divider values (1/(IDIV + 1))
   type IDIVA_CTRL_ENUM_1 is
     (
      --  1 (default)
      Div1,
      --  2
      Div2,
      --  3
      Div3,
      --  4
      Div4)
     with Size => 2;
   for IDIVA_CTRL_ENUM_1 use
     (Div1 => 0,
      Div2 => 1,
      Div3 => 2,
      Div4 => 3);

   subtype IDIVA_CTRL_RESERVED_Field is HAL.UInt7;

   --  Block clock automatically during frequency change
   type IDIVA_CTRL_ENUM_2 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for IDIVA_CTRL_ENUM_2 use
     (Disabled => 0,
      Enabled => 1);

   subtype IDIVA_CTRL_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type IDIVA_CTRL_ENUM_3 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0USB
      Pll0Usb,
      --  PLL0AUDIO
      Pll0Audio,
      --  PLL1
      Pll1)
     with Size => 5;
   for IDIVA_CTRL_ENUM_3 use
     (Val_32_Khz_Oscillator => 0,
      Irc => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0Usb => 7,
      Pll0Audio => 8,
      Pll1 => 9);

   subtype IDIVA_CTRL_RESERVED_Field_2 is HAL.UInt3;

   --  Integer divider A control register
   type IDIVA_CTRL_Register is record
      --  Integer divider A power down
      PD         : IDIVA_CTRL_ENUM := LPC43xx.CGU.Enabled;
      --  Reserved
      RESERVED   : Boolean := False;
      --  Integer divider A divider values (1/(IDIV + 1))
      IDIV       : IDIVA_CTRL_ENUM_1 := LPC43xx.CGU.Div1;
      --  Reserved
      RESERVED_1 : IDIVA_CTRL_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : IDIVA_CTRL_ENUM_2 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_2 : IDIVA_CTRL_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : IDIVA_CTRL_ENUM_3 := LPC43xx.CGU.Irc;
      --  Reserved
      RESERVED_3 : IDIVA_CTRL_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IDIVA_CTRL_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 1;
      IDIV       at 0 range 2 .. 3;
      RESERVED_1 at 0 range 4 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_2 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_3 at 0 range 29 .. 31;
   end record;

   --  Integer divider power down
   type IDIVB_CTRL_ENUM is
     (
      --  Enabled. IDIV enabled (default)
      Enabled,
      --  Power-down
      Power_Down)
     with Size => 1;
   for IDIVB_CTRL_ENUM use
     (Enabled => 0,
      Power_Down => 1);

   subtype IDIVB_CTRL_IDIV_Field is HAL.UInt4;
   subtype IDIVB_CTRL_RESERVED_Field is HAL.UInt5;

   --  Block clock automatically during frequency change
   type IDIVB_CTRL_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for IDIVB_CTRL_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype IDIVB_CTRL_RESERVED_Field_1 is HAL.UInt12;

   --  Clock-source selection. All other values are reserved.
   type IDIVB_CTRL_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0AUDIO
      Pll0Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva)
     with Size => 5;
   for IDIVB_CTRL_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0Audio => 8,
      Pll1 => 9,
      Idiva => 12);

   subtype IDIVB_CTRL_RESERVED_Field_2 is HAL.UInt3;

   --  Integer divider B control register
   type IDIVB_CTRL_Register is record
      --  Integer divider power down
      PD         : IDIVB_CTRL_ENUM := LPC43xx.CGU.Enabled;
      --  Reserved
      RESERVED   : Boolean := False;
      --  Integer divider B, C, D divider values (1/(IDIV + 1)) 0000 = 1
      --  (default) 0001 = 2 ... 1111 = 16
      IDIV       : IDIVB_CTRL_IDIV_Field := 16#0#;
      --  Reserved
      RESERVED_1 : IDIVB_CTRL_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : IDIVB_CTRL_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_2 : IDIVB_CTRL_RESERVED_Field_1 := 16#0#;
      --  Clock-source selection. All other values are reserved.
      CLK_SEL    : IDIVB_CTRL_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_3 : IDIVB_CTRL_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IDIVB_CTRL_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 1;
      IDIV       at 0 range 2 .. 5;
      RESERVED_1 at 0 range 6 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_2 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_3 at 0 range 29 .. 31;
   end record;

   --  Integer divider power down
   type IDIVC_CTRL_ENUM is
     (
      --  Enabled. IDIV enabled (default)
      Enabled,
      --  Power-down
      Power_Down)
     with Size => 1;
   for IDIVC_CTRL_ENUM use
     (Enabled => 0,
      Power_Down => 1);

   subtype IDIVC_CTRL_IDIV_Field is HAL.UInt4;
   subtype IDIVC_CTRL_RESERVED_Field is HAL.UInt5;

   --  Block clock automatically during frequency change
   type IDIVC_CTRL_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for IDIVC_CTRL_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype IDIVC_CTRL_RESERVED_Field_1 is HAL.UInt12;

   --  Clock-source selection. All other values are reserved.
   type IDIVC_CTRL_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0AUDIO
      Pll0Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva)
     with Size => 5;
   for IDIVC_CTRL_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0Audio => 8,
      Pll1 => 9,
      Idiva => 12);

   subtype IDIVC_CTRL_RESERVED_Field_2 is HAL.UInt3;

   --  Integer divider C control register
   type IDIVC_CTRL_Register is record
      --  Integer divider power down
      PD         : IDIVC_CTRL_ENUM := LPC43xx.CGU.Enabled;
      --  Reserved
      RESERVED   : Boolean := False;
      --  Integer divider B, C, D divider values (1/(IDIV + 1)) 0000 = 1
      --  (default) 0001 = 2 ... 1111 = 16
      IDIV       : IDIVC_CTRL_IDIV_Field := 16#0#;
      --  Reserved
      RESERVED_1 : IDIVC_CTRL_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : IDIVC_CTRL_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_2 : IDIVC_CTRL_RESERVED_Field_1 := 16#0#;
      --  Clock-source selection. All other values are reserved.
      CLK_SEL    : IDIVC_CTRL_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_3 : IDIVC_CTRL_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IDIVC_CTRL_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 1;
      IDIV       at 0 range 2 .. 5;
      RESERVED_1 at 0 range 6 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_2 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_3 at 0 range 29 .. 31;
   end record;

   --  Integer divider power down
   type IDIVD_CTRL_ENUM is
     (
      --  Enabled. IDIV enabled (default)
      Enabled,
      --  Power-down
      Power_Down)
     with Size => 1;
   for IDIVD_CTRL_ENUM use
     (Enabled => 0,
      Power_Down => 1);

   subtype IDIVD_CTRL_IDIV_Field is HAL.UInt4;
   subtype IDIVD_CTRL_RESERVED_Field is HAL.UInt5;

   --  Block clock automatically during frequency change
   type IDIVD_CTRL_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for IDIVD_CTRL_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype IDIVD_CTRL_RESERVED_Field_1 is HAL.UInt12;

   --  Clock-source selection. All other values are reserved.
   type IDIVD_CTRL_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0AUDIO
      Pll0Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva)
     with Size => 5;
   for IDIVD_CTRL_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0Audio => 8,
      Pll1 => 9,
      Idiva => 12);

   subtype IDIVD_CTRL_RESERVED_Field_2 is HAL.UInt3;

   --  Integer divider D control register
   type IDIVD_CTRL_Register is record
      --  Integer divider power down
      PD         : IDIVD_CTRL_ENUM := LPC43xx.CGU.Enabled;
      --  Reserved
      RESERVED   : Boolean := False;
      --  Integer divider B, C, D divider values (1/(IDIV + 1)) 0000 = 1
      --  (default) 0001 = 2 ... 1111 = 16
      IDIV       : IDIVD_CTRL_IDIV_Field := 16#0#;
      --  Reserved
      RESERVED_1 : IDIVD_CTRL_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : IDIVD_CTRL_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_2 : IDIVD_CTRL_RESERVED_Field_1 := 16#0#;
      --  Clock-source selection. All other values are reserved.
      CLK_SEL    : IDIVD_CTRL_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_3 : IDIVD_CTRL_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IDIVD_CTRL_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 1;
      IDIV       at 0 range 2 .. 5;
      RESERVED_1 at 0 range 6 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_2 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_3 at 0 range 29 .. 31;
   end record;

   --  Integer divider power down
   type IDIVE_CTRL_ENUM is
     (
      --  Enabled. IDIV enabled (default)
      Enabled,
      --  Power-down
      Power_Down)
     with Size => 1;
   for IDIVE_CTRL_ENUM use
     (Enabled => 0,
      Power_Down => 1);

   subtype IDIVE_CTRL_IDIV_Field is HAL.UInt8;

   --  Block clock automatically during frequency change
   type IDIVE_CTRL_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for IDIVE_CTRL_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype IDIVE_CTRL_RESERVED_Field is HAL.UInt12;

   --  Clock-source selection. All other values are reserved.
   type IDIVE_CTRL_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0AUDIO
      Pll0Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva)
     with Size => 5;
   for IDIVE_CTRL_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0Audio => 8,
      Pll1 => 9,
      Idiva => 12);

   subtype IDIVE_CTRL_RESERVED_Field_1 is HAL.UInt3;

   --  Integer divider E control register
   type IDIVE_CTRL_Register is record
      --  Integer divider power down
      PD         : IDIVE_CTRL_ENUM := LPC43xx.CGU.Enabled;
      --  Reserved
      RESERVED   : Boolean := False;
      --  Integer divider E divider values (1/(IDIV + 1)) 00000000 = 1
      --  (default) 00000001 = 2 ... 111111111 = 256
      IDIV       : IDIVE_CTRL_IDIV_Field := 16#0#;
      --  Reserved
      RESERVED_1 : Boolean := False;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : IDIVE_CTRL_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_2 : IDIVE_CTRL_RESERVED_Field := 16#0#;
      --  Clock-source selection. All other values are reserved.
      CLK_SEL    : IDIVE_CTRL_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_3 : IDIVE_CTRL_RESERVED_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IDIVE_CTRL_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 1;
      IDIV       at 0 range 2 .. 9;
      RESERVED_1 at 0 range 10 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_2 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_3 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_SAFE_CLK_ENUM is
     (
      --  Enabled. Output stage enabled (default)
      Enabled,
      --  Power-down
      Power_Down)
     with Size => 1;
   for BASE_SAFE_CLK_ENUM use
     (Enabled => 0,
      Power_Down => 1);

   subtype BASE_SAFE_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_SAFE_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_SAFE_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_SAFE_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_SAFE_CLK_ENUM_2 is
     (
      --  IRC (default)
      Irc_Default)
     with Size => 5;
   for BASE_SAFE_CLK_ENUM_2 use
     (Irc_Default => 1);

   subtype BASE_SAFE_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage 0 control register for base clock BASE_SAFE_CLK
   type BASE_SAFE_CLK_Register is record
      --  Read-only. Output stage power down
      PD         : BASE_SAFE_CLK_ENUM;
      --  Read-only. Reserved
      RESERVED   : BASE_SAFE_CLK_RESERVED_Field;
      --  Read-only. Block clock automatically during frequency change
      AUTOBLOCK  : BASE_SAFE_CLK_ENUM_1;
      --  Read-only. Reserved
      RESERVED_1 : BASE_SAFE_CLK_RESERVED_Field_1;
      --  Read-only. Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_SAFE_CLK_ENUM_2;
      --  Read-only. Reserved
      RESERVED_2 : BASE_SAFE_CLK_RESERVED_Field_2;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_SAFE_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_USB0_CLK_ENUM is
     (
      --  Enabled. Output stage enabled (default)
      Enabled,
      --  Power-down
      Power_Down)
     with Size => 1;
   for BASE_USB0_CLK_ENUM use
     (Enabled => 0,
      Power_Down => 1);

   subtype BASE_USB0_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_USB0_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_USB0_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_USB0_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock-source selection.
   type BASE_USB0_CLK_ENUM_2 is
     (
      --  PLL0USB (default)
      Pll0Usb)
     with Size => 5;
   for BASE_USB0_CLK_ENUM_2 use
     (Pll0Usb => 7);

   subtype BASE_USB0_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage 1 control register for base clock BASE_USB0_CLK
   type BASE_USB0_CLK_Register is record
      --  Output stage power down
      PD         : BASE_USB0_CLK_ENUM := LPC43xx.CGU.Enabled;
      --  Reserved
      RESERVED   : BASE_USB0_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_USB0_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_USB0_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock-source selection.
      CLK_SEL    : BASE_USB0_CLK_ENUM_2 := LPC43xx.CGU.Pll0Usb;
      --  Reserved
      RESERVED_2 : BASE_USB0_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_USB0_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_PERIPH_CLK_ENUM is
     (
      --  Enabled. Output stage enabled (default)
      Enabled,
      --  Power-down
      Power_Down)
     with Size => 1;
   for BASE_PERIPH_CLK_ENUM use
     (Enabled => 0,
      Power_Down => 1);

   subtype BASE_PERIPH_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_PERIPH_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_PERIPH_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_PERIPH_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_PERIPH_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  Reset value for the field
      Base_Periph_Clk_Enum_Reset,
      --  PLL0AUDIO
      Pll0Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_PERIPH_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Base_Periph_Clk_Enum_Reset => 7,
      Pll0Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_PERIPH_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage 2 control register for base clock BASE_PERIPH_CLK
   type BASE_PERIPH_CLK_Register is record
      --  Output stage power down
      PD         : BASE_PERIPH_CLK_ENUM := LPC43xx.CGU.Enabled;
      --  Reserved
      RESERVED   : BASE_PERIPH_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_PERIPH_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_PERIPH_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_PERIPH_CLK_ENUM_2 := Base_Periph_Clk_Enum_Reset;
      --  Reserved
      RESERVED_2 : BASE_PERIPH_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_PERIPH_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_USB1_CLK_ENUM is
     (
      --  Enabled. Output stage enabled (default)
      Enabled,
      --  Power-down
      Power_Down)
     with Size => 1;
   for BASE_USB1_CLK_ENUM use
     (Enabled => 0,
      Power_Down => 1);

   subtype BASE_USB1_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_USB1_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_USB1_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_USB1_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_USB1_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0USB
      Pll0Usb,
      --  PLL0AUDIO
      Pll0Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_USB1_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0Usb => 7,
      Pll0Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_USB1_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage 3 control register for base clock BASE_USB1_CLK
   type BASE_USB1_CLK_Register is record
      --  Output stage power down
      PD         : BASE_USB1_CLK_ENUM := LPC43xx.CGU.Enabled;
      --  Reserved
      RESERVED   : BASE_USB1_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_USB1_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_USB1_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_USB1_CLK_ENUM_2 := LPC43xx.CGU.Irc;
      --  Reserved
      RESERVED_2 : BASE_USB1_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_USB1_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_M4_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_M4_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_M4_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_M4_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_M4_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_M4_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_M4_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_M4_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_M4_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage BASE_M4_CLK control register
   type BASE_M4_CLK_Register is record
      --  Output stage power down
      PD         : BASE_M4_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_M4_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_M4_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_M4_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_M4_CLK_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_2 : BASE_M4_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_M4_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_SPIFI_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_SPIFI_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_SPIFI_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_SPIFI_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_SPIFI_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_SPIFI_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_SPIFI_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_SPIFI_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_SPIFI_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage BASE_SPIFI_CLK control register
   type BASE_SPIFI_CLK_Register is record
      --  Output stage power down
      PD         : BASE_SPIFI_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_SPIFI_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_SPIFI_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_SPIFI_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_SPIFI_CLK_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_2 : BASE_SPIFI_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_SPIFI_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_SPI_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_SPI_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_SPI_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_SPI_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_SPI_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_SPI_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_SPI_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_SPI_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_SPI_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage BASE_SPI_CLK control register
   type BASE_SPI_CLK_Register is record
      --  Output stage power down
      PD         : BASE_SPI_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_SPI_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_SPI_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_SPI_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_SPI_CLK_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_2 : BASE_SPI_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_SPI_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_PHY_RX_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_PHY_RX_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_PHY_RX_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_PHY_RX_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_PHY_RX_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_PHY_RX_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_PHY_RX_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_PHY_RX_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_PHY_RX_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage BASE_PHY_RX_CLK control register
   type BASE_PHY_RX_CLK_Register is record
      --  Output stage power down
      PD         : BASE_PHY_RX_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_PHY_RX_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_PHY_RX_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_PHY_RX_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_PHY_RX_CLK_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_2 : BASE_PHY_RX_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_PHY_RX_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_PHY_TX_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_PHY_TX_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_PHY_TX_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_PHY_TX_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_PHY_TX_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_PHY_TX_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_PHY_TX_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_PHY_TX_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_PHY_TX_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage BASE_PHY_TX_CLK control register
   type BASE_PHY_TX_CLK_Register is record
      --  Output stage power down
      PD         : BASE_PHY_TX_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_PHY_TX_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_PHY_TX_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_PHY_TX_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_PHY_TX_CLK_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_2 : BASE_PHY_TX_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_PHY_TX_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_APB1_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_APB1_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_APB1_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_APB1_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_APB1_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_APB1_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_APB1_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_APB1_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_APB1_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage BASE_APB1_CLK control register
   type BASE_APB1_CLK_Register is record
      --  Output stage power down
      PD         : BASE_APB1_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_APB1_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_APB1_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_APB1_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_APB1_CLK_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_2 : BASE_APB1_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_APB1_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_APB3_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_APB3_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_APB3_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_APB3_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_APB3_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_APB3_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_APB3_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_APB3_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_APB3_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage BASE_APB3_CLK control register
   type BASE_APB3_CLK_Register is record
      --  Output stage power down
      PD         : BASE_APB3_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_APB3_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_APB3_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_APB3_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_APB3_CLK_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_2 : BASE_APB3_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_APB3_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_LCD_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_LCD_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_LCD_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_LCD_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_LCD_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_LCD_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_LCD_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_LCD_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_LCD_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage BASE_LCD_CLK control register
   type BASE_LCD_CLK_Register is record
      --  Output stage power down
      PD         : BASE_LCD_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_LCD_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_LCD_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_LCD_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_LCD_CLK_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_2 : BASE_LCD_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_LCD_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_SDIO_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_SDIO_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_SDIO_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_SDIO_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_SDIO_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_SDIO_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_SDIO_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_SDIO_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_SDIO_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage BASE_SDIO_CLK control register
   type BASE_SDIO_CLK_Register is record
      --  Output stage power down
      PD         : BASE_SDIO_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_SDIO_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_SDIO_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_SDIO_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_SDIO_CLK_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_2 : BASE_SDIO_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_SDIO_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_SSP0_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_SSP0_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_SSP0_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_SSP0_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_SSP0_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_SSP0_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_SSP0_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_SSP0_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_SSP0_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage BASE_SSP0_CLK control register
   type BASE_SSP0_CLK_Register is record
      --  Output stage power down
      PD         : BASE_SSP0_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_SSP0_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_SSP0_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_SSP0_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_SSP0_CLK_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_2 : BASE_SSP0_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_SSP0_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_SSP1_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_SSP1_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_SSP1_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_SSP1_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_SSP1_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_SSP1_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_SSP1_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_SSP1_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_SSP1_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage BASE_SSP1_CLK control register
   type BASE_SSP1_CLK_Register is record
      --  Output stage power down
      PD         : BASE_SSP1_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_SSP1_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_SSP1_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_SSP1_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_SSP1_CLK_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_2 : BASE_SSP1_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_SSP1_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_UART0_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_UART0_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_UART0_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_UART0_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_UART0_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_UART0_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_UART0_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_UART0_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_UART0_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage BASE_UART0_CLK control register
   type BASE_UART0_CLK_Register is record
      --  Output stage power down
      PD         : BASE_UART0_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_UART0_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_UART0_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_UART0_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_UART0_CLK_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_2 : BASE_UART0_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_UART0_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_UART1_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_UART1_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_UART1_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_UART1_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_UART1_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_UART1_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_UART1_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_UART1_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_UART1_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage BASE_UART1_CLK control register
   type BASE_UART1_CLK_Register is record
      --  Output stage power down
      PD         : BASE_UART1_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_UART1_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_UART1_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_UART1_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_UART1_CLK_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_2 : BASE_UART1_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_UART1_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_UART2_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_UART2_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_UART2_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_UART2_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_UART2_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_UART2_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_UART2_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_UART2_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_UART2_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage BASE_UART2_CLK control register
   type BASE_UART2_CLK_Register is record
      --  Output stage power down
      PD         : BASE_UART2_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_UART2_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_UART2_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_UART2_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_UART2_CLK_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_2 : BASE_UART2_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_UART2_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_UART3_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_UART3_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_UART3_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_UART3_CLK_ENUM_1 is
     (
      --  Disabled. Autoblocking disabled
      Disabled,
      --  Enabled. Autoblocking enabled
      Enabled)
     with Size => 1;
   for BASE_UART3_CLK_ENUM_1 use
     (Disabled => 0,
      Enabled => 1);

   subtype BASE_UART3_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock source selection. All other values are reserved.
   type BASE_UART3_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_UART3_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Crystal_Oscillator => 6,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_UART3_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage BASE_UART3_CLK control register
   type BASE_UART3_CLK_Register is record
      --  Output stage power down
      PD         : BASE_UART3_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_UART3_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_UART3_CLK_ENUM_1 := LPC43xx.CGU.Disabled;
      --  Reserved
      RESERVED_1 : BASE_UART3_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock source selection. All other values are reserved.
      CLK_SEL    : BASE_UART3_CLK_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_2 : BASE_UART3_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_UART3_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_OUT_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_OUT_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_OUT_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_OUT_CLK_ENUM_1 is
     (
      --  Autoblocking disabled
      Autoblocking_Disable,
      --  Autoblocking enabled
      Autoblocking_Enabled)
     with Size => 1;
   for BASE_OUT_CLK_ENUM_1 use
     (Autoblocking_Disable => 0,
      Autoblocking_Enabled => 1);

   subtype BASE_OUT_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock-source selection.
   type BASE_OUT_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Reserved
      Reserved,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  PLL0 (for USB)
      Pll0_For_Usb,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_OUT_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Reserved => 5,
      Crystal_Oscillator => 6,
      Pll0_For_Usb => 7,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_OUT_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage 20 control register for base clock BASE_OUT_CLK
   type BASE_OUT_CLK_Register is record
      --  Output stage power down
      PD         : BASE_OUT_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_OUT_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_OUT_CLK_ENUM_1 := LPC43xx.CGU.Autoblocking_Disable;
      --  Reserved
      RESERVED_1 : BASE_OUT_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock-source selection.
      CLK_SEL    : BASE_OUT_CLK_ENUM_2 := LPC43xx.CGU.Irc_Default;
      --  Reserved
      RESERVED_2 : BASE_OUT_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_OUT_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_AUDIO_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_AUDIO_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_AUDIO_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_AUDIO_CLK_ENUM_1 is
     (
      --  Autoblocking disabled
      Autoblocking_Disable,
      --  Autoblocking enabled
      Autoblocking_Enabled)
     with Size => 1;
   for BASE_AUDIO_CLK_ENUM_1 use
     (Autoblocking_Disable => 0,
      Autoblocking_Enabled => 1);

   subtype BASE_AUDIO_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock-source selection.
   type BASE_AUDIO_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Reserved
      Reserved,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  Reserved
      Reserved_1,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_AUDIO_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Reserved => 5,
      Crystal_Oscillator => 6,
      Reserved_1 => 7,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_AUDIO_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage 25 control register for base clock BASE_AUDIO_CLK
   type BASE_AUDIO_CLK_Register is record
      --  Output stage power down
      PD         : BASE_AUDIO_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_AUDIO_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_AUDIO_CLK_ENUM_1 := LPC43xx.CGU.Autoblocking_Disable;
      --  Reserved
      RESERVED_1 : BASE_AUDIO_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock-source selection.
      CLK_SEL    : BASE_AUDIO_CLK_ENUM_2 := LPC43xx.CGU.Val_32_Khz_Oscillator;
      --  Reserved
      RESERVED_2 : BASE_AUDIO_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_AUDIO_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_CGU_OUT0_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_CGU_OUT0_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_CGU_OUT0_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_CGU_OUT0_CLK_ENUM_1 is
     (
      --  Autoblocking disabled
      Autoblocking_Disable,
      --  Autoblocking enabled
      Autoblocking_Enabled)
     with Size => 1;
   for BASE_CGU_OUT0_CLK_ENUM_1 use
     (Autoblocking_Disable => 0,
      Autoblocking_Enabled => 1);

   subtype BASE_CGU_OUT0_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock-source selection.
   type BASE_CGU_OUT0_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Reserved
      Reserved,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  Reserved
      Reserved_1,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_CGU_OUT0_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Reserved => 5,
      Crystal_Oscillator => 6,
      Reserved_1 => 7,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_CGU_OUT0_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage 25 control register for base clock BASE_CGU_OUT0_CLK
   type BASE_CGU_OUT0_CLK_Register is record
      --  Output stage power down
      PD         : BASE_CGU_OUT0_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_CGU_OUT0_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_CGU_OUT0_CLK_ENUM_1 :=
                    LPC43xx.CGU.Autoblocking_Disable;
      --  Reserved
      RESERVED_1 : BASE_CGU_OUT0_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock-source selection.
      CLK_SEL    : BASE_CGU_OUT0_CLK_ENUM_2 :=
                    LPC43xx.CGU.Val_32_Khz_Oscillator;
      --  Reserved
      RESERVED_2 : BASE_CGU_OUT0_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_CGU_OUT0_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   --  Output stage power down
   type BASE_CGU_OUT1_CLK_ENUM is
     (
      --  Output stage enabled (default)
      Output_Stage_Enabled,
      --  power-down
      Power_Down)
     with Size => 1;
   for BASE_CGU_OUT1_CLK_ENUM use
     (Output_Stage_Enabled => 0,
      Power_Down => 1);

   subtype BASE_CGU_OUT1_CLK_RESERVED_Field is HAL.UInt10;

   --  Block clock automatically during frequency change
   type BASE_CGU_OUT1_CLK_ENUM_1 is
     (
      --  Autoblocking disabled
      Autoblocking_Disable,
      --  Autoblocking enabled
      Autoblocking_Enabled)
     with Size => 1;
   for BASE_CGU_OUT1_CLK_ENUM_1 use
     (Autoblocking_Disable => 0,
      Autoblocking_Enabled => 1);

   subtype BASE_CGU_OUT1_CLK_RESERVED_Field_1 is HAL.UInt12;

   --  Clock-source selection.
   type BASE_CGU_OUT1_CLK_ENUM_2 is
     (
      --  32 kHz oscillator
      Val_32_Khz_Oscillator,
      --  IRC (default)
      Irc_Default,
      --  ENET_RX_CLK
      Enet_Rx_Clk,
      --  ENET_TX_CLK
      Enet_Tx_Clk,
      --  GP_CLKIN
      Gp_Clkin,
      --  Reserved
      Reserved,
      --  Crystal oscillator
      Crystal_Oscillator,
      --  Reserved
      Reserved_1,
      --  PLL0 (for audio)
      Pll0_For_Audio,
      --  PLL1
      Pll1,
      --  IDIVA
      Idiva,
      --  IDIVB
      Idivb,
      --  IDIVC
      Idivc,
      --  IDIVD
      Idivd,
      --  IDIVE
      Idive)
     with Size => 5;
   for BASE_CGU_OUT1_CLK_ENUM_2 use
     (Val_32_Khz_Oscillator => 0,
      Irc_Default => 1,
      Enet_Rx_Clk => 2,
      Enet_Tx_Clk => 3,
      Gp_Clkin => 4,
      Reserved => 5,
      Crystal_Oscillator => 6,
      Reserved_1 => 7,
      Pll0_For_Audio => 8,
      Pll1 => 9,
      Idiva => 12,
      Idivb => 13,
      Idivc => 14,
      Idivd => 15,
      Idive => 16);

   subtype BASE_CGU_OUT1_CLK_RESERVED_Field_2 is HAL.UInt3;

   --  Output stage 25 control register for base clock BASE_CGU_OUT1_CLK
   type BASE_CGU_OUT1_CLK_Register is record
      --  Output stage power down
      PD         : BASE_CGU_OUT1_CLK_ENUM := LPC43xx.CGU.Output_Stage_Enabled;
      --  Reserved
      RESERVED   : BASE_CGU_OUT1_CLK_RESERVED_Field := 16#0#;
      --  Block clock automatically during frequency change
      AUTOBLOCK  : BASE_CGU_OUT1_CLK_ENUM_1 :=
                    LPC43xx.CGU.Autoblocking_Disable;
      --  Reserved
      RESERVED_1 : BASE_CGU_OUT1_CLK_RESERVED_Field_1 := 16#0#;
      --  Clock-source selection.
      CLK_SEL    : BASE_CGU_OUT1_CLK_ENUM_2 :=
                    LPC43xx.CGU.Val_32_Khz_Oscillator;
      --  Reserved
      RESERVED_2 : BASE_CGU_OUT1_CLK_RESERVED_Field_2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BASE_CGU_OUT1_CLK_Register use record
      PD         at 0 range 0 .. 0;
      RESERVED   at 0 range 1 .. 10;
      AUTOBLOCK  at 0 range 11 .. 11;
      RESERVED_1 at 0 range 12 .. 23;
      CLK_SEL    at 0 range 24 .. 28;
      RESERVED_2 at 0 range 29 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Clock Generation Unit (CGU)
   type CGU_Peripheral is record
      --  Frequency monitor register
      FREQ_MON          : aliased FREQ_MON_Register;
      --  Crystal oscillator control register
      XTAL_OSC_CTRL     : aliased XTAL_OSC_CTRL_Register;
      --  PLL0USB status register
      PLL0USB_STAT      : aliased PLL0USB_STAT_Register;
      --  PLL0USB control register
      PLL0USB_CTRL      : aliased PLL0USB_CTRL_Register;
      --  PLL0USB M-divider register
      PLL0USB_MDIV      : aliased PLL0USB_MDIV_Register;
      --  PLL0USB N/P-divider register
      PLL0USB_NP_DIV    : aliased PLL0USB_NP_DIV_Register;
      --  PLL0AUDIO status register
      PLL0AUDIO_STAT    : aliased PLL0AUDIO_STAT_Register;
      --  PLL0AUDIO control register
      PLL0AUDIO_CTRL    : aliased PLL0AUDIO_CTRL_Register;
      --  PLL0AUDIO M-divider register
      PLL0AUDIO_MDIV    : aliased PLL0AUDIO_MDIV_Register;
      --  PLL0AUDIO N/P-divider register
      PLL0AUDIO_NP_DIV  : aliased PLL0AUDIO_NP_DIV_Register;
      --  PLL0AUDIO fractional divider register
      PLL0AUDIO_FRAC    : aliased PLL0AUDIO_FRAC_Register;
      --  PLL1 status register
      PLL1_STAT         : aliased PLL1_STAT_Register;
      --  PLL1 control register
      PLL1_CTRL         : aliased PLL1_CTRL_Register;
      --  Integer divider A control register
      IDIVA_CTRL        : aliased IDIVA_CTRL_Register;
      --  Integer divider B control register
      IDIVB_CTRL        : aliased IDIVB_CTRL_Register;
      --  Integer divider C control register
      IDIVC_CTRL        : aliased IDIVC_CTRL_Register;
      --  Integer divider D control register
      IDIVD_CTRL        : aliased IDIVD_CTRL_Register;
      --  Integer divider E control register
      IDIVE_CTRL        : aliased IDIVE_CTRL_Register;
      --  Output stage 0 control register for base clock BASE_SAFE_CLK
      BASE_SAFE_CLK     : aliased BASE_SAFE_CLK_Register;
      --  Output stage 1 control register for base clock BASE_USB0_CLK
      BASE_USB0_CLK     : aliased BASE_USB0_CLK_Register;
      --  Output stage 2 control register for base clock BASE_PERIPH_CLK
      BASE_PERIPH_CLK   : aliased BASE_PERIPH_CLK_Register;
      --  Output stage 3 control register for base clock BASE_USB1_CLK
      BASE_USB1_CLK     : aliased BASE_USB1_CLK_Register;
      --  Output stage BASE_M4_CLK control register
      BASE_M4_CLK       : aliased BASE_M4_CLK_Register;
      --  Output stage BASE_SPIFI_CLK control register
      BASE_SPIFI_CLK    : aliased BASE_SPIFI_CLK_Register;
      --  Output stage BASE_SPI_CLK control register
      BASE_SPI_CLK      : aliased BASE_SPI_CLK_Register;
      --  Output stage BASE_PHY_RX_CLK control register
      BASE_PHY_RX_CLK   : aliased BASE_PHY_RX_CLK_Register;
      --  Output stage BASE_PHY_TX_CLK control register
      BASE_PHY_TX_CLK   : aliased BASE_PHY_TX_CLK_Register;
      --  Output stage BASE_APB1_CLK control register
      BASE_APB1_CLK     : aliased BASE_APB1_CLK_Register;
      --  Output stage BASE_APB3_CLK control register
      BASE_APB3_CLK     : aliased BASE_APB3_CLK_Register;
      --  Output stage BASE_LCD_CLK control register
      BASE_LCD_CLK      : aliased BASE_LCD_CLK_Register;
      --  Output stage BASE_SDIO_CLK control register
      BASE_SDIO_CLK     : aliased BASE_SDIO_CLK_Register;
      --  Output stage BASE_SSP0_CLK control register
      BASE_SSP0_CLK     : aliased BASE_SSP0_CLK_Register;
      --  Output stage BASE_SSP1_CLK control register
      BASE_SSP1_CLK     : aliased BASE_SSP1_CLK_Register;
      --  Output stage BASE_UART0_CLK control register
      BASE_UART0_CLK    : aliased BASE_UART0_CLK_Register;
      --  Output stage BASE_UART1_CLK control register
      BASE_UART1_CLK    : aliased BASE_UART1_CLK_Register;
      --  Output stage BASE_UART2_CLK control register
      BASE_UART2_CLK    : aliased BASE_UART2_CLK_Register;
      --  Output stage BASE_UART3_CLK control register
      BASE_UART3_CLK    : aliased BASE_UART3_CLK_Register;
      --  Output stage 20 control register for base clock BASE_OUT_CLK
      BASE_OUT_CLK      : aliased BASE_OUT_CLK_Register;
      --  Output stage 25 control register for base clock BASE_AUDIO_CLK
      BASE_AUDIO_CLK    : aliased BASE_AUDIO_CLK_Register;
      --  Output stage 25 control register for base clock BASE_CGU_OUT0_CLK
      BASE_CGU_OUT0_CLK : aliased BASE_CGU_OUT0_CLK_Register;
      --  Output stage 25 control register for base clock BASE_CGU_OUT1_CLK
      BASE_CGU_OUT1_CLK : aliased BASE_CGU_OUT1_CLK_Register;
   end record
     with Volatile;

   for CGU_Peripheral use record
      FREQ_MON          at 16#14# range 0 .. 31;
      XTAL_OSC_CTRL     at 16#18# range 0 .. 31;
      PLL0USB_STAT      at 16#1C# range 0 .. 31;
      PLL0USB_CTRL      at 16#20# range 0 .. 31;
      PLL0USB_MDIV      at 16#24# range 0 .. 31;
      PLL0USB_NP_DIV    at 16#28# range 0 .. 31;
      PLL0AUDIO_STAT    at 16#2C# range 0 .. 31;
      PLL0AUDIO_CTRL    at 16#30# range 0 .. 31;
      PLL0AUDIO_MDIV    at 16#34# range 0 .. 31;
      PLL0AUDIO_NP_DIV  at 16#38# range 0 .. 31;
      PLL0AUDIO_FRAC    at 16#3C# range 0 .. 31;
      PLL1_STAT         at 16#40# range 0 .. 31;
      PLL1_CTRL         at 16#44# range 0 .. 31;
      IDIVA_CTRL        at 16#48# range 0 .. 31;
      IDIVB_CTRL        at 16#4C# range 0 .. 31;
      IDIVC_CTRL        at 16#50# range 0 .. 31;
      IDIVD_CTRL        at 16#54# range 0 .. 31;
      IDIVE_CTRL        at 16#58# range 0 .. 31;
      BASE_SAFE_CLK     at 16#5C# range 0 .. 31;
      BASE_USB0_CLK     at 16#60# range 0 .. 31;
      BASE_PERIPH_CLK   at 16#64# range 0 .. 31;
      BASE_USB1_CLK     at 16#68# range 0 .. 31;
      BASE_M4_CLK       at 16#6C# range 0 .. 31;
      BASE_SPIFI_CLK    at 16#70# range 0 .. 31;
      BASE_SPI_CLK      at 16#74# range 0 .. 31;
      BASE_PHY_RX_CLK   at 16#78# range 0 .. 31;
      BASE_PHY_TX_CLK   at 16#7C# range 0 .. 31;
      BASE_APB1_CLK     at 16#80# range 0 .. 31;
      BASE_APB3_CLK     at 16#84# range 0 .. 31;
      BASE_LCD_CLK      at 16#88# range 0 .. 31;
      BASE_SDIO_CLK     at 16#90# range 0 .. 31;
      BASE_SSP0_CLK     at 16#94# range 0 .. 31;
      BASE_SSP1_CLK     at 16#98# range 0 .. 31;
      BASE_UART0_CLK    at 16#9C# range 0 .. 31;
      BASE_UART1_CLK    at 16#A0# range 0 .. 31;
      BASE_UART2_CLK    at 16#A4# range 0 .. 31;
      BASE_UART3_CLK    at 16#A8# range 0 .. 31;
      BASE_OUT_CLK      at 16#AC# range 0 .. 31;
      BASE_AUDIO_CLK    at 16#C0# range 0 .. 31;
      BASE_CGU_OUT0_CLK at 16#C4# range 0 .. 31;
      BASE_CGU_OUT1_CLK at 16#C8# range 0 .. 31;
   end record;

   --  Clock Generation Unit (CGU)
   CGU_Periph : aliased CGU_Peripheral
     with Import, Address => System'To_Address (16#40050000#);

end LPC43xx.CGU;
