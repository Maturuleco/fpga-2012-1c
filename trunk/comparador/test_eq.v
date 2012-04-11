`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:37:44 03/28/2012
// Design Name:   eq
// Module Name:   D:/FPGA_MHPJPD/comparator/test_eq.v
// Project Name:  comparator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: eq
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_eq;

	// Inputs
	reg [1:0] ta;
	reg [1:0] tb;
//	reg tti1;
//	reg tti2;

	// Outputs
	wire tab;

	// Instantiate the Unit Under Test (UUT)
	eq_inferencia uut (
		.a(ta),
		.b(tb),
		.aeqb(tab)
	);
/*	eq uut2 (
		.i1(tti1), 
		.i2(tti2), 
		.eq(tteq)
	);
*/
	initial begin
		// Initialize Inputs
		ta = {0,0};
		tb = {0,0};
		
		#100;
		
		ta = {0,1};
		tb = {0,0};
		#100;

		ta = {0,0};
		tb = {1,0};
		#100;

		ta = {1,0};
		tb = {1,0};
		#100;

		ta = {1,1};
		tb = {1,1};
		#100;


	end
      
endmodule

