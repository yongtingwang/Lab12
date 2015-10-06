`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:59 09/17/2015 
// Design Name: 
// Module Name:    minute_down 
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
`include "global.v"
module down_minute(
	min1,
	min0,
	in_min1,
	in_min0,
	clk_out,
	rst,
	borrow_sec,
	switch
	//decrease_enable
    );

input clk_out,rst,borrow_sec,switch;
input [3:0] in_min0,in_min1;
output [3:0] min1,min0;

wire borrow_min;  //useless
wire br0;

downcounter Udc0(
	.in_value(in_min0),
	.value(min0),
	.borrow(br0),
	.clk(clk_out),
	.rst_n(rst),
	.decrease(borrow_sec),
	.limit(`BCD_NINE),
	.switch(switch)
    );
	 
downcounter Udc1(
	.in_value(in_min1),
	.value(min1),
	.borrow(borrow_min),
	.clk(clk_out),
	.rst_n(rst),
	.decrease(br0),
	.limit(`BCD_ZERO),  //最高位不能再借位
	.switch(switch)
    );



endmodule
