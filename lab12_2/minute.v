`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:14:21 09/16/2015 
// Design Name: 
// Module Name:    minute 
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
module up_minute(
	min1,
	min0,
	clk,
	//carry_min, 
	//carry_sec,
	in_count1,
	switch,
	rst_n
    );
output  [`BCD_BIT_WIDTH-1:0] min1,min0;

 reg  carry_min,count;

input clk,rst_n,in_count1,switch;

reg load_def_min;
wire cout_min0, cout_min1;

always@*
if(switch==1'b1)
count=in_count1;
else
count=0;


//59to00
always@(min0 or min1)
if ((min1==`BCD_FIVE)&&(min0==`BCD_NINE))
	begin
	load_def_min = `ENABLED;
	carry_min=1'b1;
	end
else
	begin
	load_def_min = `DISABLED;
	carry_min=1'b0;
	end
	
upcounter Udig0(
.value(min0), // digit 0 of second
.carry_out(cout_min0), // carry out for digit 0
.clk(clk), // clock
.rst_n(rst_n), // asynchronous low active reset
.carry_in(count), // always increasing
.load_default(load_def_min), // enable load default value
.def_value(`BCD_ZERO) // default value for counter
);
// counter for digit 1
upcounter Udig1(
.value(min1), // digit 1 of second
.carry_out(cout_min1), // carry out for digit 1
.clk(clk), // clock
.rst_n(rst_n), // asynchronous low active reset
.carry_in(cout_min0), // increasing when digit 0 carry out
.load_default(load_def_min), // enable load default value
.def_value(`BCD_ZERO) // default value for counter
);


endmodule
