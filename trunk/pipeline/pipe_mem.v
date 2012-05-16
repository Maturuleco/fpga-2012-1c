`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:28:55 05/16/2012 
// Design Name: 
// Module Name:    pipe_mem 
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
module pipe_mem
#( parameter H = 3,
	W = 32
)
(
	input [W-1:0] in,
	output [W-1:0] out,
	input clk,
	input reset
);
	reg [W-1:0] Z0 [H-1:0];
	
	integer i;
	assign out = Z0[H-1];
	
	always @ (posedge clk, posedge reset)
	begin
		if (reset)
			for (i=0;i<H;i=i+1)
				Z0[i] <= 0;
		else
		begin
			for (i=H-1; i>0; i=i-1)
				Z0[i] <= Z0[i-1];
			Z0[0] <= in;
		end
	end

endmodule
