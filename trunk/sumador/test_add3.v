`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:06:38 03/30/2012
// Design Name:   full_add3
// Module Name:   D:/FPGA_MHPJPD/sumador/test_add3.v
// Project Name:  sumador
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: full_add3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_add3;

	// Inputs
	reg [2:0] a;
	reg [2:0] b;

	// Outputs
	wire [3:0] r;

	// Instantiate the Unit Under Test (UUT)
	full_add3 uut (
		.a(a), 
		.b(b), 
		.r(r)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		a = 3'b001;
		b = 3'b011;

		#100;
		
		a = 3'b011;
		b = 3'b010;        

		#100;
		
		a = 3'b111;
		b = 3'b111;

		#100;
		
		a = 3'b011;
		b = 3'b011;


	end
      
endmodule

