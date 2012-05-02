`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:21:00 04/27/2012 
// Design Name: 
// Module Name:    parquimetro 
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
module parquimetro
#(parameter N=4)
(
 input psensor,
 input ssensor,
 input clk,
 input reset,
 output wire [N-1:0] conteo,
 output wire hubo_error
 //DEBUG
 //output wire [2:0] state
);
	
	//Estados posibles
	localparam [2:0]
		vacio = 3'b000,
		entrando = 3'b001,
		estaciono = 3'b010,
		saliendo = 3'b011,
		error = 3'b100;

	reg [2:0] state_reg,state_next;
	reg [N-1:0] conteo_reg,conteo_next;
	
	//Logica secuencial
	always @(posedge clk, posedge reset)
		if(reset)
			begin
				state_reg  <= vacio;
				conteo_reg <= 0;
			end
		else
			begin
				conteo_reg <= conteo_next;
				state_reg <= state_next;
			end
			
	//Logica del proximo estado
	always @*
	begin
		//Estado default: Todo sigue igual hasta que se demuestre lo contrario.
		state_next = state_reg;
		conteo_next = conteo_reg;
		
		case(state_reg)
			vacio:
			//Si estaba vacio, tiene que entrar un auto tocando el primer sensor.
				if(~ssensor)
					begin
						if(psensor)
							state_next = entrando;
					end
				else
					state_next = error;
			
			entrando:
			//Si estaba entrando, tiene que tocar el segundo sensor.
				if(psensor)
						begin
							if(ssensor) 
								begin
									conteo_next = conteo_reg+1;
									state_next = estaciono;
								end
						end
				else 
					state_next = error;
			
			estaciono:
			//Si esta estacionado, para salir tiene que liberar el segundo sensor.
				if(psensor)
					begin
						if(~ssensor)
							state_next = saliendo;
					end
				else
					state_next = error;
			
			saliendo:
			//Si estaba saliendo, para terminar de salir tiene que liberar el primer sensor.
				if(~ssensor)
					begin
						if(~psensor)
							state_next = vacio;
					end
				else
					state_next = error;
			
			error:
			//Para volver de un error hay que apagar todos los sensores.
				if(~ssensor & ~psensor)
					state_next = vacio;
					
			default:
			//Cualquier otra situacion: ERROR!
				state_next = error;
		endcase
	end
	
	assign conteo = conteo_reg;
	assign hubo_error = state_reg[2];
	//DEBUG
	//assign state = state_reg;
endmodule
