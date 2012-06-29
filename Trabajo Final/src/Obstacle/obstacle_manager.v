`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:06:04 06/29/2012 
// Design Name: 
// Module Name:    obstacle_manager 
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
module obstacle_manager(
	input wire clk, on,
   input wire [18:0] q,
	input wire upsig,
	output wire [6-1:0] obstacle_on,
	output wire [(6*8)-1:0] obstacle_x,
	output wire [(6*10)-1:0] obstacle_y
);
	
	reg [6-1:0] init_obstacle_reg, init_obstacle_next; // lo hago reg para que se sincronizen bien
	wire [6-1:0] init_obstacle;
	assign init_obstacle = init_obstacle_reg;
	
	reg [7:0] initial_x;

	obstacle ob0 ( .clk(clk), .init(init_obstacle[0]), .initial_x(initial_x), .upsig(upsig),
						.on(obstacle_on[0]), .car_x(obstacle_x[7:0]), .car_y(obstacle_y[9:0]) );
	obstacle ob1 ( .clk(clk), .init(init_obstacle[1]), .initial_x(initial_x), .upsig(upsig),
						.on(obstacle_on[1]), .car_x(obstacle_x[15:8]), .car_y(obstacle_y[19:10]) );
	obstacle ob2 ( .clk(clk), .init(init_obstacle[2]), .initial_x(initial_x), .upsig(upsig),
						.on(obstacle_on[2]), .car_x(obstacle_x[23:16]), .car_y(obstacle_y[29:20]) );
	obstacle ob3 ( .clk(clk), .init(init_obstacle[3]), .initial_x(initial_x), .upsig(upsig),
						.on(obstacle_on[3]), .car_x(obstacle_x[31:24]), .car_y(obstacle_y[39:30]) );
	obstacle ob4 ( .clk(clk), .init(init_obstacle[4]), .initial_x(initial_x), .upsig(upsig),
						.on(obstacle_on[4]), .car_x(obstacle_x[39:32]), .car_y(obstacle_y[49:40]) );
	obstacle ob5 ( .clk(clk), .init(init_obstacle[5]), .initial_x(initial_x), .upsig(upsig),
						.on(obstacle_on[5]), .car_x(obstacle_x[47:40]), .car_y(obstacle_y[59:50]) );
	
	always @(posedge clk)
	begin
		if ( on ) begin
			init_obstacle_reg <= init_obstacle_next;
		end else begin
			init_obstacle_reg <= 0;
		end
	end
	
	wire [3:0] rnd_1, rnd_2;
	assign rnd_1 = {q[7], q[3], q[12], q[5]};
	assign rnd_2 = {q[2], q[6], q[14], q[0]};
	wire drop;
	assign drop = rnd_1 == rnd_2;
	
	always@*
	begin
		initial_x = 0;
		init_obstacle_next = 0; // el init sólo debe durar un ciclo de clk
		if (drop )
		begin
			initial_x = {rnd_1[2:0], rnd_2}; // seteo la pos inicial con el random
			// busco algún objeto inactivo para activarlo
			if ( obstacle_on[0] == 1'b0 )
				init_obstacle_next[0] = 1'b1;
			else if ( obstacle_on[1] == 1'b0 )
				init_obstacle_next[1] = 1'b1;
			else if ( obstacle_on[2] == 1'b0 )
				init_obstacle_next[2] = 1'b1;
			else if ( obstacle_on[3] == 1'b0 )
				init_obstacle_next[3] = 1'b1;
			else if ( obstacle_on[4] == 1'b0 )
				init_obstacle_next[4] = 1'b1;
			else if ( obstacle_on[5] == 1'b0 )
				init_obstacle_next[5] = 1'b1;
		end
	end

endmodule
