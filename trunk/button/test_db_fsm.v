`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:05:36 05/11/2012
// Design Name:   db_fsm
// Module Name:   D:/FPGA_MHPJPD/button/test_db_fsm.v
// Project Name:  Cola_Fifo2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: db_fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_db_fsm;
localparam T=50;
	// Inputs
	reg clk;
	reg reset;
	reg sw;

	// Outputs
	wire db;
	wire [2:0] state_next;
	wire m_tick;

	// Instantiate the Unit Under Test (UUT)
	db_fsm#( .N(2) ) uut (
		.clk(clk), 
		.reset(reset), 
		.sw(sw), 
		.db(db),
		.state_next(state_next),
		.m_tick(m_tick)
	);
	always 
		begin
			clk = 1'b1;
			#(T/2);
			clk = 1'b0;
			#(T/2);
		end
	
	initial begin
		// Initialize Inputs
		reset = 1'b0;
		sw = 1'b0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1'b1;
		#100;
		reset = 1'b0;
      
		#100;
		
		  sw = 1'b1;
		  #5;
  		  sw = 1'b0;
		  #5;
		  sw = 1'b1;
		  #5;
		  sw = 1'b0;
		  #5;
		  sw = 1'b1;
		  #5;
  		  sw = 1'b0;
		  #5;
		  sw = 1'b1;
		  #5;
		  sw = 1'b0;
		  #5;
		  sw = 1'b1;
		  #5;
  		  sw = 1'b0;
		  #5;
		  sw = 1'b1;
		  #5;
		  sw = 1'b0;
		  #5;
		  sw = 1'b1;
		  #5;
  		  sw = 1'b0;
		  #5;
		  sw = 1'b1;
		  #5000;
		  sw = 1'b0;
		  #5;
		  sw = 1'b1;
		  #5;
  		  sw = 1'b0;
		  #5;
		  sw = 1'b1;
		  #5;
		  sw = 1'b0;
		  #5;
		  sw = 1'b1;
		  #5;
  		  sw = 1'b0;
		  #5;
		  sw = 1'b1;
		  #5;
		  sw = 1'b0;

	end
      
endmodule

