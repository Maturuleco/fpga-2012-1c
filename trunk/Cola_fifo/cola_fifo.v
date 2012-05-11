`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:47:28 05/02/2012 
// Design Name: 
// Module Name:    cola_fifo 
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
module cola_fifo
#( parameter W=8, // number of bits in a word
	A=4 // number of address bits
)
(
	input wire clk, reset,
	input rd,
	input wr,
	input [W-1:0] in,
	output reg [W-1:0] data,
	output full,
	output error,
	output empty,
	output reg [A-1:0] w_ptr_reg,
	output reg [A-1:0] r_ptr_reg
	);
	
	//signal declaration
	reg [A-1:0] w_ptr_next;//, w_ptr_reg;
	reg [A-1:0] r_ptr_next;//, r_ptr_reg;
	
	wire [A-1:0] w_ptr_succ, r_ptr_succ;
	assign w_ptr_succ = w_ptr_reg +1;
	assign r_ptr_succ = r_ptr_reg +1;
	
	reg full_reg, empty_reg, full_next, empty_next;
	wire wr_en;
	wire rd_en;

	// write enabled only when FIFO is not full
	assign wr_en = wr & ~full;
	assign rd_en = rd & ~empty;
	assign error = (wr && full) || (rd && empty);
	
	assign full = full_reg;
	assign empty = empty_reg;
	
	wire [W-1:0] salida;
	banco_registros #(.W(W), .A(A)) memoria ( .clk(clk), .data_in(in), .data_out2(salida), .address_w(w_ptr_reg), .address_r(r_ptr_reg), .wr_en(wr_en) );
	//test_mem3 memoria ( .clk(clk), .data_in(in), .data_out(data), .data(data2), .address_w(w_ptr_reg), .address_r(r_ptr_reg), .wr_en(wr_en) );
		
	// Memoria FSM
	always@ (posedge clk, posedge reset)
	begin
		if (reset)
		begin
			w_ptr_reg <= 0;
			r_ptr_reg <= 0;
			full_reg  <= 1'b0;
			empty_reg <= 1'b1;
		end
		else
		begin
			w_ptr_reg <= w_ptr_next;
			r_ptr_reg <= r_ptr_next;
			full_reg  <= full_next;
			empty_reg <= empty_next;
		end
	end

	// Logica de Salida
	always@*
	begin
		if ( empty )
			data = 0;
		else
			data = salida;
	end

	localparam [1:0]
		pop = 2'b01,
		push = 2'b10,
		idle = 2'b00,
		pop_push = 2'b11;

	// Logica de Punteros
	always@*
	begin
		case ({wr_en, rd_en})
			pop:
			begin
				r_ptr_next = (r_ptr_succ);
			end
			push:
			begin
				w_ptr_next = (w_ptr_succ);
			end
			idle:
			begin
				r_ptr_next = r_ptr_reg;
				w_ptr_next = w_ptr_reg;
			end
			pop_push:
			begin
				r_ptr_next = (r_ptr_succ);
				w_ptr_next = (w_ptr_succ);
			end
			default:
			begin
				r_ptr_next = 0;
				w_ptr_next = 0;
			end
		endcase
	end
	
	// Logica de Señales (E/F)
	always@ *
	begin
		full_next = full_reg;
		empty_next = empty_reg;
		case ({wr_en, rd_en})
			pop:
			begin
				full_next = 1'b0;
				if (r_ptr_succ == w_ptr_reg)
					empty_next = 1'b1;
			end
			push:
			begin
				empty_next = 1'b0;
				if (w_ptr_succ == r_ptr_reg)
					full_next = 1'b1;
			end
		endcase
	end

endmodule
