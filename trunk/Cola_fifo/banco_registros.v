`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:54:09 05/04/2012 
// Design Name: 
// Module Name:    banco_registros 
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
module banco_registros
#( parameter W=8, // number of bits in a word
	A=4 // number of address bits
)
(
   input clk,
	input wr_en,
   input[A-1:0] address_r,
   input[A-1:0] address_w,
   input[W-1:0] data_in,
	output[W-1:0] data_out
   );

	reg [W-1:0] array_reg [(2**A)-1:0];
	
	always@ (posedge clk)
	begin
		if ( wr_en )
			array_reg[address_w] <= data_in;
	end
	
	assign data_out = array_reg[address_r];
	
	/*
   parameter RAM_WIDTH = <ram_width>;
   parameter RAM_ADDR_BITS = <ram_addr_bits>;
   
   (* RAM_STYLE="{AUTO | BLOCK |  BLOCK_POWER1 | BLOCK_POWER2}" *)
   reg [RAM_WIDTH-1:0] <ram_name> [(2**RAM_ADDR_BITS)-1:0];
   reg [RAM_WIDTH-1:0] <output_data>;

   <reg_or_wire> [RAM_ADDR_BITS-1:0] <address>;
   <reg_or_wire> [RAM_WIDTH-1:0] <input_data>;

   //  The following code is only necessary if you wish to initialize the RAM 
   //  contents via an external file (use $readmemb for binary data)
   initial
      $readmemh("<data_file_name>", <rom_name>, <begin_address>, <end_address>);

   always @(posedge <clock>)
      if (<ram_enable>) begin
         if (<write_enable>)
            <ram_name>[<address>] <= <input_data>;
         <output_data> <= <ram_name>[<address>];
      end
						0;
	
	*/
endmodule
