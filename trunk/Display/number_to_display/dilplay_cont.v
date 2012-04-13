`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:09:47 04/13/2012 
// Design Name: 
// Module Name:    dilplay_cont 
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
module dilplay_cont(
   input [3:0] a,
   input [3:0] b,
	input [1:0] selector,
	input clk,
   output [3:0] an,   // enable, 1-out-of-4 asserted low
   output [7:0] sseg  // led segments
    );
	 
	wire [3:0] sum;
	reg sg;
	wire [7:0] salida1, salida2, salida3;
	wire [3:0] s1, s2, s3;
	reg [3:0] entrada;
	wire [7:0] signo;
	wire sg_temp;

	sumador_sg_mag	sumador	(.a(a), .b(b), .res(sum), .sg(sg_temp) );
	
	always @*
		case (selector)
			2'b10:
			begin
				entrada = {1'b0 , a[2:0]};
				sg = a[3];
			end
			2'b01:
			begin
				entrada = {1'b0 , b[2:0]};
				sg = b[3];
			end
			2'b00, 2'b11:
			begin
				entrada = sum;
				sg = sg_temp;
			end
		endcase

	assign signo = {6'b111111, ~sg };

	bit_to_3hexa_digits	refactor	( .entrada(entrada), .h1(s1), .h2(s2), .h3(s3) );

	hex_to_sseg	numero1	(.hex(s1), .dp(1'b0), .sseg(salida1));
	hex_to_sseg	numero2	(.hex(s2), .dp(1'b0), .sseg(salida2));
	hex_to_sseg	numero3	(.hex(s3), .dp(1'b0), .sseg(salida3));
	
	disp_mux		display	(.in0(salida1), .in1(salida2), .in2(salida3), .in3(signo), .an(an), .sseg(sseg), .clk(clk), .reset(0) );

endmodule
