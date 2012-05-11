`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:43:28 04/13/2012
// Design Name:   sumador_sg_mag
// Module Name:   //dc3.ad.dc.uba.ar/RedirectedFolders06/mhperez/Desktop/FPGA/trunk/sumador/test_sumador_sg_mod.v
// Project Name:  sumador
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sumador_sg_mag
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_sumador_sg_mod;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire [3:0] res;
	wire sg;

	// Instantiate the Unit Under Test (UUT)
	sumador_sg_mag uut (
		.a(a), 
		.b(b), 
		.res(res), 
		.sg(sg)
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

	end
      
endmodule

