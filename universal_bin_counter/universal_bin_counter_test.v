`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:56:33 04/18/2012
// Design Name:   universal_bin_counter
// Module Name:   //dc3.ad.dc.uba.ar/RedirectedFolders06/mhperez/Desktop/FPGA/trunk/Display/universal_bin_counter/universal_bin_counter_test.v
// Project Name:  universal_bin_counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: universal_bin_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module universal_bin_counter_test;
	localparam T=20;
	
	// Inputs
	reg clk;
	reg en;
	reg up;
	reg [7:0] d;
	reg syn_clr;
	reg load;

	// Outputs
	wire max_tick;
	wire min_tick;
	wire [7:0] q;

	// Instantiate the Unit Under Test (UUT)
	universal_bin_counter uut (
		.clk(clk), 
		.en(en), 
		.up(up), 
		.d(d), 
		.syn_clr(syn_clr), 
		.load(load), 
		.max_tick(max_tick), 
		.min_tick(min_tick), 
		.q(q)
	);

// clock
 // 20 ns clock running forever
 always 
	begin
		clk = 1'b1;
		#(T/2);
		clk = 1'b0;
		#(T/2);
	end
 // reset for the first half cycle
 initial 
	 begin
		 reset = 1'b1;
		 #(T/2);
		 reset = 1'b0;
	 end
			
endmodule