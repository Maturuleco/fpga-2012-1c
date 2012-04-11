`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:24:30 04/04/2012
// Design Name:   sumador_adivino
// Module Name:   D:/FPGA_MHPJPD/sumador/test_sumador_adivino.v
// Project Name:  sumador
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sumador_adivino
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_sumador_adivino;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire [4:0] res;

	// Instantiate the Unit Under Test (UUT)
	sumador_adivino uut (
		.a(a), 
		.b(b), 
		.res(res)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;

		a = 4'b0100;
		b = 4'b0101;
		#100;

		a = 4'b0100;
		b = 4'b0111;
		#100;

		a = 4'b0100;
		b = 4'b1011;
		#100;

		a = 4'b0011;
		b = 4'b1111;
		#100;

		a = 4'b1100;
		b = 4'b1011;
		#100;

		// Add stimulus here

	end
      
endmodule

