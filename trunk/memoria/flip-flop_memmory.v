`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:46:34 05/11/2012 
// Design Name: 
// Module Name:    flip-flop_memmory 
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
module flip-flop_memmory
#( parameter W=8, // number of bits in a word
	A=4 // number of address bits
)
(
   input clk,
	input wr_en,
   input[A-1:0] address,
   input[W-1:0] data_in,
	output[W-1:0] data_out
   );


endmodule
