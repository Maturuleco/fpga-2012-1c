`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:20:59 03/28/2012 
// Design Name: 
// Module Name:    eq 
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
module eq(
    input i1,
    input i2,
    output eq
    );
	 
		wire p0, p1;
		
		assign p0 = i1 & i2;
		assign p1 = ~i1 & ~i2;

		assign eq = p0 | p1;
		
endmodule
