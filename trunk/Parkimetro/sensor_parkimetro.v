`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:36:49 04/25/2012 
// Design Name: 
// Module Name:    sensor_parkimetro 
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
module sensor_parkimetro(
   input wire a,
   input wire b,
//	output saliendo,
//	output entrando,
	output wire inc,
	output wire error
   );

	reg[1:0] state;
	wire[1:0] next_state;
	localparam [1:0]
		vacio = 2'b00,
		moviendose = 2'b10,
		estacionado = 2'b11,
		invalido = 2'b01;
		
	// 00 vacio
	// 10 entrando
	// 11 estacionado
	// 01 saliendo
	assign next_state = {a,b};
	
	assign inc = (state == estacionado);
	assign error = (state == invalido);
	
	always@ (next_state)
	begin
		case (state)
			invalido:
			begin
				if ( next_state == vacio )
					state = next_state;
			end
			vacio:
			begin
				if ( next_state == moviendose)
					state = next_state;
				else
				begin
					state = invalido;
				end
			end
			moviendose:
			begin
				if ( next_state == estacionado)
				begin
					state = next_state;
				end
				else if ( next_state == vacio )
					state = next_state;
				else
				begin
					state = invalido;
				end
			end
			estacionado:
			begin
				if ( next_state == moviendose)
					state = next_state;
				else
				begin
					state = invalido;
				end
			end
			default:
				state = next_state;
		endcase
	end

endmodule
