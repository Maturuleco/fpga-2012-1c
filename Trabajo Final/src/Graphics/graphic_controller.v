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
#( parameter CARS=6 ) // number of cars including the player car
	(
   input wire [9:0] pixel_x, pixel_y,
	input wire [CARS-1:0] on_cars,
	input wire [CARS-1:0] r_cars, g_cars, b_cars,
	output reg [2:0] rgb
	);

	wire [2:0] bg_rgb;	
	background bg ( .pixel_x(pixel_x), .pixel_y(pixel_y), .rgb(bg_rgb) );
	
	wire [CARS:0] selector;
	assign selector = {1,on_cars};
	
	wire [CARS:0] r_selector, g_selector, b_selector;
	assign r_selector = {bg_rgb[2], r_cars};
	assign g_selector = {bg_rgb[1], r_cars};
	assign b_selector = {bg_rgb[0], r_cars};
	
	wire [CARS:0] mask;
	assign mask = selector && (-selector);
	
	rgb = { (mask && r_selector) != 0, 
			  (mask && g_selector) != 0,
			  (mask && b_selector) != 0 }

endmodule
