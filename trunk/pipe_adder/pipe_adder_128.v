`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:02:15 05/16/2012 
// Design Name: 
// Module Name:    pipe_adder_128 
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
module pipe_adder_128
#(parameter H = 1 )
(
    input [H*4-1:0] A,
    input [H*4-1:0] B,
    output cout,
	 output tc1, tc2, tc0,
    output [H*4-1:0] S,
	 output [H-1:0] A1, A2, A3,
	 output [H-1:0] B1, B2, B3,

    input clk,
    input reset
    );

	wire [H-1:0] A0, B0;
	//wire [H-1:0] A1, A2, A3;
	//wire [H-1:0] B1, B2, B3;
	wire [H-1:0] S0, S1, S2, S3;
	
	assign A0 = A[H-1:0];
	assign B0 = B[H-1:0];
	
	reg cout0, cout1, cout2, cout3;
	wire cnext0, cnext1, cnext2, cnext3;
	assign tc0 = cout0;
	assign tc1 = cout1;
	assign tc2 = cout2;
	assign cout = cout3;

	always@ (posedge clk)
	begin
/*		if (reset)
		begin
			cout0 <= 1'b0;
			cout1 <= 1'b0;
			cout2 <= 1'b0;
		end
		else
		begin
*/			cout0 <= cnext0;
			cout1 <= cnext1;
			cout2 <= cnext2;
			cout3 <= cnext3;
//		end
	end
/*
	adder_32 sumador0 ( .clk(clk), .sclr(reset), .c_in(1'b0),  .a(A0), .b(B0), .s(S0), .c_out(cnext0) );
	adder_32 sumador1 ( .clk(clk), .sclr(reset), .c_in(cout0), .a(A1), .b(B1), .s(S1), .c_out(cnext1) );
	adder_32 sumador2 ( .clk(clk), .sclr(reset), .c_in(cout1), .a(A2), .b(B2), .s(S2), .c_out(cnext2) );
	adder_32 sumador3 ( .clk(clk), .sclr(reset), .c_in(cout2), .a(A3), .b(B3), .s(S3), .c_out(cout) );
*/
	adder #(.W(H)) sumador0 ( .cin(1'b0),  .A(A0), .B(B0), .S(S0), .cout(cnext0) );
	adder #(.W(H)) sumador1 ( .cin(cout0), .A(A1), .B(B1), .S(S1), .cout(cnext1) );
	adder #(.W(H)) sumador2 ( .cin(cout1), .A(A2), .B(B2), .S(S2), .cout(cnext2) );
	adder #(.W(H)) sumador3 ( .cin(cout2), .A(A3), .B(B3), .S(S3), .cout(cnext3) );
	
	double_pipe_mem #(.H(2), .W(H)) pipe_in1 ( .clk(clk), .reset(reset), .a(A[((2*H)-1):H]),   .b(B[((2*H)-1):H]),   .a_out(A1), .b_out(B1) );
	double_pipe_mem #(.H(3), .W(H)) pipe_in2 ( .clk(clk), .reset(reset), .a(A[((3*H)-1):(2*H)]), .b(B[((3*H)-1):(2*H)]), .a_out(A2), .b_out(B2) );
	double_pipe_mem #(.H(4), .W(H)) pipe_in3 ( .clk(clk), .reset(reset), .a(A[((4*H)-1):(3*H)]), .b(B[((4*H)-1):(3*H)]), .a_out(A3), .b_out(B3) );
	
	pipe_mem #(.H(4), .W(H)) pipe_out0 ( .clk(clk), .reset(reset), .in(S0), .out(S[(H-1):0]) );
	pipe_mem #(.H(3), .W(H)) pipe_out1 ( .clk(clk), .reset(reset), .in(S1), .out(S[((2*H)-1):H]) );
	pipe_mem #(.H(2), .W(H)) pipe_out2 ( .clk(clk), .reset(reset), .in(S2), .out(S[((3*H)-1):(2*H)]) );
	pipe_mem #(.H(1), .W(H)) pipe_out3 ( .clk(clk), .reset(reset), .in(S3), .out(S[((4*H)-1):(3*H)]) );
	
endmodule
