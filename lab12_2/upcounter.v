`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:48 04/26/2012 
// Design Name: 
// Module Name:    upcounter 
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
module upcounter(
value, // counter value
carry_out, // carryout to enable counting for next stage
clk, // global clock
rst_n, // active low reset
carry_in, // carry_in to enable counting
load_default, // enable load default value
def_value // default value for counter
);
// outputs
output [`BCD_BIT_WIDTH-1:0] value; // counter value
output carry_out; // carryout to enable counting for next stag
// inputs
input clk; // global clock
input rst_n; // active low reset
input load_default; // enable load default value
input carry_in; // carry_in to enable counting
input [`BCD_BIT_WIDTH-1:0] def_value; // counter upper limit
reg [`BCD_BIT_WIDTH-1:0] value; // output (in always block)
reg [`BCD_BIT_WIDTH-1:0] value_tmp; // input to dff (in always block)
reg carry_out; // carry out indicator for counter to next stage

// combinational part for BCD counter
always @(value or carry_in or load_default or def_value)
if(load_default==`ENABLED)
value_tmp = def_value;
else if (carry_in==`DISABLED)
value_tmp = value;
else if ((carry_in==`ENABLED)&&(value == `BCD_NINE))
value_tmp = `BCD_ZERO;
else
value_tmp = value + `INCREMENT;
always @(value or carry_in or load_default)
if ((carry_in==`ENABLED)&&((value == `BCD_NINE)||
(load_default==`ENABLED)))
carry_out = `ENABLED;
else
carry_out = `DISABLED;
// register part for BCD counter
always @(posedge clk or negedge rst_n)
if (~rst_n) value <= def_value;
else value <= value_tmp;

endmodule
