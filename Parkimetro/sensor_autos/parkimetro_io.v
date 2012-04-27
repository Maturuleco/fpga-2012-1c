`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:36:06 04/27/2012 
// Design Name: 
// Module Name:    parkimetro_io 
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
module parkimetro_io(
	input clk,
	input reset,
   input a,
   input b,
   output entra,
   output sale,
   output error
   );
	
	reg[3:0] reg_state;
	reg[3:0] next_state;

	localparam [3:0]
		vacio = 3'b000,
		entrando = 3'b001,
		estacionado = 3'b010,
		saliendo = 3'b011,
		saliendo_vacio = 3'b100,
		entrando_lleno = 3'b101,
		invalido = 3'b111;

	
	localparam [1:0]
		s_vacio = 2'b00,
		s_moviendose = 2'b10,
		s_estacionado = 2'b11,
		s_invalido = 2'b01;
	
	// Estado
	always@ (posedge clk, posedge reset)
		if (reset)
			reg_state = vacio;
		else
			reg_state = next_state;
	
	// Logica de Transiciones
	always@ *
	case (reg_state)
		vacio:
			case ({a,b})
				s_vacio:
					next_state = vacio;
				s_moviendose:
					next_state = entrando;
				default:
					next_state = invalido;
			endcase
		entrando:
			case ({a,b})
				s_moviendose:
					next_state = entrando;
				s_estacionado:
					next_state = entrando_lleno;
				s_vacio:
					next_state = vacio;
				default:
					next_state = invalido;
			endcase
		entrando_lleno:
			case ({a,b})
				s_estacionado:
					next_state = estacionado;
				default:
					next_state = invalido;
			endcase
		estacionado:
			case ({a,b})
				s_estacionado:
					next_state = estacionado;
				s_moviendose:
					next_state = saliendo;
				default:
					next_state = invalido;
			endcase
		saliendo:
			case ({a,b})
				s_moviendose:
					next_state = saliendo;
				s_estacionado:
					next_state = estacionado; // no paso por entrando_lleno porque nunca llegó a salir
				s_vacio:
					next_state = saliendo_vacio;
				default:
					next_state = invalido;
			endcase
		saliendo_vacio:
			case ({a,b})
				s_vacio:
					next_state = vacio;
				default:
					next_state = invalido;
			endcase
		invalido:
			case ({a,b})
				s_vacio:
					next_state = vacio;
				default:
					next_state = invalido;
			endcase
		default:
			case ({a,b})
				s_vacio:
					next_state = vacio;
				default:
					next_state = invalido;
			endcase
	endcase
	
	// Logica de las salidas
	assign entra = (reg_state == entrando_lleno);
	assign sale = (reg_state == saliendo_vacio);
	assign error = (reg_state == invalido);

endmodule
