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
module universal_bin_counter
#(parameter N=8)
(
    input wire clk,
	 input wire reset,
    input wire en,
    input wire up,
    input wire[N-1:0] d,
    input wire syn_clr,
    input wire load,
    output wire max_tick,
    output wire min_tick,
    output wire[N-1:0] q
    );

	reg [N-1:0] q_reg;
	reg [N-1:0] q_next;
		
	//Memory
	always @(posedge clk, posedge reset)
		if(reset)
			q_reg <= 0;
		else
			q_reg <= q_next;
	
	//Next state logic
	always @*
		case {syn_clr, load, en, up}
			4'b1???:
				...
		if(syn_clr)
			q_next <= {N{1'b0}};
		else
			if(load)
				q_next <= d;

		if(en)
			if(up)
				q_next = q_reg+1;
			else
				q_next = q_reg-1;
		else
			q_next = q_reg;
	//Output logic
	assign q = q_next;
	assign max_tick = (q == {N{1'b1}}) ? 1 : 0;
	assign min_tick = (q == {N{1'b0}}) ? 1 : 0;
endmodule
