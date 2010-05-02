////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2004 Xilinx, Inc.
// All Rights Reserved
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: v1.30
//  \   \         Application : KCPSM3
//  /   /         Filename: cobalt.v
// /___/   /\     
// \   \  /  \
//  \___\/\___\
//
//Command: kcpsm3 cobalt.psm
//Device: Spartan-3, Spartan-3E, Virtex-II, and Virtex-II Pro FPGAs
//Design Name: cobalt
//Generated 15Feb2010-20:07:43.
//Purpose:
// cobalt verilog program definition.
//
//Reference:
// PicoBlaze 8-bit Embedded Microcontroller User Guide
////////////////////////////////////////////////////////////////////////////////
`timescale 1 ps / 1ps
module cobalt (address, instruction, clk);
input [9:0] address;
input clk;
output [17:0] instruction;
RAMB16_S18 ram_1024_x_18(
 .DI  (16'h0000),
 .DIP  (2'b00),
 .EN (1'b1),
 .WE (1'b0),
 .SSR (1'b0),
 .CLK (clk),
 .ADDR (address),
 .DO (instruction[15:0]),
 .DOP (instruction[17:16]))
/*synthesis 
init_00 = "E00800FFE0070080E0060058E0050040E0040026E0030014E002000DE0010005" 
init_01 = "400D70E00E3000CC0091013100FAC001E00C0022E00B00EFE00A00BCE0090011" 
init_02 = "0082542940450082401A015400F1507B4047506E4048504A404D502C4052501A" 
init_03 = "CC005429400D00821C00582900D8120000821300008254294020008254294047" 
init_04 = "5429404D0082542940450082401A00F100684201006842020068420300684204" 
init_05 = "00684211CC105429400D00821C00582900D81200008213000082542940200082" 
init_06 = "40410082A000008B1F30008B1F4000B3401A00F1006842140068421300684212" 
init_07 = "C23002015429404F0082401A015EC23002005429405400825429404C00825429" 
init_08 = "CF21408B508F20024020A0004F224085548920044020A00070E08E01401A015E" 
init_09 = "5120810150A24F08B0004F0DFF10008B008554AA20104020821012100130A000" 
init_0A = "2004402000F10143EF3000F140910140409400F700F458A84130C10100F75494" 
init_0B = "A000142000C01240040E040E040E040E132000C0A20F1420132040AE4F22B000" 
init_0C = "B000400D70100130A000A0DFBC00407BB8004061A0008230A000823758C4420A" 
init_0D = "03060306030603061300B80000E51030A000C0F6B80080C640CD8101F01000C6" 
init_0E = "800AA000C0F6B80080075CEFC011B800C0E9B80080B9A000D030B80000E51020" 
init_0F = "008B0F65008B0F4200F100F1A000008B0F08A000008B0F20A000008B0F0DA000" 
init_10 = "008B0F4D008B0F20008B0F64008B0F6E008B0F61008B0F20008B0F6F008B0F74" 
init_11 = "0F6400F1008B0F20008B0F73008B0F79008B0F6F008B0F72008B0F6E008B0F6F" 
init_12 = "00F1008B0F72008B0F65008B0F67008B0F67008B0F75008B0F62008B0F65008B" 
init_13 = "008B0F54008B0F4C008B0F41008B0F42008B0F4F008B0F43008B0F7500F1A000" 
init_14 = "0F6F008B0F6C008B0F66008B0F72008B0F65008B0F76008B0F4FA000008B0F3E" 
init_15 = "0F4F00F140F1008B0F72008B0F6F008B008B0F72008B0F4500F4008B0F77008B" 
init_16 = "02005100600B02005100600CE10081016100E20FE10EE00D40F1008B0F4B008B" 
init_17 = "020051006006020051006007020051006008C27F02005100600902005100600A" 
init_18 = "C280020051006001020051006002020051006003020051006004020051006005" 
init_19 = "0000000000000000000000000000000000000000000000008001620F610E600D" 
init_1A = "0000000000000000000000000000000000000000000000000000000000000000" 
init_1B = "0000000000000000000000000000000000000000000000000000000000000000" 
init_1C = "0000000000000000000000000000000000000000000000000000000000000000" 
init_1D = "0000000000000000000000000000000000000000000000000000000000000000" 
init_1E = "0000000000000000000000000000000000000000000000000000000000000000" 
init_1F = "0000000000000000000000000000000000000000000000000000000000000000" 
init_20 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_21 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_22 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_23 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_24 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_25 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_26 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_27 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_28 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_29 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_2A = "0000000000000000000000000000000000000000000000000000000000000000" 
init_2B = "0000000000000000000000000000000000000000000000000000000000000000" 
init_2C = "0000000000000000000000000000000000000000000000000000000000000000" 
init_2D = "0000000000000000000000000000000000000000000000000000000000000000" 
init_2E = "0000000000000000000000000000000000000000000000000000000000000000" 
init_2F = "0000000000000000000000000000000000000000000000000000000000000000" 
init_30 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_31 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_32 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_33 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_34 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_35 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_36 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_37 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_38 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_39 = "0000000000000000000000000000000000000000000000000000000000000000" 
init_3A = "0000000000000000000000000000000000000000000000000000000000000000" 
init_3B = "0000000000000000000000000000000000000000000000000000000000000000" 
init_3C = "0000000000000000000000000000000000000000000000000000000000000000" 
init_3D = "0000000000000000000000000000000000000000000000000000000000000000" 
init_3E = "0000000000000000000000000000000000000000000000000000000000000000" 
init_3F = "4164000000000000000000000000000000000000000000000000000000000000" 
initp_00 = "8DFE37DF7B33FCCCCB73CCF7DF7FCCCCB73CCF7DF7FF777743FF888888888888" 
initp_01 = "CCFB2CB26676662CAA2C99DB9089999D8CAA30324FBFFF5F5D9BF442BD23D21F" 
initp_02 = "9249292492492AF33F33CCF33333332CCCCCCCCEF33333333CCCCCCCCCCCCCCC" 
initp_03 = "000000000000000000000000000000000000000000000000000000C0A4924924" 
initp_04 = "0000000000000000000000000000000000000000000000000000000000000000" 
initp_05 = "0000000000000000000000000000000000000000000000000000000000000000" 
initp_06 = "0000000000000000000000000000000000000000000000000000000000000000" 
initp_07 = "C000000000000000000000000000000000000000000000000000000000000000" */;
// synthesis translate_off
// Attributes for Simulation
defparam ram_1024_x_18.INIT_00  = 256'hE00800FFE0070080E0060058E0050040E0040026E0030014E002000DE0010005;
defparam ram_1024_x_18.INIT_01  = 256'h400D70E00E3000CC0091013100FAC001E00C0022E00B00EFE00A00BCE0090011;
defparam ram_1024_x_18.INIT_02  = 256'h0082542940450082401A015400F1507B4047506E4048504A404D502C4052501A;
defparam ram_1024_x_18.INIT_03  = 256'hCC005429400D00821C00582900D8120000821300008254294020008254294047;
defparam ram_1024_x_18.INIT_04  = 256'h5429404D0082542940450082401A00F100684201006842020068420300684204;
defparam ram_1024_x_18.INIT_05  = 256'h00684211CC105429400D00821C00582900D81200008213000082542940200082;
defparam ram_1024_x_18.INIT_06  = 256'h40410082A000008B1F30008B1F4000B3401A00F1006842140068421300684212;
defparam ram_1024_x_18.INIT_07  = 256'hC23002015429404F0082401A015EC23002005429405400825429404C00825429;
defparam ram_1024_x_18.INIT_08  = 256'hCF21408B508F20024020A0004F224085548920044020A00070E08E01401A015E;
defparam ram_1024_x_18.INIT_09  = 256'h5120810150A24F08B0004F0DFF10008B008554AA20104020821012100130A000;
defparam ram_1024_x_18.INIT_0A  = 256'h2004402000F10143EF3000F140910140409400F700F458A84130C10100F75494;
defparam ram_1024_x_18.INIT_0B  = 256'hA000142000C01240040E040E040E040E132000C0A20F1420132040AE4F22B000;
defparam ram_1024_x_18.INIT_0C  = 256'hB000400D70100130A000A0DFBC00407BB8004061A0008230A000823758C4420A;
defparam ram_1024_x_18.INIT_0D  = 256'h03060306030603061300B80000E51030A000C0F6B80080C640CD8101F01000C6;
defparam ram_1024_x_18.INIT_0E  = 256'h800AA000C0F6B80080075CEFC011B800C0E9B80080B9A000D030B80000E51020;
defparam ram_1024_x_18.INIT_0F  = 256'h008B0F65008B0F4200F100F1A000008B0F08A000008B0F20A000008B0F0DA000;
defparam ram_1024_x_18.INIT_10  = 256'h008B0F4D008B0F20008B0F64008B0F6E008B0F61008B0F20008B0F6F008B0F74;
defparam ram_1024_x_18.INIT_11  = 256'h0F6400F1008B0F20008B0F73008B0F79008B0F6F008B0F72008B0F6E008B0F6F;
defparam ram_1024_x_18.INIT_12  = 256'h00F1008B0F72008B0F65008B0F67008B0F67008B0F75008B0F62008B0F65008B;
defparam ram_1024_x_18.INIT_13  = 256'h008B0F54008B0F4C008B0F41008B0F42008B0F4F008B0F43008B0F7500F1A000;
defparam ram_1024_x_18.INIT_14  = 256'h0F6F008B0F6C008B0F66008B0F72008B0F65008B0F76008B0F4FA000008B0F3E;
defparam ram_1024_x_18.INIT_15  = 256'h0F4F00F140F1008B0F72008B0F6F008B008B0F72008B0F4500F4008B0F77008B;
defparam ram_1024_x_18.INIT_16  = 256'h02005100600B02005100600CE10081016100E20FE10EE00D40F1008B0F4B008B;
defparam ram_1024_x_18.INIT_17  = 256'h020051006006020051006007020051006008C27F02005100600902005100600A;
defparam ram_1024_x_18.INIT_18  = 256'hC280020051006001020051006002020051006003020051006004020051006005;
defparam ram_1024_x_18.INIT_19  = 256'h0000000000000000000000000000000000000000000000008001620F610E600D;
defparam ram_1024_x_18.INIT_1A  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_1B  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_1C  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_1D  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_1E  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_1F  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_20  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_21  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_22  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_23  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_24  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_25  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_26  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_27  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_28  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_29  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_2A  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_2B  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_2C  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_2D  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_2E  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_2F  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_30  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_31  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_32  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_33  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_34  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_35  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_36  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_37  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_38  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_39  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_3A  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_3B  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_3C  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_3D  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_3E  = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INIT_3F  = 256'h4164000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INITP_00 = 256'h8DFE37DF7B33FCCCCB73CCF7DF7FCCCCB73CCF7DF7FF777743FF888888888888;
defparam ram_1024_x_18.INITP_01 = 256'hCCFB2CB26676662CAA2C99DB9089999D8CAA30324FBFFF5F5D9BF442BD23D21F;
defparam ram_1024_x_18.INITP_02 = 256'h9249292492492AF33F33CCF33333332CCCCCCCCEF33333333CCCCCCCCCCCCCCC;
defparam ram_1024_x_18.INITP_03 = 256'h000000000000000000000000000000000000000000000000000000C0A4924924;
defparam ram_1024_x_18.INITP_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INITP_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INITP_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam ram_1024_x_18.INITP_07 = 256'hC000000000000000000000000000000000000000000000000000000000000000;
// synthesis translate_on
// Attributes for XST (Synplicity attributes are in-line)
// synthesis attribute INIT_00  of ram_1024_x_18 is "E00800FFE0070080E0060058E0050040E0040026E0030014E002000DE0010005"
// synthesis attribute INIT_01  of ram_1024_x_18 is "400D70E00E3000CC0091013100FAC001E00C0022E00B00EFE00A00BCE0090011"
// synthesis attribute INIT_02  of ram_1024_x_18 is "0082542940450082401A015400F1507B4047506E4048504A404D502C4052501A"
// synthesis attribute INIT_03  of ram_1024_x_18 is "CC005429400D00821C00582900D8120000821300008254294020008254294047"
// synthesis attribute INIT_04  of ram_1024_x_18 is "5429404D0082542940450082401A00F100684201006842020068420300684204"
// synthesis attribute INIT_05  of ram_1024_x_18 is "00684211CC105429400D00821C00582900D81200008213000082542940200082"
// synthesis attribute INIT_06  of ram_1024_x_18 is "40410082A000008B1F30008B1F4000B3401A00F1006842140068421300684212"
// synthesis attribute INIT_07  of ram_1024_x_18 is "C23002015429404F0082401A015EC23002005429405400825429404C00825429"
// synthesis attribute INIT_08  of ram_1024_x_18 is "CF21408B508F20024020A0004F224085548920044020A00070E08E01401A015E"
// synthesis attribute INIT_09  of ram_1024_x_18 is "5120810150A24F08B0004F0DFF10008B008554AA20104020821012100130A000"
// synthesis attribute INIT_0A  of ram_1024_x_18 is "2004402000F10143EF3000F140910140409400F700F458A84130C10100F75494"
// synthesis attribute INIT_0B  of ram_1024_x_18 is "A000142000C01240040E040E040E040E132000C0A20F1420132040AE4F22B000"
// synthesis attribute INIT_0C  of ram_1024_x_18 is "B000400D70100130A000A0DFBC00407BB8004061A0008230A000823758C4420A"
// synthesis attribute INIT_0D  of ram_1024_x_18 is "03060306030603061300B80000E51030A000C0F6B80080C640CD8101F01000C6"
// synthesis attribute INIT_0E  of ram_1024_x_18 is "800AA000C0F6B80080075CEFC011B800C0E9B80080B9A000D030B80000E51020"
// synthesis attribute INIT_0F  of ram_1024_x_18 is "008B0F65008B0F4200F100F1A000008B0F08A000008B0F20A000008B0F0DA000"
// synthesis attribute INIT_10  of ram_1024_x_18 is "008B0F4D008B0F20008B0F64008B0F6E008B0F61008B0F20008B0F6F008B0F74"
// synthesis attribute INIT_11  of ram_1024_x_18 is "0F6400F1008B0F20008B0F73008B0F79008B0F6F008B0F72008B0F6E008B0F6F"
// synthesis attribute INIT_12  of ram_1024_x_18 is "00F1008B0F72008B0F65008B0F67008B0F67008B0F75008B0F62008B0F65008B"
// synthesis attribute INIT_13  of ram_1024_x_18 is "008B0F54008B0F4C008B0F41008B0F42008B0F4F008B0F43008B0F7500F1A000"
// synthesis attribute INIT_14  of ram_1024_x_18 is "0F6F008B0F6C008B0F66008B0F72008B0F65008B0F76008B0F4FA000008B0F3E"
// synthesis attribute INIT_15  of ram_1024_x_18 is "0F4F00F140F1008B0F72008B0F6F008B008B0F72008B0F4500F4008B0F77008B"
// synthesis attribute INIT_16  of ram_1024_x_18 is "02005100600B02005100600CE10081016100E20FE10EE00D40F1008B0F4B008B"
// synthesis attribute INIT_17  of ram_1024_x_18 is "020051006006020051006007020051006008C27F02005100600902005100600A"
// synthesis attribute INIT_18  of ram_1024_x_18 is "C280020051006001020051006002020051006003020051006004020051006005"
// synthesis attribute INIT_19  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000008001620F610E600D"
// synthesis attribute INIT_1A  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_1B  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_1C  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_1D  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_1E  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_1F  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_20  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_21  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_22  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_23  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_24  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_25  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_26  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_27  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_28  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_29  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_2A  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_2B  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_2C  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_2D  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_2E  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_2F  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_30  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_31  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_32  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_33  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_34  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_35  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_36  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_37  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_38  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_39  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_3A  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_3B  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_3C  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_3D  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_3E  of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INIT_3F  of ram_1024_x_18 is "4164000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INITP_00 of ram_1024_x_18 is "8DFE37DF7B33FCCCCB73CCF7DF7FCCCCB73CCF7DF7FF777743FF888888888888"
// synthesis attribute INITP_01 of ram_1024_x_18 is "CCFB2CB26676662CAA2C99DB9089999D8CAA30324FBFFF5F5D9BF442BD23D21F"
// synthesis attribute INITP_02 of ram_1024_x_18 is "9249292492492AF33F33CCF33333332CCCCCCCCEF33333333CCCCCCCCCCCCCCC"
// synthesis attribute INITP_03 of ram_1024_x_18 is "000000000000000000000000000000000000000000000000000000C0A4924924"
// synthesis attribute INITP_04 of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INITP_05 of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INITP_06 of ram_1024_x_18 is "0000000000000000000000000000000000000000000000000000000000000000"
// synthesis attribute INITP_07 of ram_1024_x_18 is "C000000000000000000000000000000000000000000000000000000000000000"
endmodule
// END OF FILE cobalt.v