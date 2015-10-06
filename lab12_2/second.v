`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:08:07 09/16/2015 
// Design Name: 
// Module Name:    second 
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
module up_second(
	sec1, // digit 1 for second
	sec0, // digit 0 for second
	clk, // global clock
	//carry_sec,
	//out0,
	in_count0,
	rst_n, // low active reset
	switch
	);
// outputs
output [`BCD_BIT_WIDTH-1:0] sec1; // digit 1 for second
output [`BCD_BIT_WIDTH-1:0] sec0; // digit 0 for second
//output carry_sec;
// inputs
input in_count0,switch;
input clk; // global clock signal
input rst_n; // low active reset
// temporatory nets
reg count;
reg load_def_sec; // enabled to load second value
reg carry_sec;
wire cout_sec0, cout_sec1; // BCD counter carryout
// return from 59 to 00

always@*
if(switch==1'b1)
	count= in_count0;
else
	count=`DISABLED;



always @(sec0 or sec1)
if ((sec1==`BCD_FIVE)&&(sec0==`BCD_NINE))
begin
load_def_sec = `ENABLED;
carry_sec=1'b1;
end
else
begin
load_def_sec = `DISABLED;
carry_sec=1'b0;
end

// counter for digit 0
upcounter Udig0(
.value(sec0), // digit 0 of second
.carry_out(cout_sec0), // carry out for digit 0
.clk(clk), // clock
.rst_n(rst_n), // asynchronous low active reset
.carry_in(count), // always increasing
.load_default(load_def_sec), // enable load default value
.def_value(`BCD_ZERO) // default value for counter
);
// counter for digit 1
upcounter Udig1(
.value(sec1), // digit 1 of second
.carry_out(cout_sec1), // carry out for digit 1
.clk(clk), // clock
.rst_n(rst_n), // asynchronous low active reset
.carry_in(cout_sec0), // increasing when digit 0 carry out
.load_default(load_def_sec), // enable load default value
.def_value(`BCD_ZERO) // default value for counter
);


endmodule
