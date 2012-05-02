`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:08:34 04/27/2012
// Design Name:   parkimetro_io
// Module Name:   D:/FPGA_MHPJPD/parkimetro/test_parkimetro_io.v
// Project Name:  parkimetro
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: parkimetro_io
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_parkimetro_io;
	localparam T=20;
	// Inputs
	reg clk;
	reg reset;
	reg a;
	reg b;

	// Outputs
	wire entra;
	wire sale;
	wire error;

	// Instantiate the Unit Under Test (UUT)
	parkimetro_io uut(
		.clk(clk), 
		.reset(reset), 
		.a(a), 
		.b(b), 
		.entra(entra), 
		.sale(sale), 
		.error(error)
	);

	localparam [1:0]
		vacio = 2'b00,
		moviendose = 2'b10,
		estacionado = 2'b11,
		invalido = 2'b01;

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
		{a, b} = vacio;

		#100;
		{a, b} = moviendose;
	
		#134;
		{a, b} = vacio;

		#75;
		{a, b} = estacionado; // error

		#74;
		{a, b} = vacio;


		#120;
		{a, b} = moviendose;
		
		#175;
		{a, b} = estacionado; // entra
		
		#134;
		{a, b} = moviendose;

		#134;
		{a, b} = estacionado;

		#120;
		{a, b} = moviendose;
		
		#134;
		{a, b} = vacio; // sale

		#120;
		{a, b} = moviendose;
		
		#175;
		{a, b} = estacionado;

		#120;
		{a, b} = moviendose;
		
		#120;
		{a, b} = vacio;

		
		#100;
	end
      
endmodule

