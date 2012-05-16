`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:30:23 05/09/2012
// Design Name:   onoff_fsm
// Module Name:   C:/Documents and Settings/jdarago/Escritorio/fifo/test_onoff.v
// Project Name:  fifo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: onoff_fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_onoff;

	// Inputs
	reg clk;
	reg reset;
	reg sw;
	wire state_reg,state_next;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	onoff_fsm uut (
		.clk(clk), 
		.reset(reset), 
		.sw(sw), 
		.out(out)
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
		sw = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
      sw = 1;
		
		#100
		sw = 1;
		
		#100
		sw = 0;
		
		#100
		sw = 1;
		// Add stimulus here

	end
      
endmodule

