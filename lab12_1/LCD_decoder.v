`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:28 10/04/2015 
// Design Name: 
// Module Name:    LCD_decoder 
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

module LCD_decoder(
output reg [255:0]mark,
input [3:0]bcd
    );
always @*
	case(bcd)
	
    `BCD_BIT_WIDTH'd0: mark = `LCD_0;
	 `BCD_BIT_WIDTH'd1: mark = `LCD_1;
	 `BCD_BIT_WIDTH'd2: mark = `LCD_2;
	 `BCD_BIT_WIDTH'd3: mark = `LCD_3;
	 `BCD_BIT_WIDTH'd4: mark = `LCD_4;
	 `BCD_BIT_WIDTH'd5: mark = `LCD_5;
	 `BCD_BIT_WIDTH'd6: mark = `LCD_6;
	 `BCD_BIT_WIDTH'd7: mark = `LCD_7;
	 `BCD_BIT_WIDTH'd8: mark = `LCD_8;
	 `BCD_BIT_WIDTH'd9: mark = `LCD_9;
	 `BCD_BIT_WIDTH'd10: mark = `LCD_A;
	 `BCD_BIT_WIDTH'd11: mark = `LCD_P;//P
	 `BCD_BIT_WIDTH'd12: mark = `LCD_C;
	 `BCD_BIT_WIDTH'd13: mark = `LCD_D;
	 `BCD_BIT_WIDTH'd14: mark = `LCD_E;
	 `BCD_BIT_WIDTH'd15: mark = `LCD_M;//M
	 default: mark = `LCD_NONE;
  endcase

endmodule

