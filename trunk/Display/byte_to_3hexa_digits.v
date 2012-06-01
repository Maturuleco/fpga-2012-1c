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
    output reg [3:0] unidad, decena, centena
    );
	
	reg [7:0] loc;
	
	always @*
	begin
		decena = 0;
		centana = 0;
		loc = entrada;
		while (loc > 10) begin
			loc = loc - 10;
			if ( decena = 9 )
			begin
				decena = 0;
				centena = centena+1;
			end
			else
				decena = decena +1;
 		end
		unidad = loc[3:0];
	end

endmodule
