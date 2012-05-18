`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:42:34 05/16/2012
// Design Name:   pipe_mem
// Module Name:   D:/FPGA_MHPJPD/pipeline_128_adder/test_pipe_mem.v
// Project Name:  128_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipe_mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_pipe_mem;
localparam T=20;
	// Inputs
	reg [31:0] in;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	pipe_mem #(.H(1), .W(32)) uut (
		.in(in), 
		.out(out), 
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
		
		in = 'hFFFFFFFF;
		#20;
      in = 'hAAAAFFFF;
		#20;
		in = 'h0000FFFF;
		#20;
		in = 'h0000AAAA;
		#20;
		

	end
      
endmodule

