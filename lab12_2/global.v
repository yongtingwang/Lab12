`timescale 1ns / 1ps
//************************************************************************
// Filename      : global.v
// Author        : Hsi-Pin Ma
// Function      : global definition or parameters for the project
// Last Modified : Date: 2012-04-02
// Revision      : Revision: 1
// Copyright (c), Laboratory for Reliable Computing (LaRC), EE, NTHU
// All rights reserved
//************************************************************************
// Frequency divider
`define FREQ_DIV_BIT 25 // If old board set to 24, new board 25
`define FTSD_SCAN_CTL_BIT_WIDTH 2 // scan control bit with for 14-segment display

// Counter
`define CNT_BIT_WIDTH 4 //number of bits for the counter

// Clock Generator
`define DIV_BY_20M 20_000_000
`define DIV_BY_20M_BIT_WIDTH 25
`define DIV_BY_200K 200_000
`define DIV_BY_200K_BIT_WIDTH 18
// FSM
`define stop  2'b00
`define start 2'b01
`define lap   2'b10

// 14-segment display
`define FTSD_BIT_WIDTH 15 // 14-segment display control
`define FTSD_NUM 4 //number of 14-segment display
`define BCD_BIT_WIDTH 4 // BCD bit width
`define FTSD_ZERO  `FTSD_BIT_WIDTH'b0000_0011_1111_111 //0
`define FTSD_ONE   `FTSD_BIT_WIDTH'b1111_1111_1011_011 //1
`define FTSD_TWO   `FTSD_BIT_WIDTH'b0010_0100_1111_111 //2
`define FTSD_THREE `FTSD_BIT_WIDTH'b0000_1100_1111_111 //3
`define FTSD_FOUR  `FTSD_BIT_WIDTH'b1001_1000_1111_111 //4
`define FTSD_FIVE  `FTSD_BIT_WIDTH'b0100_1000_1111_111 //5
`define FTSD_SIX   `FTSD_BIT_WIDTH'b0100_0000_1111_111 //6
`define FTSD_SEVEN `FTSD_BIT_WIDTH'b0001_1111_1111_111 //7
`define FTSD_EIGHT `FTSD_BIT_WIDTH'b0000_0000_1111_111 //8
`define FTSD_NINE  `FTSD_BIT_WIDTH'b0000_1000_1111_111 //9
`define FTSD_A     `FTSD_BIT_WIDTH'b0001_0000_1111_111 //a
`define FTSD_B     `FTSD_BIT_WIDTH'b1110_0001_1111_011 //b
`define FTSD_C     `FTSD_BIT_WIDTH'b0110_0011_1111_111 //c
`define FTSD_D     `FTSD_BIT_WIDTH'b1000_0100_1111_111 //d
`define FTSD_E     `FTSD_BIT_WIDTH'b0110_0000_1111_111 //e
`define FTSD_F     `FTSD_BIT_WIDTH'b0111_0000_1111_111 //f
`define FTSD_DEF   `FTSD_BIT_WIDTH'b1111_1111_1111_111 //default

// Keypad scan
`define KEYPAD_ROW_WIDTH 4  // Row width of keypad
`define KEYPAD_COL_WIDTH 4  // column width of keypad
`define KEYPAD_DEC_WIDTH 8  // keypad decoding bits (row+col)
`define KEY_0  4'd0 // key '0'
`define KEY_1  4'd1 // key '1'
`define KEY_2  4'd2 // key '2'
`define KEY_3  4'd3 // key '3'
`define KEY_4  4'd4 // key '4'
`define KEY_5  4'd5 // key '5'
`define KEY_6  4'd6 // key '6'
`define KEY_7  4'd7 // key '7'
`define KEY_8  4'd8 // key '`KEYPAD_DEC_WIDTH'
`define KEY_9  4'd9 // key '9'
`define KEY_A  4'd10 // key 'A'
`define KEY_B  4'd11 // key 'B'
`define KEY_C  4'd12 // key 'C'
`define KEY_D  4'd13 // key 'D'
`define KEY_E  4'd14 // key 'E'
`define KEY_F  4'd15 // key 'F'
`define KEYPAD_PRESSED 1'b1 // key pressed indicator
`define KEYPAD_NOT_PRESSED 1'b0 // key not pressed indicator
`define SCAN 1'b1 // Scan state of the keypad readout
`define PAUSE 1'b0 // pause state of the keypad readout
`define KEYPAD_PAUSE_PERIOD_BIT_WIDTH 4 // bit width of the keypad pause period



// BCD counter
`define BCD_BIT_WIDTH 4 // BCD bit width 
`define ENABLED 1 // ENABLE indicator
`define DISABLED 0 // EIDABLE indicator
`define INCREMENT 1'b1 // increase by 1
`define BCD_ZERO 4'd0 // 1 for BCD
`define BCD_ONE 4'd1 // 1 for BCD
`define BCD_TWO 4'd2 // 2 for BCD
`define BCD_THREE 4'd3 // 2 for BCD
`define BCD_FOUR 4'd4 // 2 for BCD
`define BCD_FIVE 4'd5 // 5 for BCD
`define BCD_SIX 4'd6 // 2 for BCD
`define BCD_SEVEN 4'd7 // 2 for BCD
`define BCD_EIGHT 4'd8 // 2 for BCD
`define BCD_NINE 4'd9 // 9 for BCD
`define BCD_DEF 4'd15 // all 1


//LCD words
`define LCD_NONE 256'h0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000
`define LCD_1 256'h0000_0000_03c0_03c0_0fc0_0fc0_03c0_03c0_03c0_03c0_03c0_03c0_3ffc_3ffc_0000_0000
`define LCD_2 256'h0000_0000_0ff0_0ff0_3c3c_3c3c_00f0_00f0_03c0_03c0_0f00_0f00_3ffc_3ffc_0000_0000
`define LCD_3 256'h0000_0000_3ffc_3ffc_00f0_00f0_03c0_03c0_00f0_00f0_3c3c_3c3c_0ff0_0ff0_0000_0000
`define LCD_4 256'h0000_0000_00f0_00f0_03f0_03f0_0ff0_0ff0_3cf0_3cf0_3ffc_3ffc_00f0_00f0_0000_0000
`define LCD_5 256'h0000_0000_3ffc_3ffc_3c00_3c00_3ff0_3ff0_003c_003c_3c3c_3c3c_0ff0_0ff0_0000_0000
`define LCD_6 256'h0000_0000_0ff0_0ff0_3c00_3c00_3ff0_3ff0_3c3c_3c3c_3c3c_3c3c_0ff0_0ff0_0000_0000
`define LCD_7 256'h0000_0000_3ffc_3ffc_003c_003c_00f0_00f0_03c0_03c0_0f00_0f00_0f00_0f00_0000_0000
`define LCD_8 256'h0000_0000_0ff0_0ff0_3c3c_3c3c_0ff0_0ff0_3c3c_3c3c_3c3c_3c3c_0ff0_0ff0_0000_0000
`define LCD_9 256'h0000_0000_0ff0_0ff0_3c3c_3c3c_0ffc_0ffc_003c_003c_00f0_00f0_0fc0_0fc0_0000_0000
`define LCD_0 256'h0000_0000_0ff0_0ff0_3c3c_3c3c_3cfc_3cfc_3f3c_3f3c_3c3c_3c3c_0ff0_0ff0_0000_0000
`define LCD_A 256'h0000_0000_03c0_03c0_0ff0_0ff0_3c3c_3c3c_3c3c_3c3c_3ffc_3ffc_3c3c_3c3c_0000_0000
`define LCD_B 256'h0000_0000_3ff0_3ff0_3c3c_3c3c_3ff0_3ff0_3c3c_3c3c_3c3c_3c3c_3ff0_3ff0_0000_0000
`define LCD_C 256'h0000_0000_0ff0_0ff0_3c3c_3c3c_3c00_3c00_3c00_3c00_3c3c_3c3c_0ff0_0ff0_0000_0000
`define LCD_D 256'h0000_0000_3fc0_3fc0_3cf0_3cf0_3c3c_3c3c_3c3c_3c3c_3cf0_3cf0_3fc0_3fc0_0000_0000
`define LCD_E 256'h0000_0000_3ffc_3ffc_3c00_3c00_3ff0_3ff0_3c00_3c00_3c00_3c00_3ffc_3ffc_0000_0000
`define LCD_F 256'h0000_0000_3ffc_3ffc_3c00_3c00_3ff0_3ff0_3c00_3c00_3c00_3c00_3c00_3c00_0000_0000
`define LCD_G 256'h0000_0000_0ffc_0ffc_3c00_3c00_3c00_3c00_3cfc_3cfc_3c3c_3c3c_0ffc_0ffc_0000_0000
`define LCD_H 256'h0000_0000_3c3c_3c3c_3c3c_3c3c_3ffc_3ffc_3c3c_3c3c_3c3c_3c3c_3c3c_3c3c_0000_0000
`define LCD_I 256'h0000_0000_3ffc_3ffc_03c0_03c0_03c0_03c0_03c0_03c0_03c0_03c0_3ffc_3ffc_0000_0000
`define LCD_J 256'h0000_0000_00fc_00fc_003c_003c_003c_003c_003c_003c_3c3c_3c3c_0ff0_0ff0_0000_0000
`define LCD_K 256'h0000_0000_3c3c_3c3c_3cf0_3cf0_3fc0_3fc0_3fc0_3fc0_3cd0_3cf0_3c3c_3c3c_0000_0000
`define LCD_L 256'h0000_0000_3c00_3c00_3c00_3c00_3c00_3c00_3c00_3c00_3c00_3c00_3ffc_3ffc_0000_0000
`define LCD_M 256'h0000_0000_781e_781e_7e7e_7e7e_7ffe_7ffe_799e_799e_781e_781e_781e_781e_0000_0000
`define LCD_N 256'h0000_0000_3c3c_3c3c_3f3c_3f3c_3ffc_3ffc_3ffc_3ffc_3cfc_3cfc_3c3c_3c3c_0000_0000
`define LCD_O 256'h0000_0000_0ff0_0ff0_3c3c_3c3c_3c3c_3c3c_3c3c_3c3c_3c3c_3c3c_0ff0_0ff0_0000_0000
`define LCD_P 256'h0000_0000_3ff0_3ff0_3c3c_3c3c_3c3c_3c3c_3ff0_3ff0_3c00_3c00_3c00_3c00_0000_0000