-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Fri Jul 31 18:06:30 2020
-- Host        : john-Inspiron-7447 running 64-bit Ubuntu 18.04.4 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/john/vivadoproject/VGA_mem_mapped-master/VGA_mem_mapped.srcs/sources_1/bd/VGA_top/ip/VGA_top_vidcut_0_0/VGA_top_vidcut_0_0_sim_netlist.vhdl
-- Design      : VGA_top_vidcut_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity VGA_top_vidcut_0_0 is
  port (
    viddata : in STD_LOGIC_VECTOR ( 23 downto 0 );
    vga_b : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vga_r : out STD_LOGIC_VECTOR ( 3 downto 0 );
    vga_g : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of VGA_top_vidcut_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of VGA_top_vidcut_0_0 : entity is "VGA_top_vidcut_0_0,vidcut,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of VGA_top_vidcut_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of VGA_top_vidcut_0_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of VGA_top_vidcut_0_0 : entity is "vidcut,Vivado 2018.3";
end VGA_top_vidcut_0_0;

architecture STRUCTURE of VGA_top_vidcut_0_0 is
  signal \^viddata\ : STD_LOGIC_VECTOR ( 23 downto 0 );
begin
  \^viddata\(23 downto 20) <= viddata(23 downto 20);
  \^viddata\(15 downto 12) <= viddata(15 downto 12);
  \^viddata\(7 downto 4) <= viddata(7 downto 4);
  vga_b(3 downto 0) <= \^viddata\(7 downto 4);
  vga_g(3 downto 0) <= \^viddata\(15 downto 12);
  vga_r(3 downto 0) <= \^viddata\(23 downto 20);
end STRUCTURE;
