`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2020 05:26:02 PM
// Design Name: 
// Module Name: vidcut
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vidcut(
    input [23:0] viddata,
    output [3:0] vga_b,
    output [3:0] vga_r,
    output [3:0] vga_g
    );
    
    assign vga_b[3:0] = viddata[7:4];
    assign vga_g[3:0] = viddata[15:12];
    assign vga_r[3:0] = viddata[23:20];
    
endmodule

