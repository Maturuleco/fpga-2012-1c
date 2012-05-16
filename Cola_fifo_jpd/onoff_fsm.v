`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:06:43 05/09/2012 
// Design Name: 
// Module Name:    onoff_fsm 
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
module onoff_fsm(
	 input clk,reset,
    input sw,
    output wire out
);

	localparam [1:0]
		off = 2'b00,
		on = 2'b01,
		first_on = 2'b10;

	reg [1:0] state_next, state_reg;
	
	always @(posedge clk, posedge reset)
	if(reset)
		state_reg <= off;
	else
		state_reg <= state_next;

	always @*
	begin
		state_next = state_reg;
		case(state_reg)
			off:
				if(sw)
					state_next = first_on;			
			first_on:
				if(sw)
					state_next = on;
			on:
				if(~sw)
					state_next = off;
		endcase
	end
	
	assign out = state_reg[1];
endmodule
