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
	 
    output wire hsync, vsync,
    output wire [2:0] rgb
   );

   //signal declaration
   reg [2:0] rgb_reg;
	wire [2:0] rgb_next;
   wire video_on;

   // instantiate vga sync circuit
   vga_sync vsync_unit
      (.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
       .video_on(video_on), .p_tick(), .pixel_x(pixel_x), .pixel_y(pixel_y));
		 
	// instance graphic controller
	graphic_controller gc ( .pixel_x(pixel_x), .pixel_y(pixel_y), .rgb(rgb_next) ); 

   // rgb buffer
   always @(posedge clk, posedge reset)
      if (reset)
         rgb_reg <= 0;
      else
         rgb_reg <= rgb_next;

   // output
   assign rgb = (video_on) ? rgb_reg : 3'b0;
	
	// ------------------ BEGIN Cars Memory ------------------------------------
	// -------------------------------------------------------------------------
	reg [7:0] player_reg, car_1_reg, car_2_reg, car_3_reg, car_4_reg, car_5_reg;
//	reg [7:0] player_next, car_1_next, car_2_next, car_3_next, car_4_next, car_5_next;

	always@ (posedge clk, posedge reset)
	begin
		if ( reset )
		begin
			player_reg	= 0;
			car_1_reg	= 0;
			car_2_reg	= 0;
			car_3_reg	= 0;
			car_4_reg	= 0;
			car_5_reg	= 0;
		end
/*		else
		begin
			player_reg	= player_next;
			car_1_reg	= car_1_next;
			car_2_reg	= car_2_next;
			car_3_reg	= car_3_nest;
			car_4_reg	= car_4_next;
			car_5_reg	= car_5_next;
		end*/
	end
	// ------------------ END Cars Memory --------------------------------------
	// -------------------------------------------------------------------------
endmodule
