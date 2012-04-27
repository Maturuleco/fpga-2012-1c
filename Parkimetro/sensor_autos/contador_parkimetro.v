`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:38:01 04/27/2012 
// Design Name: 
// Module Name:    contador_parkimetro 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module contador_parkimetro(
	input clk,
	input reset,
	input a,
	input b,
	output an,
	output sseg
	);
	
	wire entra, sale;
	parkimetro_io p_io ( .a(a), .b(b), .clk(clk), .reset(reset), .entra(entra), .sale(sale) ); //error no le doy bola

	wire tick;
	fsm_contador cont ( .entra(entra), .sale(sale), .tick(tick) );
	
	wire[16:0] salida;
	countador contador ( .clk(tick), .sclr(reset), .q(salida) );
	
	
	

endmodule
