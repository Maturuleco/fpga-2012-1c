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

// Cuando me entra el reset seteo la posicion del auto con lo que
// hay en car_position
module graphic_car_controller(
	input clk, reset,
	input [7:0] car_position_x, car_position_y,
	input [9:0] pixel_x, pixel_y,
	output [2:0] rgb,
	output wire on
   );
	
	wire on_road = pixel_x[9:7] == 2'b01;
	reg [7:0] car_position_x_reg, car_position_y_reg;
	
	always@ (posedge clk, posedge reset)
	begin
		if (reset)
		begin
			car_position_x_reg <= car_position_x;
			car_position_y_reg <= car_position_y;
		end
	end
	
	wire [7:0] left_bound = car_position_x_reg;
	wire [7:0] upper_bound = car_position_y_reg;
	assign left_bound = car_position_x_reg;
	assign upper_bound = car_position_y_reg;
	
	reg [7:0] right_bound;
	reg [7:0] lower_bound;

	reg [3:0] local_pixel_x; // ancho 16
	reg [4:0] local_pixel_y; // ancho 32
	
	always@*
	begin
		right_bound = car_position_x_reg + 16;
		lower_bound = car_position_y_reg + 32;
		local_pixel_x = pixel_x[7:0] - left_bound;
		local_pixel_y = pixel_y[7:0] - upper_bound;
	end
	
	assign on = on_road && ( pixel_x[7:0] <= right_bound && pixel_x[7:0] >= left_bound && pixel_y[7:0] <= lower_bound && pixel_y[7:0] >= upper_bound );
	
	// block ram
	reg [3:0] car_draw [8:0]; //(3)*(16*32) [ = (3)*(2^5) ]

	// output
	assign rgb[2:0] = car_draw[on && {local_pixel_y;local_pixel_x}];
	
endmodule
