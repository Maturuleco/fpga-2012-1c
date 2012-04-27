`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:54:26 04/27/2012 
// Design Name: 
// Module Name:    fsm_contador 
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
module fsm_contador(
    input entra,
    input sale,
    output tick
    );
	
	reg[1:0] reg_state;
	reg[1:0] next_state;
	
	localparam[1:0]
		solo_entra	= 2'b10,
		solo_sale	= 2'b01,
		inactivo		= 2'b00,
		invalido		= 2'b11;
	
	localparam[1:0]
		idle	= 2'b00,
		up		= 2'b01,
		down	= 2'b10,
		count	= 2'b11;
	
	always@ (posedge clk, posedge reset)
		if (reset)
			reg_state = idle;
		else
			reg_state = next_state;
	
	// Logica de estados
	always@*
		case (reg_state)
			idle:
				case ( {entra,sale} )
					inactivo:
						next_state = idle;
					solo_entra:
						next_state = up;
					default:
						next_state = invalido;
				endcase
			up:
				case ( {entra,sale} )
					inactivo:
						next_state = up;
					solo_entra:
						next_state = up;
					solo_sale:
						next_state = down;
					default:
						next_state = invalido;
				endcase
			down:
				case ( {entra,sale} )
					inactivo:
						next_state = count;
					solo_sale:
						next_state = down;
					default:
						next_state = invalido;
				endcase
			count:
				case ( {entra,sale} )
					inactivo:
						next_state = inactivo;
					solo_entra:
						next_state = up;
					default:
						next_state = invalido;
				endcase
		endcase
	
	// Logica de salidas
	assign tick = (reg_state == count);

endmodule
