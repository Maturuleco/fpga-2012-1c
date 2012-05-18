`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:26:13 05/18/2012 
// Design Name: 
// Module Name:    fibo 
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
module fibo(
    input [7:0] n,
	 input clk,
	 input reset,
	 input start,
    output [7:0] fibo,
	 output finished
	);
	
	localparam [1:0]
		ini = 2'b00,
		proc = 2'b01,
		done = 2'b10;
	
	reg [7:0] 	t1_reg,t1_next,
					t2_reg,t2_next,
					n_reg,n_next;
	
	reg [1:0] state_reg,state_next;
	reg finished_reg, finished_next;
	
	//Memoria
	always@(posedge clk, posedge reset)
	begin
		if(reset) begin
			t1_reg <= 7'b1;
			t2_reg <= 7'b1;
			n_reg <= n;
			state_reg <= ini;
			finished_reg <= 1'b0;
		end
		else begin
			t1_reg <= t1_next;
			t2_reg <= t2_next;
			n_reg <= n_next;
			finished_reg <= finished_next;
			state_reg <= state_next;
		end
	end
	
	//Logica proximo estado
	always @*
	begin
		t1_next = t1_reg;
		t2_next = t2_reg;
		n_next = n_reg;
		state_next = state_reg;
		finished_next = finished_reg;
		
		case(state_reg)
			ini:
			begin
				t1_next = 8'b0000001;
				t2_next = 8'b0000001;
				finished_next = 1'b0;
				state_next = proc;
				n_next = n;
			end
			proc:
				if(n_reg == 8'b0) begin
					state_next = done;
					finished_next = 1'b1;
				end
				else begin
					t2_next = t2_reg + t1_reg;
					t1_next = t2_reg;
					n_next = n_reg - 1;
					state_next = proc;
				end
			done:
				if(start)
					state_next = ini;
				else
					state_next = done;
		endcase
	end
	
	//Logica salida
	assign fibo = t1_reg;
	assign finished = finished_reg;
endmodule
