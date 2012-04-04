`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:43:33 03/30/2012 
// Design Name: 
// Module Name:    full_add 
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
module full_add(
    input a,
    input b,
    input c,
    output [1:0] r
    );
	
	assign r[0] = a ^ b ^ c;
	assign r[1] = a & b | b & c | a & c;

endmodule
