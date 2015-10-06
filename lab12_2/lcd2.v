////////////////////////////////////////////////////////////////////////
// Department of Computer Science
// National Tsing Hua University
// Project   : Design Gadgets for Hardware Lab
// Module    : lcd2 (top module)
// Author    : Chih-Tsun Huang
// E-mail    : cthuang@cs.nthu.edu.tw
// Revision  : 2
// Date      : 2011/04/13
module lcd2 (
  input              clk,
  input              rst_n,
  input sel0,sel1,sel_switch,
  input  wire [3:0]  col,
  output wire [3:0]  row,
  output             LCD_rst,
  output wire [1:0]  LCD_cs,
  output             LCD_rw,
  output             LCD_di,
  output wire [7:0]  LCD_data,
  output             LCD_en,
  output wire [15:0] key,
  output wire [15:0]light
);

  wire change,en,out_valid;
  wire [7:0] data_out;
  wire clk_div;

 /* keypad_scan K1 (
    .rst_n(rst_n),
    .clk(clk_div),
    .col(col),
    .row(row),
    .change(change),          // push and release
    .key()                 // mask {F,E,D,C,B,3,6,9,A,2,5,8,0,1,4,7}
  );
*/
	lab8_2(
	.clk(clk),
	.rst_n(rst_n),
	.sel0(sel0),
	.sel1(sel1),
	.sel_switch(sel_switch),
	//ftsd_ctl,
	//display,
	.light(light),
	.key(key)
    );

  RAM_ctrl R2 (
    .clk(clk_div),
    .rst_n(rst_n),
    .change(1'b1),
    .key(key),
    .en(en),
    .data_out(data_out),
    .data_valid(out_valid));

  lcd_ctrl d1 (
    .clk(clk_div),
    .rst_n(rst_n),
    .data(data_out),           // memory value  
    .data_valid(out_valid),    // if data_valid = 1 the data is valid
    .LCD_di(LCD_di),
    .LCD_rw(LCD_rw),
    .LCD_en(LCD_en),
    .LCD_rst(LCD_rst),
    .LCD_cs(LCD_cs),
    .LCD_data(LCD_data),
    .en_tran(en)
  );

  clock_divider #(
    .half_cycle(200),         // half cycle = 200 (divided by 400)
    .counter_width(8)         // counter width = 8 bits
  ) clk100K (
    .rst_n(rst_n),
    .clk(clk),
    .clk_div(clk_div)
  );

endmodule
