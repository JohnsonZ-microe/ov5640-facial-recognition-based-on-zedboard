// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Fri Jul 31 15:35:38 2020
// Host        : john-Inspiron-7447 running 64-bit Ubuntu 18.04.4 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ VGA_top_VGAdisp_S00_AXIS_0_0_stub.v
// Design      : VGA_top_VGAdisp_S00_AXIS_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "myip_v1_0_S00_AXIS,Vivado 2018.3" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(VGA_VSYNC, VGA_HSYNC, VGA_R, VGA_G, VGA_B, 
  S_AXIS_ACLK, S_AXIS_ARESETN, S_AXIS_TREADY, S_AXIS_TDATA, S_AXIS_TSTRB, S_AXIS_TLAST, 
  S_AXIS_TVALID)
/* synthesis syn_black_box black_box_pad_pin="VGA_VSYNC,VGA_HSYNC,VGA_R[3:0],VGA_G[3:0],VGA_B[3:0],S_AXIS_ACLK,S_AXIS_ARESETN,S_AXIS_TREADY,S_AXIS_TDATA[31:0],S_AXIS_TSTRB[3:0],S_AXIS_TLAST,S_AXIS_TVALID" */;
  output VGA_VSYNC;
  output VGA_HSYNC;
  output [3:0]VGA_R;
  output [3:0]VGA_G;
  output [3:0]VGA_B;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  output S_AXIS_TREADY;
  input [31:0]S_AXIS_TDATA;
  input [3:0]S_AXIS_TSTRB;
  input S_AXIS_TLAST;
  input S_AXIS_TVALID;
endmodule
