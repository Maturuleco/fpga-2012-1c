`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:43:24 06/15/2012 
// Design Name: 
// Module Name:    graphicController 
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
module graphic_controller
	(
	input wire [1:0] on_objs,
	input wire [1:0] r_objs, g_objs, b_objs,
	output reg [2:0] rgb
	);
		
	always @*
		case (on_objs)
			2'b01, 2'b11:
			begin
				rgb[0] = r_objs[0];
				rgb[1] = g_objs[0];
				rgb[2] = b_objs[0];
			end
			2'b10, 2'b11:
			begin
				rgb[0] = r_objs[1];
				rgb[1] = g_objs[1];
				rgb[2] = b_objs[1];
			end
			default:
			begin
				rgb[0] = r_objs[1];
				rgb[1] = g_objs[1];
				rgb[2] = b_objs[1];
			end
		endcase

endmodule
