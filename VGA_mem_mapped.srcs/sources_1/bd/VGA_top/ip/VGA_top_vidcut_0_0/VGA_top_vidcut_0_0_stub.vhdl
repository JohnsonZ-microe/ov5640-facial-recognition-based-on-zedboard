-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Fri Jul 31 18:06:29 2020
-- Host        : john-Inspiron-7447 running 64-bit Ubuntu 18.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/john/vivadoproject/VGA_mem_mapped-master/VGA_mem_mapped.srcs/sources_1/bd/VGA_top/ip/VGA_top_vidcut_0_0/VGA_top_vidcut_0_0_stub.vhdl
-- Design      : VGA_top_vidcut_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VGA_top_vidcut_0_0 is
  Port ( 
    viddata : in STD_LOGIC_VECTOR ( 23 downto 0 );
    vga_b : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vga_r : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vga_g : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end VGA_top_vidcut_0_0;

architecture stub of VGA_top_vidcut_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "viddata[23:0],vga_b[3:0],vga_r[3:0],vga_g[3:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "vidcut,Vivado 2018.3";
begin
end;
