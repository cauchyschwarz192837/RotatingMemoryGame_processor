`timescale 1ns / 1ps
/**
 * 
 * READ THIS DESCRIPTION:
 *
 * This is the Wrapper module that will serve as the header file combining your processor, 
 * RegFile and Memory elements together.
 *
 * This file will be used to generate the bitstream to upload to the FPGA.
 * We have provided a sibling file, Wrapper_tb.v so that you can test your processor's functionality.
 * 
 * We will be using our own separate Wrapper_tb.v to test your code. You are allowed to make changes to the Wrapper files 
 * for your own individual testing, but we expect your final processor.v and memory modules to work with the 
 * provided Wrapper interface.
 * 
 * Refer to Lab 5 documents for detailed instructions on how to interface 
 * with the memory elements. Each imem and dmem modules will take 12-bit 
 * addresses and will allow for storing of 32-bit values at each address. 
 * Each memory module should receive a single clock. At which edges, is 
 * purely a design choice (and thereby up to you). 
 * 
 * You must change line 36 to add the memory file of the test you created using the assembler
 * For example, you would add sample inside of the quotes on line 38 after assembling sample.s
 *
 **/

module Wrapper (clock, reset, hSync, vSync, VGA_R, VGA_G, VGA_B, BTNR, BTNL, BTNU, BTND);
	input clock, reset;
	output hSync, vSync;
	output [3:0] VGA_R;
	output [3:0] VGA_G;
	output [3:0] VGA_B;
	input BTNR;
    input BTNL;
    input BTNU;
    input BTND;

	wire rwe, mwe;
	wire[4:0] rd, rs1, rs2;
	wire[31:0] instAddr, instData, 
		rData, regA, regB,
		memAddr, memDataIn, memDataOut;

	wire [9:0] block_x;
	wire [8:0] block_y;

	wire b1_ON;
    wire b2_ON;
    wire b3_ON;
    wire b4_ON;
    wire b5_ON;
    wire b6_ON;
    wire b7_ON;
    wire b8_ON;
    wire b9_ON;
    wire b10_ON;
    wire b11_ON;
    wire b12_ON;
    wire b13_ON;
    wire b14_ON;
    wire b15_ON;
    wire b16_ON;

    wire [11:0] b1_COLOR;
    wire [11:0] b2_COLOR;
    wire [11:0] b3_COLOR;
    wire [11:0] b4_COLOR;
    wire [11:0] b5_COLOR;
    wire [11:0] b6_COLOR;
    wire [11:0] b7_COLOR;
    wire [11:0] b8_COLOR;
    wire [11:0] b9_COLOR;
    wire [11:0] b10_COLOR;
    wire [11:0] b11_COLOR;
    wire [11:0] b12_COLOR;
    wire [11:0] b13_COLOR;
    wire [11:0] b14_COLOR;
    wire [11:0] b15_COLOR;
    wire [11:0] b16_COLOR;

	wire b1_SOLVED;
    wire b2_SOLVED;
    wire b3_SOLVED;
    wire b4_SOLVED;
    wire b5_SOLVED;
    wire b6_SOLVED;
    wire b7_SOLVED;
    wire b8_SOLVED;
    wire b9_SOLVED;
    wire b10_SOLVED;
    wire b11_SOLVED;
    wire b12_SOLVED;
    wire b13_SOLVED;
    wire b14_SOLVED;
    wire b15_SOLVED;
    wire b16_SOLVED;

	// ADD YOUR MEMORY FILE HERE
	localparam INSTR_FILE = "main";
	
	// Main Processing Unit
	processor CPU(.clock(clock), .reset(reset), 
								
		// ROM
		.address_imem(instAddr), .q_imem(instData),
									
		// Regfile
		.ctrl_writeEnable(rwe),     .ctrl_writeReg(rd),
		.ctrl_readRegA(rs1),     .ctrl_readRegB(rs2), 
		.data_writeReg(rData), .data_readRegA(regA), .data_readRegB(regB),
									
		// RAM
		.wren(mwe), .address_dmem(memAddr), 
		.data(memDataIn), .q_dmem(memDataOut)); 
	
	// Instruction Memory (ROM)
	ROM #(.MEMFILE({INSTR_FILE, ".mem"}))
	InstMem(.clk(clock), 
		.addr(instAddr[11:0]), 
		.dataOut(instData));
	
	// Register File
	regfile RegisterFile(.clock(clock), 
		.ctrl_writeEnable(rwe), .ctrl_reset(reset), 
		.ctrl_writeReg(rd),
		.ctrl_readRegA(rs1), .ctrl_readRegB(rs2), 
		.data_writeReg(rData), .data_readRegA(regA), .data_readRegB(regB), 
		.block_x(block_x), .block_y(block_y));
						
	// Processor Memory (RAM)
	RAM ProcMem(.clk(clock), 
		.wEn(mwe), 
		.addr(memAddr[11:0]), 
		.dataIn(memDataIn), 
		.dataOut(memDataOut),

		.b1_ON(b1_ON),
		.b2_ON(b2_ON),
		.b3_ON(b3_ON),
		.b4_ON(b4_ON),
		.b5_ON(b5_ON),
		.b6_ON(b6_ON),
		.b7_ON(b7_ON),
		.b8_ON(b8_ON),
		.b9_ON(b9_ON),
		.b10_ON(b10_ON),
		.b11_ON(b11_ON),
		.b12_ON(b12_ON),
		.b13_ON(b13_ON),
		.b14_ON(b14_ON),
		.b15_ON(b15_ON),
		.b16_ON(b16_ON),
		.b1_COLOR(b1_COLOR),
		.b2_COLOR(b2_COLOR),
		.b3_COLOR(b3_COLOR),
		.b4_COLOR(b4_COLOR),
		.b5_COLOR(b5_COLOR),
		.b6_COLOR(b6_COLOR),
		.b7_COLOR(b7_COLOR),
		.b8_COLOR(b8_COLOR),
		.b9_COLOR(b9_COLOR),
		.b10_COLOR(b10_COLOR),
		.b11_COLOR(b11_COLOR),
		.b12_COLOR(b12_COLOR),
		.b13_COLOR(b13_COLOR),
		.b14_COLOR(b14_COLOR),
		.b15_COLOR(b15_COLOR),
		.b16_COLOR(b16_COLOR),

		.b1_SOLVED(b1_SOLVED),
		.b2_SOLVED(b2_SOLVED),
		.b3_SOLVED(b3_SOLVED),
		.b4_SOLVED(b4_SOLVED),
		.b5_SOLVED(b5_SOLVED),
		.b6_SOLVED(b6_SOLVED),
		.b7_SOLVED(b7_SOLVED),
		.b8_SOLVED(b8_SOLVED),
		.b9_SOLVED(b9_SOLVED),
		.b10_SOLVED(b10_SOLVED),
		.b11_SOLVED(b11_SOLVED),
		.b12_SOLVED(b12_SOLVED),
		.b13_SOLVED(b13_SOLVED),
		.b14_SOLVED(b14_SOLVED),
		.b15_SOLVED(b15_SOLVED),
		.b16_SOLVED(b16_SOLVED));

	VGAController screenRender(
		.clk(clock),
		.reset(reset),
		.hSync(hSync),
		.vSync(vSync),
		.VGA_R(VGA_R),
		.VGA_G(VGA_G),
		.VGA_B(VGA_B),
		.BTNR(BTNR),
		.BTNL(BTNL),
		.BTNU(BTNU),
		.BTND(BTND),

		.block_x(block_x), // output to regFile
		.block_y(block_y), // output to regFile
		
		.b1_ON(b1_ON),
		.b2_ON(b2_ON),
		.b3_ON(b3_ON),
		.b4_ON(b4_ON),
		.b5_ON(b5_ON),
		.b6_ON(b6_ON),
		.b7_ON(b7_ON),
		.b8_ON(b8_ON),
		.b9_ON(b9_ON),
		.b10_ON(b10_ON),
		.b11_ON(b11_ON),
		.b12_ON(b12_ON),
		.b13_ON(b13_ON),
		.b14_ON(b14_ON),
		.b15_ON(b15_ON),
		.b16_ON(b16_ON),

		.b1_COLOR(b1_COLOR),
		.b2_COLOR(b2_COLOR),
		.b3_COLOR(b3_COLOR),
		.b4_COLOR(b4_COLOR),
		.b5_COLOR(b5_COLOR),
		.b6_COLOR(b6_COLOR),
		.b7_COLOR(b7_COLOR),
		.b8_COLOR(b8_COLOR),
		.b9_COLOR(b9_COLOR),
		.b10_COLOR(b10_COLOR),
		.b11_COLOR(b11_COLOR),
		.b12_COLOR(b12_COLOR),
		.b13_COLOR(b13_COLOR),
		.b14_COLOR(b14_COLOR),
		.b15_COLOR(b15_COLOR),
		.b16_COLOR(b16_COLOR),

		.b1_SOLVED(b1_SOLVED),
    	.b2_SOLVED(b2_SOLVED),
    	.b3_SOLVED(b3_SOLVED),
    	.b4_SOLVED(b4_SOLVED),
    	.b5_SOLVED(b5_SOLVED),
    	.b6_SOLVED(b6_SOLVED),
     	.b7_SOLVED(b7_SOLVED),
    	.b8_SOLVED(b8_SOLVED),
    	.b9_SOLVED(b9_SOLVED),
    	.b10_SOLVED(b10_SOLVED),
    	.b11_SOLVED(b11_SOLVED),
    	.b12_SOLVED(b12_SOLVED),
    	.b13_SOLVED(b13_SOLVED),
    	.b14_SOLVED(b14_SOLVED),
    	.b15_SOLVED(b15_SOLVED),
    	.b16_SOLVED(b16_SOLVED));

endmodule
