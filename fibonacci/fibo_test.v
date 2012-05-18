`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:52:12 05/18/2012
// Design Name:   fibo
// Module Name:   C:/Documents and Settings/jdarago/Escritorio/fibo/fibo_test.v
// Project Name:  fibo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fibo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fibo_test;

	// Inputs
	reg [7:0] n;
	reg clk;
	reg reset;
	reg start;

	// Outputs
	wire [7:0] fibo;
	wire finished;

	// Instantiate the Unit Under Test (UUT)
	fibo uut (
		.n(n), 
		.clk(clk),
		.reset(reset),
		.start(start),
		.fibo(fibo),
		.finished(finished)
	);

	localparam T = 20;
	always
	begin
		clk = 1'b1;
		#(T/2);
		clk = 1'b0;
		#(T/2);
	end

	initial begin
		// Initialize Inputs
		n = 0;
		clk = 0;
		reset = 1;
		start = 0;
	
		// Wait 100 ns for global reset to finish
		#100;
      reset = 0;
		// Add stimulus here
		n = 6;
		start = 1;
		
		#100;
		start = 0;
		#100;
	end
      
endmodule

