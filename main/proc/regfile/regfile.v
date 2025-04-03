module regfile (
	clock,
	ctrl_writeEnable, ctrl_reset, ctrl_writeReg,
	ctrl_readRegA, ctrl_readRegB, data_writeReg,
	data_readRegA, data_readRegB
);

	input clock, ctrl_writeEnable, ctrl_reset;
	input [31:0] data_writeReg;
	input [4:0] ctrl_writeReg;

	input [4:0] ctrl_readRegA, ctrl_readRegB;
	output [31:0] data_readRegA, data_readRegB;

	// add your code here

	wire [31:0] tristatereadA, tristatereadB, select_write_reg;

	decoder_32 decoder_A(tristatereadA, 1'b1, ctrl_readRegA);
	decoder_32 decoder_B(tristatereadB, 1'b1, ctrl_readRegB);
	decoder_32 write_reg(select_write_reg, ctrl_writeEnable, ctrl_writeReg);
	
	wire [31:0] reg_out [31:0];

	register_32 reg32_0(reg_out[0], 32'b0, clock, 1'b0, ctrl_reset);
	register_32 reg32_1(reg_out[1], data_writeReg, clock, select_write_reg[1], ctrl_reset);
	register_32 reg32_2(reg_out[2], data_writeReg, clock, select_write_reg[2], ctrl_reset);
	register_32 reg32_3(reg_out[3], data_writeReg, clock, select_write_reg[3], ctrl_reset);
	register_32 reg32_4(reg_out[4], data_writeReg, clock, select_write_reg[4], ctrl_reset);
	register_32 reg32_5(reg_out[5], data_writeReg, clock, select_write_reg[5], ctrl_reset);
	register_32 reg32_6(reg_out[6], data_writeReg, clock, select_write_reg[6], ctrl_reset);
	register_32 reg32_7(reg_out[7], data_writeReg, clock, select_write_reg[7], ctrl_reset);
	register_32 reg32_8(reg_out[8], data_writeReg, clock, select_write_reg[8], ctrl_reset);
	register_32 reg32_9(reg_out[9], data_writeReg, clock, select_write_reg[9], ctrl_reset);
	register_32 reg32_10(reg_out[10], data_writeReg, clock, select_write_reg[10], ctrl_reset);
	register_32 reg32_11(reg_out[11], data_writeReg, clock, select_write_reg[11], ctrl_reset);
	register_32 reg32_12(reg_out[12], data_writeReg, clock, select_write_reg[12], ctrl_reset);
	register_32 reg32_13(reg_out[13], data_writeReg, clock, select_write_reg[13], ctrl_reset);
	register_32 reg32_14(reg_out[14], data_writeReg, clock, select_write_reg[14], ctrl_reset);
	register_32 reg32_15(reg_out[15], data_writeReg, clock, select_write_reg[15], ctrl_reset);
	register_32 reg32_16(reg_out[16], data_writeReg, clock, select_write_reg[16], ctrl_reset);
	register_32 reg32_17(reg_out[17], data_writeReg, clock, select_write_reg[17], ctrl_reset);
	register_32 reg32_18(reg_out[18], data_writeReg, clock, select_write_reg[18], ctrl_reset);
	register_32 reg32_19(reg_out[19], data_writeReg, clock, select_write_reg[19], ctrl_reset);
	register_32 reg32_20(reg_out[20], data_writeReg, clock, select_write_reg[20], ctrl_reset);
	register_32 reg32_21(reg_out[21], data_writeReg, clock, select_write_reg[21], ctrl_reset);
	register_32 reg32_22(reg_out[22], data_writeReg, clock, select_write_reg[22], ctrl_reset);
	register_32 reg32_23(reg_out[23], data_writeReg, clock, select_write_reg[23], ctrl_reset);
	register_32 reg32_24(reg_out[24], data_writeReg, clock, select_write_reg[24], ctrl_reset);
	register_32 reg32_25(reg_out[25], data_writeReg, clock, select_write_reg[25], ctrl_reset);
	register_32 reg32_26(reg_out[26], data_writeReg, clock, select_write_reg[26], ctrl_reset);
	register_32 reg32_27(reg_out[27], data_writeReg, clock, select_write_reg[27], ctrl_reset);
	register_32 reg32_28(reg_out[28], data_writeReg, clock, select_write_reg[28], ctrl_reset);
	register_32 reg32_29(reg_out[29], data_writeReg, clock, select_write_reg[29], ctrl_reset);
	register_32 reg32_30(reg_out[30], data_writeReg, clock, select_write_reg[30], ctrl_reset);
	register_32 reg32_31(reg_out[31], data_writeReg, clock, select_write_reg[31], ctrl_reset);


	tri_state triStateA_0(reg_out[0], tristatereadA[0], data_readRegA); 
	tri_state triStateB_0(reg_out[0], tristatereadB[0], data_readRegB);

	tri_state triStateA_1(reg_out[1], tristatereadA[1], data_readRegA);
	tri_state triStateB_1(reg_out[1], tristatereadB[1], data_readRegB);

	tri_state triStateA_2(reg_out[2], tristatereadA[2], data_readRegA);
	tri_state triStateB_2(reg_out[2], tristatereadB[2], data_readRegB);

	tri_state triStateA_3(reg_out[3], tristatereadA[3], data_readRegA);
	tri_state triStateB_3(reg_out[3], tristatereadB[3], data_readRegB);

	tri_state triStateA_4(reg_out[4], tristatereadA[4], data_readRegA);
	tri_state triStateB_4(reg_out[4], tristatereadB[4], data_readRegB);

	tri_state triStateA_5(reg_out[5], tristatereadA[5], data_readRegA);
	tri_state triStateB_5(reg_out[5], tristatereadB[5], data_readRegB);

	tri_state triStateA_6(reg_out[6], tristatereadA[6], data_readRegA);
	tri_state triStateB_6(reg_out[6], tristatereadB[6], data_readRegB);

	tri_state triStateA_7(reg_out[7], tristatereadA[7], data_readRegA);
	tri_state triStateB_7(reg_out[7], tristatereadB[7], data_readRegB);

	tri_state triStateA_8(reg_out[8], tristatereadA[8], data_readRegA);
	tri_state triStateB_8(reg_out[8], tristatereadB[8], data_readRegB);

	tri_state triStateA_9(reg_out[9], tristatereadA[9], data_readRegA);
	tri_state triStateB_9(reg_out[9], tristatereadB[9], data_readRegB);

	tri_state triStateA_10(reg_out[10], tristatereadA[10], data_readRegA);
	tri_state triStateB_10(reg_out[10], tristatereadB[10], data_readRegB);

	tri_state triStateA_11(reg_out[11], tristatereadA[11], data_readRegA);
	tri_state triStateB_11(reg_out[11], tristatereadB[11], data_readRegB);

	tri_state triStateA_12(reg_out[12], tristatereadA[12], data_readRegA);
	tri_state triStateB_12(reg_out[12], tristatereadB[12], data_readRegB);

	tri_state triStateA_13(reg_out[13], tristatereadA[13], data_readRegA);
	tri_state triStateB_13(reg_out[13], tristatereadB[13], data_readRegB);

	tri_state triStateA_14(reg_out[14], tristatereadA[14], data_readRegA);
	tri_state triStateB_14(reg_out[14], tristatereadB[14], data_readRegB);

	tri_state triStateA_15(reg_out[15], tristatereadA[15], data_readRegA);
	tri_state triStateB_15(reg_out[15], tristatereadB[15], data_readRegB);

	tri_state triStateA_16(reg_out[16], tristatereadA[16], data_readRegA);
	tri_state triStateB_16(reg_out[16], tristatereadB[16], data_readRegB);

	tri_state triStateA_17(reg_out[17], tristatereadA[17], data_readRegA);
	tri_state triStateB_17(reg_out[17], tristatereadB[17], data_readRegB);

	tri_state triStateA_18(reg_out[18], tristatereadA[18], data_readRegA);
	tri_state triStateB_18(reg_out[18], tristatereadB[18], data_readRegB);

	tri_state triStateA_19(reg_out[19], tristatereadA[19], data_readRegA);
	tri_state triStateB_19(reg_out[19], tristatereadB[19], data_readRegB);

	tri_state triStateA_20(reg_out[20], tristatereadA[20], data_readRegA);
	tri_state triStateB_20(reg_out[20], tristatereadB[20], data_readRegB);

	tri_state triStateA_21(reg_out[21], tristatereadA[21], data_readRegA);
	tri_state triStateB_21(reg_out[21], tristatereadB[21], data_readRegB);

	tri_state triStateA_22(reg_out[22], tristatereadA[22], data_readRegA);
	tri_state triStateB_22(reg_out[22], tristatereadB[22], data_readRegB);

	tri_state triStateA_23(reg_out[23], tristatereadA[23], data_readRegA);
	tri_state triStateB_23(reg_out[23], tristatereadB[23], data_readRegB);

	tri_state triStateA_24(reg_out[24], tristatereadA[24], data_readRegA);
	tri_state triStateB_24(reg_out[24], tristatereadB[24], data_readRegB);

	tri_state triStateA_25(reg_out[25], tristatereadA[25], data_readRegA);
	tri_state triStateB_25(reg_out[25], tristatereadB[25], data_readRegB);

	tri_state triStateA_26(reg_out[26], tristatereadA[26], data_readRegA);
	tri_state triStateB_26(reg_out[26], tristatereadB[26], data_readRegB);

	tri_state triStateA_27(reg_out[27], tristatereadA[27], data_readRegA);
	tri_state triStateB_27(reg_out[27], tristatereadB[27], data_readRegB);

	tri_state triStateA_28(reg_out[28], tristatereadA[28], data_readRegA);
	tri_state triStateB_28(reg_out[28], tristatereadB[28], data_readRegB);

	tri_state triStateA_29(reg_out[29], tristatereadA[29], data_readRegA);
	tri_state triStateB_29(reg_out[29], tristatereadB[29], data_readRegB);

	tri_state triStateA_30(reg_out[30], tristatereadA[30], data_readRegA);
	tri_state triStateB_30(reg_out[30], tristatereadB[30], data_readRegB);

	tri_state triStateA_31(reg_out[31], tristatereadA[31], data_readRegA);
	tri_state triStateB_31(reg_out[31], tristatereadB[31], data_readRegB);

endmodule
