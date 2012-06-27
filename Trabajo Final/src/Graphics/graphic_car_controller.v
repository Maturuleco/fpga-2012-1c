`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:37:42 06/15/2012 
// Design Name: 
// Module Name:    graphic_car_controller 
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

// Cuando me entra el update seteo la posicion del auto con lo que
// hay en car_position
module graphic_car_controller(
	input [7:0] car_position_x, 
	input [9:0] car_position_y,
	input [9:0] pixel_x, pixel_y,
	output [2:0] rgb,
	output wire on
   );
	
	wire on_road = pixel_x[9:8] == 2'b01;
		
	wire [7:0] left_bound;
	wire [9:0] upper_bound;

	assign left_bound = car_position_x;
	assign upper_bound = car_position_y;
	
	wire [7:0] right_bound;
	wire [9:0] lower_bound;

//	wire [3:0] local_pixel_x; // ancho 16
//	wire [4:0] local_pixel_y; // ancho 32
	
	assign right_bound = car_position_x + 16;
	assign lower_bound = car_position_y + 32;
	
//	assign local_pixel_x = pixel_x[7:0] - left_bound;
//	assign local_pixel_y = pixel_y - upper_bound;
	
	assign on = on_road && ( 
		right_bound >= pixel_x[7:0] && pixel_x[7:0] >= left_bound && 
		pixel_y <= lower_bound && pixel_y >= upper_bound );
	
	// block ram
	//reg [3:0] car_draw [8:0]; //(3)*(16*32) [ = (3)*(2^5) ]

	// output
	assign rgb[2:0] = 3'b111;//car_draw[on && {local_pixel_y;local_pixel_x}];
	
endmodule
