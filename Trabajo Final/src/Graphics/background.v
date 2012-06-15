`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:43:07 06/15/2012 
// Design Name: 
// Module Name:    background 
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
module background(
   input wire [9:0] pixel_x, pixel_y,
	output reg [2:0] rgb
	);
	
	localparam [2:0]
		NEGRO 	= 3'b000,
		AZUL		= 3'b001,
		VERDE		= 3'b010,
		CYAN		= 3'b011,
		ROJO		= 3'b100,
		MAGENTA	= 3'b101,
		AMARILLO = 3'b110,
		BLANCO	= 3'b111;
	
	always@*
	begin
		case ( pixel_x[9:7] )
			2'b00: // Primera parte del fondo
				rgb = VERDE;
			2'b01:
				rgb = NEGRO;
			default
				rgb = VERDE;
		endcase
	end

endmodule
