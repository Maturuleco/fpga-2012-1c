////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2009 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: L.33
//  \   \         Application: netgen
//  /   /         Filename: adder_32.v
// /___/   /\     Timestamp: Wed May 16 12:48:56 2012
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog D:\FPGA_MHPJPD\pipeline_128_adder\_cg\adder_32.ngc D:\FPGA_MHPJPD\pipeline_128_adder\_cg\adder_32.v 
// Device	: 3s200ft256-4
// Input file	: D:/FPGA_MHPJPD/pipeline_128_adder/_cg/adder_32.ngc
// Output file	: D:/FPGA_MHPJPD/pipeline_128_adder/_cg/adder_32.v
// # of Modules	: 1
// Design Name	: adder_32
// Xilinx        : C:\Xilinx\11.1\ISE
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Development System Reference Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module adder_32 (
  sclr, c_in, c_out, clk, a, b, s
);
  input sclr;
  input c_in;
  output c_out;
  input clk;
  input [3 : 0] a;
  input [3 : 0] b;
  output [3 : 0] s;
  
  // synthesis translate_off
  
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire [3 : 0] a_2;
  wire [3 : 0] b_3;
  wire [3 : 0] s_4;
  wire [3 : 0] \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple ;
  wire [3 : 0] \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum ;
  wire [3 : 0] \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple ;
  assign
    a_2[3] = a[3],
    a_2[2] = a[2],
    a_2[1] = a[1],
    a_2[0] = a[0],
    b_3[3] = b[3],
    b_3[2] = b[2],
    b_3[1] = b[1],
    b_3[0] = b[0],
    s[3] = s_4[3],
    s[2] = s_4[2],
    s[1] = s_4[1],
    s[0] = s_4[0];
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<0>1  (
    .I0(b_3[0]),
    .I1(a_2[0]),
    .O(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<1>1  (
    .I0(b_3[1]),
    .I1(a_2[1]),
    .O(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<2>1  (
    .I0(b_3[2]),
    .I1(a_2[2]),
    .O(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/Mxor_halfsum_Result<3>1  (
    .I0(b_3[3]),
    .I1(a_2[3]),
    .O(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [3])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q_c_out.i_simple.add_q_cout.q_c_outreg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [3]),
    .R(sclr),
    .Q(c_out)
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_1  (
    .C(clk),
    .D(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [0]),
    .R(sclr),
    .Q(s_4[0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_2  (
    .C(clk),
    .D(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [1]),
    .R(sclr),
    .Q(s_4[1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_3  (
    .C(clk),
    .D(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [2]),
    .R(sclr),
    .Q(s_4[2])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_q.i_simple.qreg/fd/output_4  (
    .C(clk),
    .D(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [3]),
    .R(sclr),
    .Q(s_4[3])
  );
  MUXCY   \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_need_mux.carrymux0  (
    .CI(c_in),
    .DI(a_2[0]),
    .S(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [0]),
    .O(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [0])
  );
  XORCY   \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.carryxor0  (
    .CI(c_in),
    .LI(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [0]),
    .O(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [0])
  );
  XORCY   \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carryxortop  (
    .CI(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [2]),
    .LI(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [3]),
    .O(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [3])
  );
  MUXCY   \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.muxtop.carrymuxtop  (
    .CI(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [2]),
    .DI(a_2[3]),
    .S(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [3]),
    .O(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [3])
  );
  MUXCY   \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[1].carrymux  (
    .CI(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [0]),
    .DI(a_2[1]),
    .S(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [1]),
    .O(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [1])
  );
  XORCY   \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[1].carryxor  (
    .CI(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [0]),
    .LI(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [1]),
    .O(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [1])
  );
  MUXCY   \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[2].carrymux  (
    .CI(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [1]),
    .DI(a_2[2]),
    .S(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [2]),
    .O(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [2])
  );
  XORCY   \BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/i_simple_model.i_gt_1.carrychaingen[2].carryxor  (
    .CI(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/carry_simple [1]),
    .LI(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/halfsum [2]),
    .O(\BU2/U0/i_baseblox.i_baseblox_addsub/no_pipelining.the_addsub/i_lut4.i_lut4_addsub/sum_simple [2])
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire PRLD;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
