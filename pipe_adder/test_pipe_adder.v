`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:43:44 05/16/2012
// Design Name:   pipe_adder_128
// Module Name:   D:/FPGA_MHPJPD/pipeline_128_adder/test_pipe_adder.v
// Project Name:  128_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipe_adder_128
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_pipe_adder;
localparam T=20;
	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg clk;
	reg reset;

	// Outputs
	wire cout;
	wire [3:0] S;

	wire A1, A2, A3;
	wire B1, B2, B3;
	wire tc0, tc1, tc2;

	// Instantiate the Unit Under Test (UUT)
	pipe_adder_128 uut (
		.A(A), 
		.B(B),
		.A1(A1), .A2(A2), .A3(A3), 
		.B1(B1), .B2(B2), .B3(B3), 
		.tc0(tc0), .tc1(tc1), .tc2(tc2),
		.cout(cout), 
		.S(S), 
		.clk(clk), 
		.reset(reset)
	);

	// clock
		// 20 ns clock running forever
		always 
		begin
			clk = 1'b1;
			#(T/2);
			clk = 1'b0;
			#(T/2);
		end
		// reset for the first half cycle
	initial begin
		reset = 1'b0;
			#(T/2);
		reset = 1'b1;
			#(T/2);
		reset = 1'b0;
		
		A = 4'b1111;
		B = 4'b1111;

		#20;
       
		A = 4'b0000;
		B = 4'b0000;

		#20;

		A = 4'b0000;
		B = 4'b0000;

		#20;

		A = 4'b0000;
		B = 4'b0000;

		#20;
		
		A = 4'b0000;
		B = 4'b0000;

		#20;
		
		A = 4'b0000;
		B = 4'b0000;

	end
      
endmodule

