`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:12:00 09/19/2015 
// Design Name: 
// Module Name:    countdown 
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
module countdown(
	min1,
	min0,
	sec1,
	sec0,
	in_min1,
	in_min0,
	in_sec1,
	in_sec0,
	clk_out,
	rst_n,
	switch,
	alu
    );
input [3:0] in_min1,in_min0,in_sec1,in_sec0;
input clk_out,rst_n,switch;
input [1:0] alu;

output reg[3:0] min1,min0,sec1,sec0;

reg [3:0] min1_tmp,min0_tmp,sec1_tmp,sec0_tmp;


always @(*)
if(alu==2'b00 || switch==1'b1) begin
min1_tmp=min1;
min0_tmp=min0;
sec1_tmp=sec1;
sec0_tmp=sec0;  end

else begin
	if(min1==0&&min0==0&&sec1==0&&sec0==0)begin
		min1_tmp=0;
		min0_tmp=0;
		sec1_tmp=0;
		sec0_tmp=0;
		end	
	else if(min0!=0&&sec1==0&&sec0==0)begin
		min0_tmp=min0-1'b1;
		sec1_tmp=4'd5;
		sec0_tmp=4'd9; 
		end
	else if(min0!=0&&sec1!=0&&sec0==0)begin
		min0_tmp=min0;
		sec1_tmp=sec1-1'b1;
		sec0_tmp=4'd9; 
		end
	else if(min0==0&&sec1!=0&&sec0==0)begin
		min0_tmp=min0;
		sec1_tmp=sec1-1'b1;
		sec0_tmp=4'd9; 
		end
	else  begin
		min0_tmp=min0;
		sec1_tmp=sec1;
		sec0_tmp=sec0-1'b1;	
	end
		end


always@(posedge clk_out or negedge rst_n)

if (~rst_n)  begin
min1<=in_min1;	
min0<=in_min0;	
sec1<=in_sec1;	
sec0<=in_sec0;  end

else begin
min1<=min1_tmp;	
min0<=min0_tmp;	
sec1<=sec1_tmp;	
sec0<=sec0_tmp;  end


endmodule
