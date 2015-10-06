////////////////////////////////////////////////////////////////////////
// Department of Computer Science
// National Tsing Hua University
// Project   : Design Gadgets for Hardware Lab
// Module    : clock_divider
// Author    : Chih-Tsun Huang
// E-mail    : cthuang@cs.nthu.edu.tw
// Revision  : 2
// Date      : 2011/04/13
// Abstract  :
//   Clock divider:
//     Input:  a clock source
//     Output: 
//       a parameterized clock divided by 2 * HALF_CYCLE
//       Ex:
//       for HALF_CYCLE = 10,000,
//         input clock of 40MHz, output clock is 2KHz (40MHz/(2 * 10,000) = 2KHz)
//       for HALF_CYCLE = 500,
//         input clock of 2KHz, output clock is 2Hz
//       for HALF_CYCLE = 10,
//         input clock of 2KHz, output clock is 100Hz
//
module clock_divider (
  input wire rst_n,
  input wire clk,
  output reg clk_div
);

  parameter counter_width = 14;
  parameter half_cycle = 10000; // to generate a half clock period of 10000 cycles

  // internal signals
  reg [counter_width - 1:0] count, count_next;
  reg clk_div_next;

  always @* begin
    if (count == (half_cycle - 1)) begin
      count_next <= 0;
      clk_div_next <= ~clk_div;
    end else begin
      count_next <= count + 1'b1;
      clk_div_next <= clk_div;
    end
  end
  
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      count = 0;
      clk_div = 0;
    end else begin
      count = count_next;
      clk_div = clk_div_next;
    end
  end

endmodule
