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
	reg [15:0] A;
	reg [15:0] B;
	reg clk;
	reg reset;

	// Outputs
	wire cout;
	wire [15:0] S;

	// Instantiate the Unit Under Test (UUT)
	pipe_adder_128 uut (
		.A(A), 
		.B(B), 
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
		
		A = 16'h0001;
		B = 16'hFFFF;

		#20;
       
		A = 16'h0002;
		B = 16'hFFFF;

		#20;

		A = 16'hFFFF;
		B = 16'h0001;

		#20;

		A = 16'hAAAA;
		B = 16'hAAAA;

		#20;
		
		A = 16'h0000;
		B = 16'h0000;

		#20;
	end
      
endmodule

