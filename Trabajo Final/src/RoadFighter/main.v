`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:17:08 06/15/2012 
// Design Name: 
// Module Name:    main 
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
module main(
    input wire clk, reset,
	 input wire left, right,
    output wire hsync, vsync,
    output wire [2:0] rgb
   );

   //signal declaration
   reg [2:0] rgb_reg;
	wire [2:0] rgb_next;
   wire video_on;
	
	wire [9:0] pixel_x,pixel_y;

   // instantiate vga sync circuit
   vga_sync vsync_unit
      (.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
       .video_on(video_on), .p_tick(), .pixel_x(pixel_x), .pixel_y(pixel_y));
		 
   // rgb buffer
   always @(posedge clk, posedge reset)
      if (reset)
         rgb_reg <= 0;
      else
         rgb_reg <= rgb_next;

	wire [7:0] player_car_x;
	wire [9:0] player_car_y;
	wire on_player_car;
	wire [2:0] rgb_car_player;

	player p1 (.clk(clk), .reset(reset), .left(left), .right(right), 
						.car_x(player_car_x), .car_y(player_car_y) );

	graphic_car_controller p1_gcontroller (
					.car_position_x(player_car_x), .car_position_y(player_car_y), 
					.pixel_x(pixel_x), .pixel_y(pixel_y), .on(on_player_car), .rgb(rgb_car_player) );

	wire [2:0] rgb_bg;
	background bg (.pixel_x(pixel_x[9:8]), .rgb(rgb_bg));

	graphic_controller gc (
				.rgb(rgb_next), .on_objs({1'b1,on_player_car}),
				.r_objs({rgb_bg[0],rgb_car_player[0]}),
				.g_objs({rgb_bg[1],rgb_car_player[1]}),
				.b_objs({rgb_bg[2],rgb_car_player[2]})
				);
				
   // output
   assign rgb = (video_on) ? rgb_reg : 3'b0;
	
endmodule
