`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:17:57 05/09/2012
// Design Name:   button_regulator
// Module Name:   D:/FPGA_MHPJPD/button/test_button_regulator.v
// Project Name:  Cola_Fifo2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: button_regulator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_button_regulator;
localparam T=20;

	// Inputs
	reg bt_in;
	reg clk;
	reg reset;

	// Outputs
	wire bt_out;

	// Instantiate the Unit Under Test (UUT)
	button_regulator uut (
		.bt_in(bt_in), 
		.clk(clk),
		.reset(reset),
		.bt_out(bt_out)
	);

		always 
		begin
			clk = 1'b1;
			#(T/2);
			clk = 1'b0;
			#(T/2);
		end
		
		initial begin
		
		reset = 1'b0;
		#(T);
		reset = 1'b1;
		#(T);
		reset = 1'b0;
		
		#(T/2);
		bt_in = 1'b0;
		#100;

		bt_in = 1'b1;
		#100;

		bt_in = 1'b0;
		#100;

		bt_in = 1'b1;
		#100;
        

	end
      
endmodule

