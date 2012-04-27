`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:15:19 04/27/2012 
// Design Name: 
// Module Name:    parquimetro_db 
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
module parquimetro_db(
	 input clk,
	 input reset,
    input psensor,
    input ssensor,
    output [3:0] conteo,
    output hubo_error
    );

	db_fsm psensor_db (.clk(clk), .reset(reset), .sw(psensor), .db(psensor_damped));
	db_fsm ssensor_db (.clk(clk), .reset(reset), .sw(ssensor), .db(ssensor_damped));

	parquimetro p (
		.clk(clk),
		.reset(reset),
		.psensor(psensor_damped),
		.ssensor(ssensor_damped),
		.conteo(conteo),
		.hubo_error(hubo_error)
	);
endmodule
