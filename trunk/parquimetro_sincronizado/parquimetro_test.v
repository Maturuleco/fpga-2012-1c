`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:43:55 04/27/2012
// Design Name:   parquimetro
// Module Name:   C:/Documents and Settings/jdarago/Escritorio/parquimetro/parquimetro_test.v
// Project Name:  parquimetro
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: parquimetro
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module parquimetro_test;

	// Inputs
	reg psensor;
	reg ssensor;
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] conteo;
	wire hubo_error;
	wire [2:0] state;

	// Instantiate the Unit Under Test (UUT)
	parquimetro uut (
		.psensor(psensor), 
		.ssensor(ssensor), 
		.clk(clk), 
		.reset(reset), 
		.conteo(conteo), 
		.hubo_error(hubo_error),
		.state(state)
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
		reset = 1;
		psensor = 0;
		ssensor = 0;
		
		// Wait 100 ns for global reset to finish
		#100;

		psensor = 1;
		ssensor = 0;
		clk = 0;
		reset = 0;

		#T
		
		psensor = 1;
		ssensor = 1;
		clk = 0;
		reset = 0;

		#T
		
		psensor = 1;
		ssensor = 0;
		clk = 0;
		reset = 0;

		#T
		
		psensor = 0;
		ssensor = 0;
		clk = 0;
		reset = 0;

		#T
		
		psensor = 1;
		ssensor = 0;
		clk = 0;
		reset = 0;

		#T
		
		psensor = 1;
		ssensor = 1;
		clk = 0;
		reset = 0;

		#T
		
		psensor = 1;
		ssensor = 0;
		clk = 0;
		reset = 0;

		#T
		
		psensor = 0;
		ssensor = 0;
		clk = 0;
		reset = 0;

		// Add stimulus here

	end
      
endmodule

