`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:39:42 05/09/2012
// Design Name:   test_fifo
// Module Name:   D:/FPGA_MHPJPD/Cola_Fifo2/test_posta.v
// Project Name:  Cola_Fifo2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: test_fifo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_posta;
localparam T=20;
	// Inputs
	reg clk;
	reg reset;
	reg rd;
	reg wr;
	reg [2:0] sw;

	// Outputs
	wire [2:0] salida;
	wire full;
	wire empty;
	wire error;
	wire [1:0] fruta;
	wire [1:0]w_ptr_reg;
	wire [1:0]r_ptr_reg;
	wire push;
	wire pop;

	// Instantiate the Unit Under Test (UUT)
	test_fifo uut (
		.clk(clk), 
		.reset(reset), 
		.wr(wr), 
		.rd(rd), 
		.sw(sw), 
		.led({full, empty, error, fruta, salida}),
		.r_ptr_reg(r_ptr_reg),
		.w_ptr_reg(w_ptr_reg),
		.pop(pop),
		.push(push)
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
		initial begin
		reset = 1'b0;
			#(T/2);
		reset = 1'b1;
			#(T/2);
		reset = 1'b0;

		// Initialize Inputs
		wr	= 1'b0;
		rd	= 1'b0;
		sw		= 2'b00;
		#900;
		
		//PUSH
		wr	= 1'b1;
		rd	= 1'b0;
		sw		= 2'b00;
		#900;

		wr	= 1'b0;
		rd	= 1'b0;
		sw		= 2'b00;
		#900;

		//PUSH
		wr	= 1'b1;
		rd	= 1'b0;
		sw		= 2'b01;
		#900;

		wr	= 1'b0;
		rd	= 1'b0;
		sw		= 2'b00;
		#900;
		
		//PUSH
		wr	= 1'b1;
		rd	= 1'b0;
		sw		= 2'b10;
		#900;

		wr	= 1'b0;
		rd	= 1'b0;
		sw		= 2'b00;
		#900;
		
		//PUSH
		wr	= 1'b1;
		rd	= 1'b0;
		sw		= 2'b11;
		#900;

		wr	= 1'b0;
		rd	= 1'b0;
		sw		= 2'b00;
		#900;
		
		//POP
		wr	= 1'b0;
		rd = 1'b1;
		sw		= 2'b01;
		#900;

		wr	= 1'b0;
		rd	= 1'b0;
		sw		= 2'b01;
		#900;
		
		//PUSH
		wr	= 1'b1;
		rd	= 1'b0;
		sw		= 2'b10;
		#900;

		wr	= 1'b0;
		rd	= 1'b0;
		sw		= 2'b01;
		#900;
		
		//POP
		wr	= 1'b0;
		rd	= 1'b1;
		sw		= 2'b11;
		#900;
	
		wr	= 1'b0;
		rd	= 1'b0;
		sw		= 2'b11;
		#900;

	end
      
endmodule

