`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:24:18 08/21/2015 
// Design Name: 
// Module Name:    one_pulse 
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
module one_pulse(
	clk,  //clock input
	rst_n,  //active low reset
	in_trig,  //input trigger
	out_pulse  //output one pulse
    );

//declare I/Os
input clk;     //clock input
input rst_n;   //active low reset
input in_trig;  //input trigger
output out_pulse; //output one pulse
reg out_pulse;   //output one pulse

//declare internal nodes
reg in_trig_delay;

//buffer input
always@(posedge clk or negedge rst_n)
if(~rst_n)
	in_trig_delay<=1'b0;
else
	in_trig_delay<=in_trig;
	
//pulse generation
assign out_pulse_next=in_trig&(~in_trig_delay);

always@(posedge clk or negedge rst_n)
if(~rst_n)
	out_pulse<=1'b0;
else
	out_pulse<=out_pulse_next;

endmodule
