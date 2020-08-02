// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Fri Jul 31 18:06:29 2020
// Host        : john-Inspiron-7447 running 64-bit Ubuntu 18.04.4 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/john/vivadoproject/VGA_mem_mapped-master/VGA_mem_mapped.srcs/sources_1/bd/VGA_top/ip/VGA_top_vidcut_0_0/VGA_top_vidcut_0_0_stub.v
// Design      : VGA_top_vidcut_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vidcut,Vivado 2018.3" *)
module VGA_top_vidcut_0_0(viddata, vga_b, vga_r, vga_g)
/* synthesis syn_black_box black_box_pad_pin="viddata[23:0],vga_b[3:0],vga_r[3:0],vga_g[3:0]" */;
  input [23:0]viddata;
  output [3:0]vga_b;
  output [3:0]vga_r;
  output [3:0]vga_g;
endmodule
