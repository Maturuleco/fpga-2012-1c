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
module bit_to_3hexa_digits(
    input [3:0] entrada,
    output reg [3:0] h1, h2,
	 output [3:0] h3
    );

	assign h3 = 4'b0000;
	
	always @*
		case (entrada[3:1])
			3'b111, 3'b101: //3'b1?1
			begin
				h1 = (entrada & 4'b0101);
				h2 = 4'b0001;
			end
			3'b110:
			begin
				h1 = {3'b001, entrada[3]};
				h2 = 4'b0001;
			end
			3'b000, 3'b001, 3'b010, 3'b011, 3'b100: //3'b0??:
			begin
				h1 = entrada;
				h2 = 4'b0000;
			end
		endcase

endmodule
