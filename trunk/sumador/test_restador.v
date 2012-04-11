`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:29:03 04/04/2012
// Design Name:   restador
// Module Name:   D:/FPGA_MHPJPD/sumador/test_restador.v
// Project Name:  sumador
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: restador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_restador;

	// Inputs
	reg [2:0] a;
	reg [2:0] b;

	// Outputs
	wire [2:0] res;

	// Instantiate the Unit Under Test (UUT)
	restador uut (
		.a(a), 
		.b(b), 
		.res(res)
	);

	initial begin
		// Initialize Inputs
		a = 3'b101;
		b = 3'b100;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

