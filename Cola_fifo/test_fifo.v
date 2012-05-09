`timescale 1ns / 1ps

// Listing 4.21
module test_fifo
(
input wire clk, reset,
input wire wr,
input wire rd,
input wire [2:0] sw,
output wire [7:0] led
);

	// signal declaration
/*	wire [1:0] db_btn;

	// debounce circuits
	debounce btn_rd
	(.clk(clk), .reset(reset), .sw(rd),
	.db_level(), .db_tick(db_btn[0]));

	debounce btn_wr
	(.clk(clk), .reset(reset), .sw(wr),
	.db_level(), .db_tick(db_btn[1]));
*/
	
	// instantiate a 2^2-by-3 fifo
	cola_fifo #(.B(3), .W(2)) fifo_unit
	(
		.clk(clk), .reset(reset),
		.rd(rd),
		.wr(wr),
		.in(sw),
		.data(led[2:0]),
		.data2(led[5:3]),
		.full(led[7]),
		.empty(led[6])
		//.error(led[5])
	);

	// disable unused leds

	//assign led[4:3] = 2'b00;

endmodule
