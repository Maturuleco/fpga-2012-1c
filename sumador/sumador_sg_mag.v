`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:37:02 04/04/2012 
// Design Name: 
// Module Name:    sumador_sg_mag 
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
module sumador_sg_mag(
   input [3:0] a,
   input [3:0] b,
   output reg [3:0] res,
	output reg sg
   );

	reg [2:0] as, bs;
	wire [3:0] res_s;
	full_add3 sum (.a(as), .b(bs), .r(res_s) );
	
	reg [2:0] ar, br;
	wire [2:0] res_r;
	restador rs (.a(ar), .b(br), .res(res_r));
	 
	 always @*
	 begin
	 as = 0;
	 bs = 0;
	 ar = 0;
	 br = 0;
	 case ({a[3], b[3]})
					  2'b00, 2'b11:
								 begin
										res = res_s;
										as = a[2:0];
										bs = b[2:0];
										sg = a[3];
								 end
					  2'b01, 2'b10:
								 begin
										if (a[2:0] >= b[2:0])
											begin
												res = res_r;
												ar = a[2:0];
												br = b[2:0];
												sg = a[3];
											end
										 else
											begin
												res = res_r;
												ar = b[2:0];
												br = a[2:0];
												sg = b[3];
											end
								 end
			endcase
		end


endmodule
