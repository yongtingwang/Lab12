`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:22 09/04/2015 
// Design Name: 
// Module Name:    lab7_1 
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
module lab7_3(
	mode,
	clk,
	rst_n,
	//display,
	//ftsd_ctl
	key
    );

input clk,rst_n;
input [2:0] mode;

//output  [3:0] ftsd_ctl;
//output  [14:0] display;

output [15:0] key;

wire [1:0] clk_ctl;
wire clk_out;
wire [3:0] in0,in1,in2,in3,bcd;

assign key={in0,in1,in2,in3};

freq_div f1(
	.clk_out(clk_out), // divided clock output  1HZ
	.clk_ctl(clk_ctl), // divided clock output for scan freq
	.clk(clk), // global clock input
	.rst_n(rst_n) // active low reset
	); 

up_count u1(
	.mode(mode),
	.clk_out(clk_out),
	.rst_n(rst_n),
	.in0(in0),
	.in1(in1),
	.in2(in2),
	.in3(in3)
    );
/*
scan_ctl s1(
	.ftsd_ctl(ftsd_ctl), // ftsd display control signal 
	.ftsd_in(bcd), // output to ftsd display
	.in0(in0), // 1st input
	.in1(in1), // 2nd input
	.in2(in2), // 3rd input
	.in3(in3), // 4th input
	.ftsd_ctl_en(clk_ctl) // divided clock for scan control
	);

bcd2ftsegdec b1(
	.display(display), // 14-segment display output
	.bcd(bcd) // BCD input
	);
 
 */
endmodule
