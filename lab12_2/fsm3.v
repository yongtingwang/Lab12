`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:08:47 09/18/2015 
// Design Name: 
// Module Name:    fsm3 
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
module fsm3(
	min0,
	min1,
	sec0,
	sec1,
	in_min0,
	in_min1,
	in_sec0,
	in_sec1,
	in0,
	in1,
	in2,
	in3,
	switch
    );
input [3:0] min0,min1,sec0,sec1,in_min0,in_min1,in_sec0,in_sec1;
input 	switch;
output reg [3:0] in0,in1,in2,in3;
	 


always@*
if (switch==1'b1) begin
	in0=in_min1;
	in1=in_min0;
	in2=in_sec1;
	in3=in_sec0; end
 
else begin
	in0=min1;
	in1=min0;
	in2=sec1;
	in3=sec0;end


endmodule
