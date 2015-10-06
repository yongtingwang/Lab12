`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:59:50 08/21/2015 
// Design Name: 
// Module Name:    debounce 
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
module debounce(
	clk_100, //clock control
	rst_n, //reset
	pb_in, //push button input
	pb_debounced //debounced push button output
    );
//declar the I/Os
input clk_100;
input rst_n;
input pb_in;
output pb_debounced;
reg pb_debounced;

//declare that interal nodes
reg [3:0] debounce_window; //shift register flip flop
reg pb_debounced_next; //debounce result

//shift register
always@(posedge clk_100 or negedge rst_n)
if(~rst_n)
	debounce_window<=4'd0;
else
	debounce_window<={debounce_window[2:0],~pb_in};

//debounce circuit
always@(*)
if(debounce_window==4'd1111)
	pb_debounced_next=1'b1;
else
	pb_debounced_next=1'b0;

always@(posedge clk_100 or negedge rst_n)
if(~rst_n)
	pb_debounced<=1'b0;
else
	pb_debounced<=pb_debounced_next;



endmodule
