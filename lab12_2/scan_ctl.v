`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:34 08/13/2015 
// Design Name: 
// Module Name:    scan_ctl 
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
module scan_ctl(
	ftsd_ctl, // ftsd display control signal 
	ftsd_in, // output to ftsd display
	in0, // 1st input
	in1, // 2nd input
	in2, // 3rd input
	in3, // 4th input
	ftsd_ctl_en // divided clock for scan control
	);
	output reg [3:0] ftsd_in; // Binary data 
	output reg [3:0] ftsd_ctl; // scan control for 14-segment display(in the always block)
	input [3:0] in0,in1,in2,in3; // binary input control for the four digits 
	input [1:0] ftsd_ctl_en; // divided clock for scan control
	
	always @(ftsd_ctl_en)
		case (ftsd_ctl_en)
			2'b00:
				begin
				ftsd_ctl=4'b0111;
				ftsd_in=in0;
				end
			2'b01:
				begin
				ftsd_ctl=4'b1011;
				ftsd_in=in1;
				end	
			2'b10:
				begin
				ftsd_ctl=4'b1101;
				ftsd_in=in2;
				end
			2'b11:
				begin
				ftsd_ctl=4'b1110;
				ftsd_in=in3;
				end
			default:
				begin
				ftsd_ctl=4'b0000;
				ftsd_in=in0;
				end
		endcase
endmodule
