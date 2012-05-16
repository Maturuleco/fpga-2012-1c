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
module sp_banco_registros
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

	reg [W-1:0] array_reg [(2**A)-1:0];
	
	always@ (posedge clk)
	begin
		if ( wr_en )
			array_reg[address] <= data_in;
	end
	
	assign data_out1 = array_reg[address];
	assign data_out2 = array_reg[address];
	
endmodule
