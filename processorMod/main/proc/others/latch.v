module latch(clock, ctrl_writeEnable, ctrl_reset, PC, A, B, IR, reg_1, reg_2, reg_3, reg_4);

	input clock, ctrl_writeEnable, ctrl_reset;
	input [31:0] PC, A, B, IR;
	output [31:0] reg_1, reg_2, reg_3, reg_4;

    register_32 one(reg_1, PC, clock, ctrl_writeEnable, ctrl_reset);
    register_32 two(reg_2, A, clock, ctrl_writeEnable, ctrl_reset);  
    register_32 three(reg_3, B, clock, ctrl_writeEnable, ctrl_reset);
    register_32 four(reg_4, IR, clock, ctrl_writeEnable, ctrl_reset);

endmodule