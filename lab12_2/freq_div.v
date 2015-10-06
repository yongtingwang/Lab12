`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:04 08/13/2015 
// Design Name: 
// Module Name:    freq_div 
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
module freq_div(
  clk_out, // divided clock output
  clk_ctl, // divided clock for seven-segment display scan
  clk, // clock from the crystal
  rst_n, // low active reset
  clk_100 // generated 100 Hz clock
);
output clk_100;
output clk_out; // divided clock output
output [`FTSD_SCAN_CTL_BIT_WIDTH-1:0] clk_ctl; // divided clock for seven-segment display scan
input clk; // clock from the crystal
input rst_n; // low active reset

reg clk_100;
reg clk_100_next;
reg [`DIV_BY_200K_BIT_WIDTH-1:0] count_200K,count_200K_next;
reg clk_out; // divided clock output (in the always block)
reg [`FTSD_SCAN_CTL_BIT_WIDTH-1:0] clk_ctl; // divided clock for seven-segment display scan (in the always block)
reg [14:0] cnt_l; // temperatory buffer
reg [6:0] cnt_h; // temperatory buffer
reg [`FREQ_DIV_BIT-1:0] cnt_tmp; // input node to flip flops

// Combinational block : increase by 1 neglecting overflow
always @(clk_out or cnt_h or cnt_l or clk_ctl)
  cnt_tmp = {clk_out,cnt_h,clk_ctl,cnt_l} + `INCREMENT;

// Sequential block 
always @(posedge clk or negedge rst_n) 
  if (~rst_n) 
	 {clk_out,cnt_h,clk_ctl,cnt_l} <= `FREQ_DIV_BIT'b0; 
  else 
    {clk_out,cnt_h,clk_ctl,cnt_l} <= cnt_tmp;
	 
	 
always@(*)
	if(count_200K==`DIV_BY_200K-1) begin
		count_200K_next=`DIV_BY_200K_BIT_WIDTH'd0;
		clk_100_next=~clk_100; end
	else begin
		count_200K_next=count_200K+1'b1;
		clk_100_next=clk_100; end

always@(posedge clk or negedge rst_n)
	if(~rst_n) begin
		count_200K<=`DIV_BY_200K_BIT_WIDTH'b0;
		clk_100<=1'b0; end
	else begin
		count_200K<=count_200K_next;
		clk_100<=clk_100_next; end
		
	 

	 endmodule