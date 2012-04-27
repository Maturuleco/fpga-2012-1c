`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:51:54 04/25/2012
// Design Name:   sensor_parkimetro
// Module Name:   //dc3.ad.dc.uba.ar/RedirectedFolders06/mhperez/Desktop/FPGA/trunk/Parkimetro/sensor_autos/test_parkimetro.v
// Project Name:  sensor_autos
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sensor_parkimetro
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_parkimetro;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire inc;

	// Instantiate the Unit Under Test (UUT)
	sensor_parkimetro uut (
		.a(a), 
		.b(b), 
		.inc(inc),
		.error(error)
	);

	localparam [1:0]
		vacio = 2'b00,
		moviendose = 2'b10,
		estacionado = 2'b11,
		invalido = 2'b01;

	initial begin
		// Initialize Inputs
		{a, b} = vacio;

		// Wait 100 ns for global reset to finish

		#100;
		{a, b} = moviendose;
	
		#34;
		{a, b} = vacio;

		#20;
		{a, b} = moviendose;
		
		#75;
		{a, b} = estacionado;
		
		#34;
		{a, b} = invalido; // entra en estado invalido

		#34;
		{a, b} = estacionado;

		#20;
		{a, b} = moviendose;
		
		#34;
		{a, b} = vacio; // sale de estado invalido

		#20;
		{a, b} = moviendose;
		
		#75;
		{a, b} = estacionado;
		
		#20;
		{a, b} = vacio;

		
		#100;
	end
      
endmodule

