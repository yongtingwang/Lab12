`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:08:21 09/16/2015 
// Design Name: 
// Module Name:    button0 
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
module button0(
	clk_100,
	clk,
	rst_n,
	pb_in,
	out_pulse
    );
input clk_100,rst_n,pb_in,clk;
output out_pulse;
wire pb_debounced;

debounce d0(
	.clk_100(clk_100), //clock control
	.rst_n(rst_n), //reset
	.pb_in(pb_in), //push button input
	.pb_debounced(pb_debounced) //debounced push button output
    );

one_pulse o0(
	.clk(clk),  //clock input
	.rst_n(rst_n),  //active low reset
	.in_trig(pb_debounced),  //input trigger
	.out_pulse(out_pulse)  //output one pulse
    );
	 
endmodule
