`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:21:43 04/11/2012 
// Design Name: 
// Module Name:    carry_lookahead 
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
module carry_lookahead(
    input [3:0] a,
    input [3:0] b,
    output [4:0] out//,
//	 output [3:0] g,
//	 output [3:0] p
    );

	wire [3:0] p;
	wire [3:0] g;
	wire [4:0] c;
	
	assign g = a & b;
	assign p = a ^ b;
	
	assign c[0] = 1'b0;
	assign c[1] = g[0] | (p[0] & c[0]);
	assign c[2] = g[1] | (p[1] & g[0]) | (p[1]&p[0]&c[0]);
	assign c[3] = g[2] | (p[2] & g[1]) | (p[2]&p[1]&g[0]) | (p[2]&p[1]&p[0]&c[0]);
	assign c[4] = g[3] | (p[3] & g[2]) | (p[3]&p[2]&g[1]) | (p[3]&p[2]&p[1]&g[0]) | (p[3]&p[2]&p[1]&p[0]&c[0]);

	assign out[3:0] = c[3:0] ^ p;
	assign out[4] = c[4];
	
endmodule
