`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:48:31 03/30/2012 
// Design Name: 
// Module Name:    full_add3 
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
module full_add3(
    input [2:0] a,
    input [2:0] b,
    output [3:0] r
    );
	 wire c1, c2;

	full_add fa_0 (.a(a[0]), .b(b[0]), .c(1'b0), .r( {c1,r[0]} ) );
	full_add fa_1 (.a(a[1]), .b(b[1]), .c(c1), .r( {c2,r[1]} ) );
	full_add fa_2 (.a(a[2]), .b(b[2]), .c(c2), .r( {r[3],r[2]} ) );
	
endmodule
