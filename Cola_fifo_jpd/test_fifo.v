`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:28:59 05/09/2012 
// Design Name: 
// Module Name:    test_fifo 
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
module test_fifo
#(
parameter B=4,W=4
)
(
		input wire clk, reset, rd, wr,
		input wire [B-1:0] wr_data,
		output wire full,empty,
		output wire [B-1:0] rd_data,
		output wire read,write
    );

	onoff_fsm rd_db (.clk(clk),.reset(reset),.sw(rd),.out(read));
	onoff_fsm wr_db (.clk(clk),.reset(reset),.sw(wr),.out(write));

	fifo #(.B(B), .W(W)) cola_fifo (.clk(clk),.reset(reset),
						 .wr_data(wr_data), .full(full),
						 .empty(empty), .rd_data(rd_data),
						 .rd(read), .wr(write) );

endmodule
