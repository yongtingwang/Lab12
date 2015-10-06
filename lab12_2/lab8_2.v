`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:37:33 09/17/2015 
// Design Name: 
// Module Name:    lab8_2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lab8_2(
	clk,
	rst_n,
	sel0,
	sel1,
	sel_switch,
	//ftsd_ctl,
	//display,
	light,
	key
    );

input clk,rst_n,sel0,sel1,sel_switch;

output [15:0] key;
//output [3:0]ftsd_ctl;
//output [14:0] display;
output [15:0]light;

wire clk_out,clk_100,switch,out_switch;
wire [1:0] clk_ctl,alu;
wire out0,out1,rst,borrow_sec,in_count0,in_count1;
wire [3:0] in_sec1,in_sec0,in_min0,in_min1,sec1,sec0,min0,min1;
wire [3:0] dig1,dig2,dig3,dig4,in0,in1,in2,in3,bcd;


assign light=(in0||in1||in2||in3)? 16'b0000_0000_0000_0000:16'b1111_1111_1111_1111;
assign key={in0,in1,in2,in3};

freq_div f1(
  .clk_out(clk_out), // divided clock output
  .clk_ctl(clk_ctl), // divided clock for seven-segment display scan
  .clk(clk), // clock from the crystal
  .rst_n(rst_n), // low active reset
  .clk_100(clk_100) // generated 100 Hz clock
	);

button0  btn0(
	.clk_100(clk_100),
	.clk(clk),
	.rst_n(rst_n),
	.pb_in(sel0),
	.out_pulse(out0)
    );
	 
button0 btn1(
	.clk_100(clk_100),
	.clk(clk),
	.rst_n(rst_n),
	.pb_in(sel1),
	.out_pulse(out1)
    );
	 
button0 btnswitch(
	.clk_100(clk_100),
	.clk(clk),
	.rst_n(rst_n),
	.pb_in(sel_switch),
	.out_pulse(out_switch)
    );	 
	 
fsm_count fsm_count(
	.out1(out1),
	.out0(out0),
	.in_count0(in_count0),
	.in_count1(in_count1),
	.clk(clk),
	.rst_n(rst_n),
	.sel_switch(out_switch),
	.switch(switch)
    );

up_second(
	.sec1(in_sec1), // digit 1 for second   //in_sec1µ¹down_counter ¨Ï¥Î
	.sec0(in_sec0), // digit 0 for second
	.clk(clk_out), // global clock
	.in_count0(in_count0),
	.rst_n(rst_n), // low active reset
	.switch(switch)
	);

up_minute(
	.min1(in_min1),
	.min0(in_min0),
	.clk(clk_out),
	.in_count1(in_count1),
	.switch(switch),
	.rst_n(rst_n)
    );

	 
fsm fsm1(
   .sel1(out1),
	.sel0(out0),
	.clk(clk),
	.alu(alu),
	.rst_n(rst_n),
	.rst(rst),
	.switch(switch)
    );

countdown(
	.min1(min1),
	.min0(min0),
	.sec1(sec1),
	.sec0(sec0),
	.in_min1(in_min1),
	.in_min0(in_min0),
	.in_sec1(in_sec1),
	.in_sec0(in_sec0),
	.clk_out(clk_out),
	.rst_n(rst),
	.switch(switch),
	.alu(alu)
    );

fsm2(
	.dig1(dig1),
	.dig2(dig2),
	.dig3(dig3),
	.dig4(dig4),
	.sec1(sec1),
	.sec0(sec0),
	.min1(min1),
	.min0(min0),
	.alu(alu),
	.clk(clk),
	.rst_n(rst_n),
	.switch(switch)
    );


fsm3(
	.min0(dig2),
	.min1(dig1),
	.sec0(dig4),
	.sec1(dig3),
	.in_min0(in_min0),
	.in_min1(in_min1),
	.in_sec0(in_sec0),
	.in_sec1(in_sec1),
	.in0(in0),
	.in1(in1),
	.in2(in2),
	.in3(in3),
	.switch(switch)
    );
	/*
scan_ctl(
	.ftsd_ctl(ftsd_ctl), // ftsd display control signal 
	.ftsd_in(bcd), // output to ftsd display
	.in0(in0), // 1st input
	.in1(in1), // 2nd input
	.in2(in2), // 3rd input
	.in3(in3), // 4th input
	.ftsd_ctl_en(clk_ctl) // divided clock for scan control
	);

bcd2ftsegdec(
	.display(display), // 14-segment display output
	.bcd(bcd) // BCD input
	);
	*/
endmodule
