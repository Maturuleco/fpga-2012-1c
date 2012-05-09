`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:04:28 05/09/2012 
// Design Name: 
// Module Name:    button_regulator 
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
module button_regulator(
	input bt_in,
	input clk,
	output bt_out
	);

	reg bt_reg;
	reg bt_next;

	always@ (posedge clk)
	begin
		bt_reg <= bt_next;
		bt_next <= bt_in;
	end

	assign bt_out  = bt_in && ~bt_reg;

endmodule
