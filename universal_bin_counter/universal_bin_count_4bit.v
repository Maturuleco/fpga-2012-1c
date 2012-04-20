`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:40:13 04/18/2012 
// Design Name: 
// Module Name:    universal_bin_counter 
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
module universal_bin_count_4bit
(
    input wire clk,
	 input wire reset,
    input wire en,
    input wire up,
    input wire[3:0] d,
    input wire syn_clr,
    input wire load,
    output wire max_tick,
    output wire min_tick,
    output wire[3:0] q
    );
	 
	wire tick;
	
	universal_bin_counter #(.N(25)) realenter (
		.clk(clk),
		.reset(reset),
		.en(1'b1),
		.up(1'b1),
		.d(0),
		.syn_clr(1'b0),
		.load(1'b0),
		.max_tick(tick)
	);

	universal_bin_counter #(.N(4)) ubc (
		.clk(tick),
		.reset(reset),
		.en(en),
		.up(up),
		.d(d),
		.syn_clr(syn_clr),
		.load(load),
		.max_tick(max_tick),
		.min_tick(min_tick),
		.q(q)
	);	
	
	
	
endmodule
