`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:36 05/02/2012 
// Design Name: 
// Module Name:    display_controller 
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
module display_controller(
	input clk,
	input reset,
   input [3:0] entrada,
   output [7:0] sseg,
   output [3:0] an
   );

	wire[3:0] s1, s2, s3;
	bit_to_3hexa_digits	refactor	( .entrada(entrada), .h1(s1), .h2(s2), .h3(s3) );

	wire[7:0] salida1,salida2,salida3;
	hex_to_sseg	numero1	(.hex(s1), .dp(1'b1), .sseg(salida1));
	hex_to_sseg	numero2	(.hex(s2), .dp(1'b1), .sseg(salida2));
	hex_to_sseg	numero3	(.hex(s3), .dp(1'b1), .sseg(salida3));
	
	disp_mux		display	(.in0(salida1), .in1(salida2), .in2(salida3), .in3(8'b11111111), .an(an), .sseg(sseg), .clk(clk), .reset(reset) );
	

endmodule
