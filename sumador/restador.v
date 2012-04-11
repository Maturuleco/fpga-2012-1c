`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:26:39 04/04/2012 
// Design Name: 
// Module Name:    restador 
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
module restador(
    input [2:0] a,
    input [2:0] b,
    output [2:0] res
    );

	assign res = a-b;

endmodule
