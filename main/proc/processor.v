/**
 * READ THIS DESCRIPTION!
 *
 * This is your processor module that will contain the bulk of your code submission. You are to implement
 * a 5-stage pipelined processor in this module, accounting for hazards and implementing bypasses as
 * necessary.
 *
 * Ultimately, your processor will be tested by a master skeleton, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file, Wrapper.v, acts as a small wrapper around your processor for this purpose. Refer to Wrapper.v
 * for more details.
 *
 * As a result, this module will NOT contain the RegFile nor the memory modules. Study the inputs 
 * very carefully - the RegFile-related I/Os are merely signals to be sent to the RegFile instantiated
 * in your Wrapper module. This is the same for your memory elements. 
 *
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for RegFile
    ctrl_writeReg,                  // O: Register to write to in RegFile
    ctrl_readRegA,                  // O: Register to read from port A of RegFile
    ctrl_readRegB,                  // O: Register to read from port B of RegFile
    data_writeReg,                  // O: Data to write to for RegFile
    data_readRegA,                  // I: Data from port A of RegFile
    data_readRegB                   // I: Data from port B of RegFile
	 
	);

	// Control signals
	input clock, reset;
	
	// Imem
    output [31:0] address_imem;
	input [31:0] q_imem;

	// 
	output [31:0] address_dmem, data;
	output wren;
	input [31:0] q_dmem;

	// Regfile
	output ctrl_writeEnable;
	output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	output [31:0] data_writeReg;
	input [31:0] data_readRegA, data_readRegB;


	/* YOUR CODE STARTS HERE */

    wire [4:0] ctrl_readRegtemp, ctrl_writeRegtemp;

    wire [4:0] opcode, rd, rs, rt, shamt, ALU_op, 
        FD_opcode, FD_rd, FD_rs, FD_rt, FD_shamt, FD_ALU_op, 
        DX_opcode, DX_rd, DX_rs, DX_rt, DX_shamt, DX_ALU_op,
        XM_opcode, XM_rd, XM_rs, XM_rt, XM_shamt, XM_ALU_op,
        MW_opcode, MW_rd, MW_rs, MW_rt, MW_shamt, MW_ALU_op;
    wire [16:0] immed, FD_immed, DX_immed, XM_immed, MW_immed;
    wire [26:0] targ, FD_targ, DX_targ, XM_targ, MW_targ;

    wire isNotEqual, isLessThan, overflow, isNotEqual_2, isLessThan_2, overflow_2;
    wire [31:0] PC, PC_next, PC_plusone, FDout_PC, FDout_2, FDout_3, FDout_IR, DXout_PC, DXout_A, DXout_B, DXout_IR, XMDout_1, XMDout_2, XMDout_3, XMDout_4, MWDout_1, MWout_2, MWout_3, MWout_4;
    wire [31:0] alu_result_temp, alu_result_temp_w_imm, sign_extend_immed, DX_data_writeReg, multdiv_result, new_address, DX_data_writeReg_2, new_address_2;
    wire ovf, ctrl_MULT, ctrl_DIV, data_exception, data_resultRDY, my_counter_reset, turn_off, ctrl_DIV_initial, ctrl_MULT_initial, latch_enable, stall_enable;
    wire [4:0] counter_out;
    wire [31:0] PC_or_Reg, X_to_M, D_to_X, PC_or_Reg_or_Rs, DX_data_writeReg_3, altDXout_4;
    wire multdiv_alarm, diff_latch_enable, do_bex, checK_rstat_1, checK_rstat_2, checK_rstat_3, checK_rstat_4, checK_rstat_5, there_is_rs, not_in_use_1, not_in_use_2, not_in_use_3, can_bypass_1, can_bypass_2;
    wire [31:0] rstat_1, rstat_2, rstat_3, rstat_4, rstat_5, rs_temp_1, actualrs, alt_FDout_IR, DXout_1_plus_one;
    wire [31:0] ALU_input_A_check1, ALU_input_A_check2, ALU_input_A_check3, ALU_input_B_check1, ALU_input_B_check2, ALU_input_B_check3, WM_bypass, stall, account_stall, status_result;

    // useless
    wire isneq, islt;

    assign diff_latch_enable = 1'b1;

    //----------------------------------------- Handling PC

    assign PC = reset ? 32'b0 : PC_next;
    adder32 PC_increment(PC, 32'b1, 1'b0, PC_plusone, isneq, islt, ovf);

    assign address_imem = (DX_opcode == 5'b00001 || 
        DX_opcode == 5'b00011 || 
        DX_opcode == 5'b00100 || 
        (DX_opcode == 5'b00010 && isNotEqual == 1'b1) ||
        (DX_opcode == 5'b00110 && isLessThan == 1'b1) || 
        (DX_opcode == 5'b10110 && do_bex == 1'b1)) ? new_address_2 : PC_plusone;

    register_32 PC_reg(PC_next, address_imem, ~clock, stall_enable, reset);

    //----------------------------------------- Fetch Instruction

    // R type
    assign opcode = q_imem[31:27];
    assign rd = q_imem[26:22];
    assign rs = q_imem[21:17];
    assign rt = q_imem[16:12];
    assign shamt = q_imem[11:7];
    assign ALU_op = q_imem[6:2];

    // I type
    assign immed = q_imem[16:0];

    // JI type
    assign targ = q_imem[26:0];
    
    //----------------------------------------- Decode Instruction

    latch FD_latch(~clock, stall_enable, reset, address_imem, 32'b0, 32'b0, q_imem, FDout_PC, FDout_2, FDout_3, FDout_IR);

    // R type
    assign FD_opcode = FDout_IR[31:27];
    assign FD_rd = FDout_IR[26:22];
    assign FD_rs = FDout_IR[21:17];
    assign FD_rt = FDout_IR[16:12];
    assign FD_shamt = FDout_IR[11:7];
    assign FD_ALU_op = FDout_IR[6:2];

    // I type
    assign FD_immed = FDout_IR[16:0];

    // JI type
    assign FD_targ = FDout_IR[26:0];

    assign ctrl_readRegtemp = (FD_opcode == 5'b00100 || 
        FD_opcode == 5'b00010 || 
        FD_opcode == 5'b00110 || 
        FD_opcode == 5'b00111) ? FD_rd : FD_rs;
    assign ctrl_readRegA = (FD_opcode == 5'b10110) ?  5'd30: ctrl_readRegtemp; // 30 (bex), rd (bne, blt, jr, sw), rs (rest)
    assign ctrl_readRegB = (FD_opcode == 5'b00100 || 
        FD_opcode == 5'b00010 || 
        FD_opcode == 5'b00110 || 
        FD_opcode == 5'b00111 || 
        FD_opcode == 5'b01000) ? FD_rs : FD_rt; // rs (bne, blt, jr, sw, lw), rt (rest)

    assign alt_FDout_IR = (DX_opcode == 5'b00001 || 
        DX_opcode == 5'b00011 || 
        stall == 1'b1 || 
        DX_opcode == 5'b00100 || 
        (DX_opcode == 5'b00010 && isNotEqual == 1'b1) || 
        (DX_opcode == 5'b00110 && isLessThan == 1'b1) || 
        (DX_opcode == 5'b10110 && do_bex == 1'b1)) ? 32'b0 : FDout_IR;

    // Stall logic
    assign stall = (((DX_opcode == 5'b00111 && FD_opcode == 5'b00111) && (DX_rd ==  FD_rd))
    || ((DX_opcode == 5'b01000 && FD_ALU_op == 5'b00110) && ((DX_rd == FD_rs) || (DX_rd == FD_rt)))
    || ((XM_opcode == 5'b01000 && FD_ALU_op == 5'b00110) && ((XM_rd == FD_rs) || (XM_rd == FD_rt)))
    || (DX_opcode == 5'b01000 && 
        ((DX_rd == FD_rs) || 
            (DX_opcode != 5'b00111 && DX_rd == FD_rt && DX_opcode == 5'b00000 && DX_ALU_op != 5'b00100 && DX_ALU_op != 5'b00101) || 
        ((FD_opcode == 5'b00010 || FD_opcode == 5'b00110 || FD_opcode == 5'b00100) && (DX_rd == FD_rd))))) ? 1'b1 : 1'b0;

    assign stall_enable = (stall == 1'b1 || latch_enable == 1'b0) ? 1'b0 : 1'b1;

    //----------------------------------------- Execute

    latch DX_latch(~clock, latch_enable, reset, FDout_PC, data_readRegA, data_readRegB, alt_FDout_IR, DXout_PC, DXout_A, DXout_B, DXout_IR);

    // R type
    assign DX_opcode = DXout_IR[31:27];
    assign DX_rd = DXout_IR[26:22];
    assign DX_rs = DXout_IR[21:17];
    assign DX_rt = DXout_IR[16:12];
    assign DX_shamt = DXout_IR[11:7];
    assign DX_ALU_op = DXout_IR[6:2];

    // I type
    assign DX_immed = DXout_IR[16:0];

    // JI type
    assign DX_targ = DXout_IR[26:0];
    assign sign_extend_immed = (DX_immed[16]) ? {15'b111111111111111, DX_immed} : {15'b000000000000000, DX_immed};

    // Bypass logic
    assign can_bypass_1 = (MWout_4[31:27] != 5'b00111) 
        && (MWout_4[31:27] != 5'b00010) 
        && (MWout_4[31:27] != 5'b00110) 
        && (MWout_4[31:27] != 5'b00100) 
        && (MWout_4[31:27] != 5'b00001) 
        && (MWout_4[31:27] != 5'b10110);

    assign can_bypass_2 = (XMDout_4[31:27] != 5'b00111) 
        && (XMDout_4[31:27] != 5'b00010) 
        && (XMDout_4[31:27] != 5'b00110) 
        && (XMDout_4[31:27] != 5'b00100) 
        && (XMDout_4[31:27] != 5'b00001) 
        && (XMDout_4[31:27] != 5'b10110);

    assign ALU_input_A_check1 =
    (can_bypass_1 == 1'b1 &&
     (
         // [A] rs == 31 (11111) and MW is jal (00011)
       (DXout_IR[21:17] == 5'b11111 && MWout_4[31:27] == 5'b00011)

         // [B] rs (21:17) == MW’s rd != 0, and the DX instruction is R-type (00000) or addi (00101)
    || ((DXout_IR[21:17] == MWout_4[26:22])
        && MWout_4[26:22] != 5'b00000
        && (DXout_IR[31:27] == 5'b00000 || DXout_IR[31:27] == 5'b00101))

         // [C] If the DX opcode is bne (00010), blt (00110), jr (00100), or sw (00111), and the "rd" fields match or special jal/setx cases
    || ((DX_opcode == 5'b00010 || DX_opcode == 5'b00110 || DX_opcode == 5'b00100 || DX_opcode == 5'b00111)
        && ((DXout_IR[26:22] == MWout_4[26:22] && MWout_4[26:22] != 5'b00000)
            || (DXout_IR[26:22] == 5'b11111 && MWout_4[31:27] == 5'b00011)
            || (DXout_IR[26:22] == 5'b11110 && MWout_4[31:27] == 5'b10101)))

         // [D] rs == 30 (11110) and MW is setx (10101)
    || (DXout_IR[21:17] == 5'b11110 && MWout_4[31:27] == 5'b10101)))? data_writeReg : DXout_A;

    assign ALU_input_A_check2 =
    (can_bypass_2 == 1'b1 && 
    (
         // [A] rs == 31 (11111) and XM is jal (00011)
        (DXout_IR[21:17] == 5'b11111 && XMDout_4[31:27] == 5'b00011)

         // [B] rs (21:17) == XM's rd != 0, and the DX instruction is R-type (00000) or addi (00101)
    || (DXout_IR[21:17] == XMDout_4[26:22]
        && XMDout_4[26:22] != 5'b00000
        && (DXout_IR[31:27] == 5'b00000 || DXout_IR[31:27] == 5'b00101))

         // [C] If the DX opcode is bne (00010), blt (00110), jr (00100), or sw (00111), and the "rd" fields match or special jal case
        || ((DX_opcode == 5'b00010 || DX_opcode == 5'b00110 || DX_opcode == 5'b00100 || DX_opcode == 5'b00111)
            && ((DXout_IR[26:22] == XMDout_4[26:22] && XMDout_4[26:22] != 5'b00000)
            || (DXout_IR[26:22] == 5'b11111 && XMDout_4[31:27] == 5'b00011))))) ? X_to_M : ALU_input_A_check1;

    assign ALU_input_A_check3 = 
    (
         // (1) The DX instruction is bne(00010), blt(00110), or jr(00100) AND it reads from the 'rd' field, AND that 'rd' is r30 (11110), AND the XM stage is setx (10101)
       ((DXout_IR[26:22] == 5'b11110 && XMDout_4[31:27] == 5'b10101)
        && (DX_opcode == 5'b00010 || DX_opcode == 5'b00110 || DX_opcode == 5'b00100 || DX_opcode == 5'b10110))

         // (2) OR the DX instruction is any other instruction reading 'rs' == r30 (11110) while XM is setx (10101)
    || (DXout_IR[21:17] == 5'b11110 && XMDout_4[31:27] == 5'b10101)) ? status_result : ALU_input_A_check2;







    assign ALU_input_B_check1 = (can_bypass_1 == 1'b1 
    && ((DXout_IR[16:12] == 5'b11111 && MWout_4[31:27] == 5'b00011) 
    || (DXout_IR[16:12] == MWout_4[26:22] && DX_opcode == 5'b00000 && MWout_4[26:22] != 5'b00000) 
    || ((DX_opcode == 5'b00010 || DX_opcode == 5'b00110 || DX_opcode == 5'b00111 || DX_opcode == 5'b01000) && ((DXout_IR[21:17] == MWout_4[26:22] && MWout_4[26:22] != 5'b00000) || (DXout_IR[21:17] == 5'b11111 && MWout_4[31:27] == 5'b00011) || (DXout_IR[21:17] == 5'b11110 && MWout_4[31:27] == 5'b10101))) || 
    (DXout_IR[16:12] == 5'b11110 && MWout_4[31:27] == 5'b10101))) ? data_writeReg: DXout_B;

    assign ALU_input_B_check2 = (can_bypass_2 == 1'b1 
    && ((DXout_IR[16:12] == 5'b11111 && XMDout_4[31:27] == 5'b00011) 
    || (DXout_IR[16:12] == XMDout_4[26:22] && DX_opcode == 5'b00000 && XMDout_4[26:22] != 5'b00000) 
    || ((DX_opcode == 5'b00010 || DX_opcode == 5'b00110 || DX_opcode == 5'b00111 || DX_opcode == 5'b01000) && ((DXout_IR[21:17] == XMDout_4[26:22] &&  XMDout_4[26:22] != 5'b00000) || (DXout_IR[21:17] == 5'b11111 && XMDout_4[31:27] == 5'b00011) || (DXout_IR[21:17] == 5'b11110 && XMDout_4[31:27] == 5'b10101))))) ? X_to_M : ALU_input_B_check1;

    assign ALU_input_B_check3 = (((DX_opcode == 5'b00010 || DX_opcode == 5'b00110 || DX_opcode == 5'b00111 || DX_opcode == 5'b01000) && (DXout_IR[21:17] == 5'b11110 && XMDout_4[31:27] == 5'b10101)) || (DXout_IR[16:12] == 5'b11110 && XMDout_4[31:27] == 5'b10101)) ? status_result : ALU_input_B_check2;











    alu ALU1(ALU_input_A_check3, ALU_input_B_check3, DX_ALU_op, DX_shamt, alu_result_temp, isNotEqual, isLessThan, overflow);

    alu ALU2(DXout_PC, 32'b1, 5'b0, 5'b0, DXout_1_plus_one, not_in_use_1, not_in_use_2, not_in_use_3);

    assign PC_or_Reg = (DX_opcode == 5'b00010 || DX_opcode == 5'b00110) ? DXout_1_plus_one : ALU_input_A_check3; // Choosing between PC (for bne and blt) and normal Rs

    assign PC_or_Reg_or_Rs = (DX_opcode == 5'b00111 || DX_opcode == 5'b01000) ? ALU_input_B_check3 : PC_or_Reg; // Choosing between rs or rd in case of lw or sw

    alu ALU3(PC_or_Reg_or_Rs, sign_extend_immed, 5'b0, DX_shamt, alu_result_temp_w_imm, isNotEqual_2, isLessThan_2, overflow_2); // ALU for immed values

    assign DX_data_writeReg = (DX_opcode[0] == 1'b1 || DX_opcode == 5'b00111 || DX_opcode == 5'b01000) ? alu_result_temp_w_imm : alu_result_temp; // for lw, sw, or addi use immed value

    assign DX_data_writeReg_2 = (DX_opcode == 5'b00011) ? DXout_1_plus_one : DX_data_writeReg; //incase jal instruction than just take PC


    //----------------------------------------------------------------

    wire [31:0] DXout_2_bypassed;
    assign DXout_2_bypassed = ((DX_opcode == 5'b10110 && MWout_4[31:27] == 5'b10101) || (DX_opcode == 5'b10110 && XMDout_4[31:27] == 5'b10101)) ? status_result : DXout_A;
    assign do_bex = (DXout_2_bypassed != 32'b0) ? 1'b1 : 1'b0;

    //----------------------------------------------------------------


    assign new_address = (DX_opcode == 5'b00100) ? ALU_input_A_check3 : {PC[31:27], DX_targ}; // incase jr then choose rd

    assign new_address_2 = ((DX_opcode == 5'b00010 && isNotEqual == 1'b1) || (DX_opcode == 5'b00110 && isLessThan == 1'b1)) ? alu_result_temp_w_imm : new_address;

    assign D_to_X = (DX_opcode == 5'b00111) ? ALU_input_A_check3 : ALU_input_B_check3; // D_to_X = $rd if sw

    // when multdiv, make ctrl_mult or ctrl_div high, turn off write enable and turn it back on when data ready is pulsed

    assign multdiv_alarm = (DX_ALU_op == 5'b00110 || DX_ALU_op == 5'b00111) ? 1'b1 : 1'b0; // sound the alarm when multdiv

    assign ctrl_MULT = (DX_ALU_op == 5'b00110 && counter_out == 5'b00000) ? 1'b1 : 1'b0; // turn ctrl_mult on only for one cycle --> when ALU_op and counter is 0

    assign ctrl_DIV = (DX_ALU_op == 5'b00111 && counter_out == 5'b00000) ? 1'b1 : 1'b0; // turn ctrl_div on only for one cycle --> when ALU_op and counter is 0

    multdiv my_multdiv(ALU_input_A_check3, ALU_input_B_check3, ctrl_MULT, ctrl_DIV, clock, multdiv_result, data_exception, data_resultRDY); // do ze operation

    assign my_counter_reset = ((DX_ALU_op == 5'b00110 && counter_out != 5'b01111) || (DX_ALU_op == 5'b00111 && counter_out != 5'b11111)) ? 1'b0 : 1'b1; // reset counter once data result is ready

    counter_32 tempCounter(1'b1, ~clock, counter_out, my_counter_reset);

    assign DX_data_writeReg_3 = (DX_opcode == 5'b00000 && (DX_ALU_op == 5'b00110 || DX_ALU_op == 5'b00111)) ? multdiv_result : DX_data_writeReg_2; // choose multdiv output is ALU operation and current ALU code

    assign latch_enable = (((DX_ALU_op == 5'b00110 && data_resultRDY == 1'b0) || (DX_ALU_op == 5'b00111 && data_resultRDY == 1'b0)) && DX_opcode == 5'b00000) ? 1'b0 : 1'b1; // turn latches off if multdiv operation and result not ready

    // Checking for status registers

    assign rstat_1 = (DX_ALU_op == 5'b00000 && DX_opcode == 5'b00000) && (overflow == 1'b1) ? 32'b1 : 32'b0;
    assign rstat_2 = (DX_opcode == 5'b00101 && overflow_2 == 1'b1) ? 32'd2 : 32'b0;
    assign rstat_3 = (DX_ALU_op == 5'b00001 && overflow == 1'b1 && DX_opcode == 5'b00000) ? 32'd3 : 32'b0;
    assign rstat_4 = (DX_ALU_op == 5'b00110 && data_exception == 1'b1 && DX_opcode == 5'b00000) ? 32'd4 : 32'b0;
    assign rstat_5 = (DX_ALU_op == 5'b00111 && data_exception == 1'b1 && DX_opcode == 5'b00000) ? 32'd5 : 32'b0;

    assign checK_rstat_1 = (DX_ALU_op == 5'b00000 && overflow == 1'b1 && DX_opcode == 5'b00000) ? 1'b1 : 1'b0;
    assign checK_rstat_2 = (DX_opcode == 5'b00101 && overflow_2 == 1'b1) ? 1'b1 : 1'b0;
    assign checK_rstat_3 = (DX_ALU_op == 5'b00001 && overflow == 1'b1 && DX_opcode == 5'b00000) ? 1'b1 : 1'b0;
    assign checK_rstat_4 = (DX_ALU_op == 5'b00110 && data_exception == 1'b1 && DX_opcode == 5'b00000) ? 1'b1 : 1'b0;
    assign checK_rstat_5 = (DX_ALU_op == 5'b00111 && data_exception == 1'b1 && DX_opcode == 5'b00000) ? 1'b1 : 1'b0;

    or finalchecl(there_is_rs, checK_rstat_1, checK_rstat_2, checK_rstat_3, checK_rstat_4, checK_rstat_5);
    mux_8 chooser(rs_temp_1, DX_ALU_op[2:0], rstat_1, rstat_3, 0, 0, 0, 0, rstat_4, rstat_5);

    assign actualrs = (DX_opcode == 5'b00101) ? rstat_2 : rs_temp_1;
    assign altDXout_4 = (there_is_rs == 1'b1) ? {5'b10101, actualrs[26:0]} : DXout_IR;

    //----------------------------------------- Write/Read Memory

	latch XM_latch(~clock, latch_enable, reset, DXout_PC, DX_data_writeReg_3, D_to_X, altDXout_4, XMDout_1, XMDout_2, XMDout_3, XMDout_4);

    assign XM_opcode = DXout_IR[31:27];
    assign XM_rd = DXout_IR[26:22];
    assign XM_rs = DXout_IR[21:17];
    assign XM_rt = DXout_IR[16:12];
    assign XM_shamt = DXout_IR[11:7];
    assign XM_ALU_op = DXout_IR[6:2];

    assign address_dmem = XMDout_2;
    assign wren = (XMDout_4[31:27] == 5'b00111) ? 1'b1 : 1'b0;
    assign X_to_M = (XMDout_4[31:27] == 5'b01000) ? q_dmem : XMDout_2;
    assign data = (XMDout_4[26:22] == MWout_4[26:22]) ? data_writeReg : XMDout_3;
    assign status_result = {5'b00000, XMDout_4[26:0]};

    //----------------------------------------- Register Writeback

    latch MW_latch(~clock, latch_enable, reset, XMDout_1, X_to_M, 32'b0, XMDout_4, MWDout_1, MWout_2, MWout_3, MWout_4);

    assign ctrl_writeEnable = (MWout_4[31:27] == 5'b00000 || 
        MWout_4[31:27] == 5'b00101 || 
        MWout_4[31:27] == 5'b00011 || 
        MWout_4[31:27] == 5'b01000 || 
        MWout_4[31:27] == 5'b10101) ? 1'b1 : 1'b0;
    assign data_writeReg = (MWout_4[31:27] == 5'b10101) ? {5'b00000, MWout_4[26:0]} : MWout_2;
    assign ctrl_writeRegtemp = (MWout_4[31:27] == 5'b00011) ? 5'b11111 : MWout_4[26:22];
    assign ctrl_writeReg = (MWout_4[31:27] == 5'b10101) ? 5'b11110 : ctrl_writeRegtemp;

	/* END CODE */

endmodule
