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
#( parameter B=8, // number of bits in a word
	W=4 // number of address bits
)
(
	input wire clk, reset,
	input rd,
	input wr,
	input [B-1:0] in,
	output [B-1:0] data,
	output full,
	output error,
	output empty
	);
	
	//signal declaration
	reg [W-1:0] w_ptr_reg, w_ptr_next;
	reg [W-1:0] r_ptr_reg, r_ptr_next;
	reg full_reg, empty_reg, full_next, empty_next;
	wire wr_en;
	wire rd_en;

	// write enabled only when FIFO is not full
	assign wr_en = wr & ~full_reg;
	assign rd_en = rd & ~empty_reg;
	assign error = (wr && full_reg) || (rd && empty_reg);
	
	assign full = full_reg;
	assign empty = empty_reg;
	
	banco_registros #(.W(B), .A(W)) memoria ( .clk(clk), .data_in(in), .data_out2(data), .address_w(w_ptr_reg), .address_r(r_ptr_reg), .wr_en(wr_en) );
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
	
	localparam [1:0]
		pop = 2'b01,
		push = 2'b10,
		idle = 2'b00,
		pop_push = 2'b11;
	
	// Logica
	always@ *
	begin
		full_next = full_reg;
		empty_next = empty_reg;
		r_ptr_next = r_ptr_reg;
		w_ptr_next = w_ptr_reg;
		case ({wr_en, rd_en})
			pop:
			begin
				r_ptr_next = r_ptr_reg + 1;
				full_next = 1'b0;
				if ((r_ptr_reg + 1) == w_ptr_reg)
					empty_next = 1'b1;
			end
			push:
			begin
				w_ptr_next = w_ptr_reg +1;
				empty_next = 1'b0;
				if ((w_ptr_reg +1) == r_ptr_reg)
					full_next = 1'b1;
			end
			//idle: no op
			pop_push:
			begin
				r_ptr_next = r_ptr_reg+1;
				w_ptr_next = w_ptr_reg+1;
			end
			idle:
			begin
			end
			default:
			begin
				w_ptr_next = 0;
				r_ptr_next = 0;
				full_next = 1'b0;
				empty_next = 1'b1;
			end
		endcase
	end

endmodule
