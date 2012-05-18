`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:28:29 05/18/2012 
// Design Name: 
// Module Name:    adder 
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
module adder
#(W = 32 )
(	
	input [W-1:0] A,
	input [W-1:0] B,
	input cin,
	output cout,
	output [W-1:0] S
    );
   
   reg  [W:0] Suma;
	assign S = Suma[W-1:0];
	assign cout = Suma[W];
   
   always @*
        Suma = { cin, A } + { 1'b0,B };

endmodule
