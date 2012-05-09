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

	// debounce
//	wire db_wr, db_rd;
//	db_fsm btn_rd (.clk(clk), .reset(reset), .sw(rd), .db(db_rd));
//	db_fsm btn_wr (.clk(clk), .reset(reset), .sw(wr), .db(db_wr));
	
	el full está mal!!!

	wire rd_fifo, wr_fifo;
	button_regulator br_rd ( .clk(clk), .bt_in(rd) , .bt_out(rd_fifo) );
	button_regulator br_wr ( .clk(clk), .bt_in(wr) , .bt_out(wr_fifo) );

	// instantiate a 2^2-by-3 fifo
	cola_fifo #(.B(3), .W(2)) fifo_unit
	(
		.clk(clk), .reset(reset),
		//.rd(db_btn[0]),
		//.wr(db_btn[1]),
		.rd(rd_fifo),
		.wr(wr_fifo),
		.in(sw),
		.data(led[2:0]),
		.full(led[7]),
		.empty(led[6]),
		.error(led[5])
	);

	// disable unused leds

	assign led[4:3] = 2'b00;

endmodule
