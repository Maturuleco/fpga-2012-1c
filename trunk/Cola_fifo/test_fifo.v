`timescale 1ns / 1ps

// Listing 4.21
module test_fifo
(
input wire clk, reset,
input wire wr,
input wire rd,
input wire [W-1:0] sw,
output wire [7:0] led,
	output wire [A:0] w_ptr_reg,
	output wire [A:0] r_ptr_reg,
	output wire pop, push
);

	localparam A=2, W=3;

	// debounce
	wire db_push, db_pop;
	db_fsm #(.N(2)) btn_rd (.clk(clk), .reset(reset), .sw(rd), .db(db_pop));
	db_fsm #(.N(2)) btn_wr (.clk(clk), .reset(reset), .sw(wr), .db(db_push));
	
	//wire pop, push;
	button_regulator br_rd ( .clk(clk), .reset(reset), .bt_in(db_pop) , .bt_out(pop) );
	button_regulator br_wr ( .clk(clk), .reset(reset), .bt_in(db_push) , .bt_out(push) );

	// instantiate a 2^2-by-3 fifo
	cola_fifo #(.W(W), .A(A)) fifo_unit
	(
		.clk(clk), .reset(reset),
		.rd(pop),
		.wr(push),
		.in(sw),
		.data(led[W-1:0]),
		.full(led[7]),
		.empty(led[6]),
		.error(led[5]),
		.r_ptr_reg(r_ptr_reg),
		.w_ptr_reg(w_ptr_reg)
	);

	// disable unused leds

	assign led[4:W] = 2'b00;

endmodule
