`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:15:13 04/04/2012 
// Design Name: 
// Module Name:    sumador_adivino 
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
module sumador_adivino(
       input [3:0] a,
       input [3:0] b,
       output reg [4:0] res
);

       always @*
               case ({a[3],b[3]})
                       2'b00:
                               begin
                                       res[3:0] = a[2:0]+b[2:0];
                                       res[4] = 0;
                               end
                       2'b01:
                               begin
                                       if (a[2:0] >= b[2:0])
														begin
                                               res[3:0] = a[2:0]-b[2:0];
                                               res[4] = 0;
														end
                                       else
														begin
                                               res[3:0] = b[2:0]-a[2:0];
                                               res[4] = 1;
														end
                               end
                       2'b10:
                               begin
                                       if (a[2:0] >= b[2:0])
														begin
                                               res[3:0] = a[2:0]-b[2:0];
                                               res[4] = 1;
														end
                                       else
														begin
                                               res[3:0] = b[2:0]-a[2:0];
                                               res[4] = 0;
														end
                               end
                       2'b11:
									begin
                               res[3:0] = a[2:0]+b[2:0];
                               res[4] = 1;
									end
               endcase

endmodule
