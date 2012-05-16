`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:09:50 05/16/2012 
// Design Name: 
// Module Name:    double_pipe_mem 
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
module double_pipe_mem
#( parameter H = 3,
	W = 32
)
(
	input clk, reset,
	input [W-1:0] a,
	input [W-1:0] b,
	output [W-1:0] a_out,
	output [W-1:0] b_out
	);

	pipe_mem #(.H(H), .W(W) ) a_pipe ( .clk(clk), .reset(reset), .in(a), .out(a_out) );
	pipe_mem #(.H(H), .W(W) ) b_pipe ( .clk(clk), .reset(reset), .in(b), .out(b_out) );

endmodule
