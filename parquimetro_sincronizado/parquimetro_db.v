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
    //DEBUG
	 //output [2:0] state
	 );
	 
	wire psensor_damped,ssensor_damped;

	db_fsm psensor_db (.clk(clk), .reset(reset), .sw(psensor), .db(psensor_damped));
	db_fsm ssensor_db (.clk(clk), .reset(reset), .sw(ssensor), .db(ssensor_damped));

	parquimetro p (
		.clk(clk),
		.reset(reset),
		.psensor(psensor_damped),
		.ssensor(ssensor_damped),
		.conteo(conteo),
		.state(state),
		.hubo_error(hubo_error)
	);
endmodule
