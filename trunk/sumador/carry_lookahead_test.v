`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:20:22 04/11/2012
// Design Name:   carry_lookahead
// Module Name:   D:/FPGA_MHPJPD/sumador/carry_lookahead_test.v
// Project Name:  sumador
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: carry_lookahead
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module carry_lookahead_test;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire [4:0] out;

	// Instantiate the Unit Under Test (UUT)
	carry_lookahead uut (
		.a(a), 
		.b(b), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
      

		// Add stimulus here

	end
      
endmodule

