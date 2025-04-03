module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
        
    input [31:0] data_operandA, data_operandB;
    input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

    output [31:0] data_result;
    output isNotEqual, isLessThan, overflow;

    // add your code here:

    wire [31:0] not_data_operandB;

    not mynot0(not_data_operandB[0], data_operandB[0]);
    not mynot1(not_data_operandB[1], data_operandB[1]);
    not mynot2(not_data_operandB[2], data_operandB[2]);
    not mynot3(not_data_operandB[3], data_operandB[3]);
    not mynot4(not_data_operandB[4], data_operandB[4]);
    not mynot5(not_data_operandB[5], data_operandB[5]);
    not mynot6(not_data_operandB[6], data_operandB[6]);
    not mynot7(not_data_operandB[7], data_operandB[7]);
    not mynot8(not_data_operandB[8], data_operandB[8]);
    not mynot9(not_data_operandB[9], data_operandB[9]);
    not mynot10(not_data_operandB[10], data_operandB[10]);
    not mynot11(not_data_operandB[11], data_operandB[11]);
    not mynot12(not_data_operandB[12], data_operandB[12]);
    not mynot13(not_data_operandB[13], data_operandB[13]);
    not mynot14(not_data_operandB[14], data_operandB[14]);
    not mynot15(not_data_operandB[15], data_operandB[15]);
    not mynot16(not_data_operandB[16], data_operandB[16]);
    not mynot17(not_data_operandB[17], data_operandB[17]);
    not mynot18(not_data_operandB[18], data_operandB[18]);
    not mynot19(not_data_operandB[19], data_operandB[19]);
    not mynot20(not_data_operandB[20], data_operandB[20]);
    not mynot21(not_data_operandB[21], data_operandB[21]);
    not mynot22(not_data_operandB[22], data_operandB[22]);
    not mynot23(not_data_operandB[23], data_operandB[23]);
    not mynot24(not_data_operandB[24], data_operandB[24]);
    not mynot25(not_data_operandB[25], data_operandB[25]);
    not mynot26(not_data_operandB[26], data_operandB[26]);
    not mynot27(not_data_operandB[27], data_operandB[27]);
    not mynot28(not_data_operandB[28], data_operandB[28]);
    not mynot29(not_data_operandB[29], data_operandB[29]);
    not mynot30(not_data_operandB[30], data_operandB[30]);
    not mynot31(not_data_operandB[31], data_operandB[31]);

    wire [31:0] add_result, sub_result, and_result, or_result, sll_result, sra_result;
    wire overflow_sub, overflow_add, dummy1, dummy2;

    adder32 myadder32(data_operandA, data_operandB, 1'b0, add_result, dummy1, dummy2, overflow_add);
    adder32 mysubber32(data_operandA, not_data_operandB, 1'b1, sub_result, isNotEqual, isLessThan, overflow_sub);
    ander32 myander32(data_operandA, data_operandB, and_result);
    orer32 myorer32(data_operandA, data_operandB, or_result);
    sll32 mysll32(data_operandA, ctrl_shiftamt, sll_result);
    sra32 mysra32(data_operandA, ctrl_shiftamt, sra_result);

	assign overflow = ctrl_ALUopcode[0] ? overflow_sub : overflow_add;

    // input [4:0] ctrl_ALUopcode
    // needs two dummies
    
    wire [31:0] dummy_zero_32_1, dummy_zero_32_2;
    assign dummy_zero_32_1 = 32'b0;
    assign dummy_zero_32_2 = 32'b0;

    mux_8 mymux8(data_result, ctrl_ALUopcode[2:0], add_result, sub_result, and_result, or_result, sll_result, sra_result, dummy_zero_32_1, dummy_zero_32_2);
    // 00100
endmodule