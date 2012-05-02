`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:15:12 04/13/2012 
// Design Name: 
// Module Name:    4bit_to_3hexa_digits 
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
module byte_to_3hexa_digits(
    input [7:0] entrada,
    output reg [3:0] unidad, decena,
	 output [3:0] centena
    );
	
	always @*
	begin
		h3 = entrada / 100;
		h2 = (entrada % 100) / 10;
		h1 = entrada % 10;
	end

endmodule
