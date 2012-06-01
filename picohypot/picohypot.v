`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:10 05/30/2012 
// Design Name: 
// Module Name:    picohypot 
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
// Listing 16.3
module picohypot
   (
    input wire clk, reset,
    input wire [7:0] sw,
    output wire [7:0] sseg,
	 output wire [3:0] an,
	 output wire [7:0] led
   );

   // signal declaration
   // KCPSM3/ROM signals
   wire [9:0] address;
   wire [17:0] instruction;
   wire [7:0] port_id, in_port,out_port;
   wire  write_strobe;
   // register signals
   reg [7:0] led_reg;
   // =====================================================
   //  input interface
   // =====================================================
   assign in_port = sw;

   //body
   // =====================================================
   //  KCPSM and ROM instantiation
   // =====================================================
   kcpsm3 proc_unit
      (.clk(clk), .reset(reset), .address(address),
       .instruction(instruction), .port_id(),
       .write_strobe(write_strobe), .out_port(out_port),
       .read_strobe(), .in_port(in_port), .interrupt(1'b0),
       .interrupt_ack());
   square rom_unit
      (.clk(clk), .address(address),
       .instruction(instruction));
   // =====================================================
   //  output interface
   // =====================================================
   always @(posedge clk)
      if (write_strobe)
         led_reg <= out_port;
   assign led = led_reg;

	display_controller display(
		.clk(clk),
		.reset(reset),
		.entrada(led),
		.sseg(sseg),
		.an(an)
	);
endmodule

