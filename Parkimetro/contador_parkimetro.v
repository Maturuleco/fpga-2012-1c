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
	output entra,
	output sale,
	output error,
	output[3:0] contador_n,
	output[3:0] an,
	output[7:0] sseg
	);
	
	parkimetro_io p_io ( .a(a), .b(b), .clk(clk), .reset(reset), .entra(entra), .sale(sale), .error(error) );

	wire tick;
	fsm_contador cont ( .entra(entra), .sale(sale), .tick(tick), .clk(clk), .reset(reset) );
	
	wire[3:0] salida;
	assign contador_n = salida;
	contador contador ( .clk(tick), .sclr(reset), .q(salida) );
	
	display_controller disp ( .entrada(salida), .an(an), .sseg(sseg), .clk(clk), .reset(reset) );

endmodule
