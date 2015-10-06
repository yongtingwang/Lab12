`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:16 09/17/2015 
// Design Name: 
// Module Name:    second_down 
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
module down_second(
	sec1,
	sec0,
	clk_out,
	rst,
	borrow_sec,
	//decrease_enable,
	alu,
	in_sec1,
	in_sec0,
	switch
    );

input clk_out,rst,switch;
input [1:0]alu;
input [3:0] in_sec1,in_sec0;
output [3:0] sec1,sec0;
output borrow_sec;
reg count;
wire br0;
wire en;


always @*
begin
if(alu==2'b00 || switch==1'b1)
count=`DISABLED;
else
count=`ENABLED;
end


downcounter Udc0(
	.in_value(in_sec0),
	.value(sec0),
	.borrow(br0),
	.clk(clk_out),
	.rst_n(rst),
	.decrease(count),
	.limit(`BCD_NINE),
	.switch(switch),
//	.en(`ENABLED)
    );
	 
downcounter Udc1(
	.in_value(in_sec1),
	.value(sec1),
	.borrow(borrow_sec),
	.clk(clk_out),
	.rst_n(rst),
	.decrease(br0),
	.limit(`BCD_FIVE),
	.switch(switch),
//	.en(`ENABLED)
    );
	 
endmodule
