`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:54:09 05/04/2012 
// Design Name: 
// Module Name:    banco_registros 
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
module banco_registros
#( parameter W=8, // number of bits in a word
	A=4 // number of address bits
)
(
   input clk,
	input wr_en,
   input[A-1:0] address_r,
   input[A-1:0] address_w,
   input[W-1:0] data_in,
	output[W-1:0] data_out1, data_out2
   );

	reg [W-1:0] array_reg [(2**A)-1:0];
	
	always@ (posedge clk)
	begin
		if ( wr_en )
			array_reg[address_w] <= data_in;
	end
	
	assign data_out1 = array_reg[address_w];
	assign data_out2 = array_reg[address_r];
	
endmodule
