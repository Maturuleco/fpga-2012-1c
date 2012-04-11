`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:47:17 03/30/2012 
// Design Name: 
// Module Name:    eq2 
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
module eq2(
    input [1:0] a,
    input [1:0] b,
    output wire aeqb
    );

	wire eq0, eq1;
	
	eq eq_bit0 ( .i1(a[0]), .i2(b[0]), .eq(eq0) );
	eq eq_bit1 ( .i1(a[1]), .i2(b[1]), .eq(eq1) );
	
	assign aeqb = eq0 & eq1;
	
endmodule
