`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:24:13 03/30/2012 
// Design Name: 
// Module Name:    eq_inferencia 
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
module eq_inferencia(
	input wire [1:0] a,b,
	output reg aeqb
    );
	 
always @*
		if ( a==b)
			aeqb = 1'b 1;
		else
			aeqb = 1'b 0;

endmodule
