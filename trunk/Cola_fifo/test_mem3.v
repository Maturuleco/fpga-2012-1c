`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:02:32 05/04/2012 
// Design Name: 
// Module Name:    test_mem3 
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
module test_mem3(
   input clk,
	input wr_en,
   input[3:0] address_r,
   input[3:0] address_w,
   input[2:0] data_in,
	output[2:0] data_out,
	output[2:0] data
    );

   RAM16X1D #(
      .INIT(16'h0000) // Initial contents of RAM
   ) RAM16X1D_inst_1 (
      .DPO(data_out[0]),	    // Read-only 1-bit data output for DPRA
      .D(data_in[0]),			 // Write 1-bit data input
      .SPO(data[0]),  				 // R/W 1-bit data output for A0-A3
      .A0(address_w[0]),       // R/W address[0] input bit
      .A1(address_w[1]),       // R/W address[1] input bit
      .A2(address_w[2]),       // R/W address[2] input bit
      .A3(address_w[3]),       // R/W address[3] input bit
      .DPRA0(address_r[0]),	 // Read address[0] input bit
      .DPRA1(address_r[1]),	 // Read address[1] input bit
      .DPRA2(address_r[2]),	 // Read address[2] input bit
      .DPRA3(address_r[3]),	 // Read address[3] input bit
      .WCLK(clk),		 		    // Write clock input
      .WE(wr_en)		          // Write enable input
   );

   RAM16X1D #(
      .INIT(16'h0000) // Initial contents of RAM
   ) RAM16X1D_inst_2 (
      .DPO(data_out[1]),	    // Read-only 1-bit data output for DPRA
      .D(data_in[1]),			 // Write 1-bit data input
      .SPO(data[1]),  				 // R/W 1-bit data output for A0-A3
      .A0(address_w[0]),       // R/W address[0] input bit
      .A1(address_w[1]),       // R/W address[1] input bit
      .A2(address_w[2]),       // R/W address[2] input bit
      .A3(address_w[3]),       // R/W address[3] input bit
      .DPRA0(address_r[0]),	 // Read address[0] input bit
      .DPRA1(address_r[1]),	 // Read address[1] input bit
      .DPRA2(address_r[2]),	 // Read address[2] input bit
      .DPRA3(address_r[3]),	 // Read address[3] input bit
      .WCLK(clk),		 		    // Write clock input
      .WE(wr_en)		          // Write enable input
   );

   RAM16X1D #(
      .INIT(16'h0000) // Initial contents of RAM
   ) RAM16X1D_inst_3 (
      .DPO(data_out[2]),	    // Read-only 1-bit data output for DPRA
      .D(data_in[2]),			 // Write 1-bit data input
      .SPO(data[2]),  				 // R/W 1-bit data output for A0-A3
      .A0(address_w[0]),       // R/W address[0] input bit
      .A1(address_w[1]),       // R/W address[1] input bit
      .A2(address_w[2]),       // R/W address[2] input bit
      .A3(address_w[3]),       // R/W address[3] input bit
      .DPRA0(address_r[0]),	 // Read address[0] input bit
      .DPRA1(address_r[1]),	 // Read address[1] input bit
      .DPRA2(address_r[2]),	 // Read address[2] input bit
      .DPRA3(address_r[3]),	 // Read address[3] input bit
      .WCLK(clk),		 		    // Write clock input
      .WE(wr_en)		          // Write enable input
   );

endmodule
