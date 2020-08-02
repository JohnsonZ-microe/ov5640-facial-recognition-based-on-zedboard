`timescale 1 ns / 1 ps
 
module VGA_disp #
    (
        // Users to add parameters here
 
        // User parameters ends
        // Do not modify the parameters beyond this line
 
        // AXI4Stream sink: Data Width
        parameter integer C_S_AXIS_TDATA_WIDTH	= 32,
        parameter  integer  H_ACTIVE     =   0  ,
        parameter  integer  H_FRONT      =   0   ,
        parameter  integer  H_SYNC       =   0   ,
        parameter  integer  H_BACK       =   0   ,
        parameter  integer  V_ACTIVE     =   0  ,
        parameter  integer  V_FRONT      =   0   ,
        parameter  integer  V_SYNC       =   0  ,
        parameter  integer  V_BACK       =   0
    )
    (
        // Users to add ports here
 
        output  VGA_VSYNC,VGA_HSYNC,
        output [3:0] VGA_R, VGA_G, VGA_B,
 
        // User ports ends
        // Do not modify the ports beyond this line
 
        // AXI4Stream sink: Clock
        input wire  S_AXIS_ACLK, // aclk should be PIXCEL CLOCK!!!
        // AXI4Stream sink: Reset
        input wire  S_AXIS_ARESETN,
        // Ready to accept data in
        output wire  S_AXIS_TREADY,
        // Data in
        input wire [C_S_AXIS_TDATA_WIDTH-1 : 0] S_AXIS_TDATA,
        // Byte qualifier
        input wire [(C_S_AXIS_TDATA_WIDTH/8)-1 : 0] S_AXIS_TSTRB,
        // Indicates boundary of last packet
        input wire  S_AXIS_TLAST,
        // Data is in valid
        input wire  S_AXIS_TVALID
    );
 
    AXIS_VGA   #(
                   .H_ACTIVE     ( H_ACTIVE ) ,
                   .H_FRONT      ( H_FRONT  )  ,
                   .H_SYNC       ( H_SYNC   ) ,
                   .H_BACK       ( H_BACK   ),
                   .V_ACTIVE     ( V_ACTIVE ) ,
                   .V_FRONT      ( V_FRONT  ) ,
                   .V_SYNC       ( V_SYNC   ) ,
                   .V_BACK       ( V_BACK   )
 
 
               )IVGA(
                   .pixel_clock(S_AXIS_ACLK),
                   .rst_i(~S_AXIS_ARESETN),
                   .valid(S_AXIS_TVALID),
                   .last(S_AXIS_TLAST) ,
 
                   /*
                   .R_i('HFF),
                   .G_i('HFF),
                   .B_i('HFF), 
                   */
 
                   .R_i(S_AXIS_TDATA[11:8]),
                   .G_i(S_AXIS_TDATA[7:4]),
                   .B_i(S_AXIS_TDATA[3:0]),
 
                   .R_o(VGA_R),
                   .G_o(VGA_G),
                   .B_o(VGA_B),
                   .HSYNC(VGA_HSYNC),
                   .VSYNC (VGA_VSYNC)	,
                   .ready (S_AXIS_TREADY)
               );
 
endmodule
 
 
 
 
 
module AXIS_VGA #(
        parameter  integer  H_ACTIVE     =   0  ,
        parameter  integer  H_FRONT      =   0   ,
        parameter  integer  H_SYNC       =   0   ,
        parameter  integer  H_BACK       =   0   ,
        parameter  integer  V_ACTIVE     =   0  ,
        parameter  integer  V_FRONT      =   0   ,
        parameter  integer  V_SYNC       =   0   ,
        parameter  integer  V_BACK       =   0
    )   (
 
        input pixel_clock,    rst_i,
        output reg [31:0] pixel_count,line_count,
        input valid,last,// AXIS-SLAVE总线的vadlid he last
        input [7:0] R_i,G_i,B_i,//接AXIS总线的数据端
        output reg  [7:0] R_o,G_o,B_o, // 接VGA
        output  reg     HSYNC,    VSYNC,//接VGA信号
		output reg DP_EN ,PCLK , //ADV7123类控制器备用
        output reg     ready     // AXIS-SLAVE总线的READY
    );
 
 
    parameter integer H_TOTAL  = H_SYNC + H_BACK + H_ACTIVE + H_FRONT;
    parameter integer V_TOTAL  = V_SYNC + V_BACK + V_ACTIVE + V_FRONT;
 
 
    reg local_rst;    always @ (posedge pixel_clock) local_rst <= rst_i ;
	//将复位信号同步，以改善时序。	
	
 
/*！！！！在此有删节！！！！*/
 
	//allow_ack 依赖于 frame_start,并落后于 frame_start 一个周期，因此相当于 pixel(line)_count 延迟了两个周期
    always@* ready = allow_ack &  reg_dp_en[1]  & valid  ; 
	/*
	reg_dp_en[0] 延迟于pixel(line)_count 1个周期，所以
	reg_dp_en[1] 延迟于pixel(line)_count 2个周期。
	
	allow_ack 上述已经分析，延迟于pixel(line)_count 2个周期。因此时序上同步的。
	
	和valid一起确定是否回复根axi_stream master以应答信号。
	*/ 
    
	always@(posedge pixel_clock) {R_o,G_o,B_o} <=  (0==reg_dp_en[1]) ? 0  : {R_i,G_i,B_i}  ;
	/*
	当AXI_STREAM的master端的valid有效的同周期里，AXI_MASTER的输出(也就是此模块的输入R_i,G_i,B_i)也有效，
	我们要用reg_dp_en[1]来控制产生消隐信号(即 {R_o,G_o,B_o}<=0),因为reg_dp_en[1]同valid时序对齐，所以 也是和R_i,G_i,B_i时序对齐.
	*/
	/*
	另外我们看到{R_o,G_o,B_o}是在reg_dp_en[1]下个周期生成的，因此相对与pixel(line)_count，延迟了3周期
	*/
	
	
	always@(posedge pixel_clock) DP_EN <= reg_dp_en[1]; 
	/*
	模块外可能用到的对{R_o,G_o,B_o}进行控制的DP_EN，对应{R_o,G_o,B_o}，
	因此延迟相对与reg_dp_en[1]延迟一周期，是在pixel(line)_count三个周期后产生的。
	*/
    reg     h_synch,    v_synch;
	
    always@(posedge pixel_clock)    
	if ( local_rst ) h_synch<=1;else
    if ( pixel_count ==(H_ACTIVE+H_FRONT-1))
        h_synch<=0;
    else if ( pixel_count ==(H_ACTIVE+H_FRONT+H_SYNC-1))
        h_synch<=1;
    always@(posedge pixel_clock)
        if ( local_rst ) v_synch<=1;else
    if ( pixel_count ==(H_TOTAL-1))
    begin
        if (line_count==(V_ACTIVE+V_FRONT-1))
            v_synch<=0;
        else if ( line_count ==(V_ACTIVE+V_FRONT +V_SYNC-1))
            v_synch<=1;
    end
	/*
	以上是根据计数器 pixel(line)_count产生同步信号的逻辑。这里要注意根输出时序对应。
	*/
	
    reg     h_synch_r,v_synch_r ;
    always@(posedge pixel_clock)    {     h_synch_r,v_synch_r } <= {    h_synch,v_synch } ;
    always@(posedge pixel_clock)    {HSYNC,VSYNC}  <= {    h_synch_r,v_synch_r } ;
	/*
	v_synch,h_synch都是在pixel(line)_count一个周期后产生的。
	而{R_o,G_o,B_o}是在pixel(line)_count三个周期后产生的，因此要再加两级的延迟才能对应{R_o,G_o,B_o}作为输出。
 	*/
   	
	
	
	
endmodule
