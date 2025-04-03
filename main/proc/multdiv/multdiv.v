module multdiv(
    
	data_operandA, data_operandB, 
	ctrl_MULT, ctrl_DIV, 
	clock, 
	data_result, data_exception, data_resultRDY);

    input [31:0] data_operandA, data_operandB;
    input ctrl_MULT, ctrl_DIV, clock;
    output [31:0] data_result;
    output data_exception, data_resultRDY;

    wire [31:0] data_result_mult, data_result_div;
    wire data_exception_mult, data_exception_div, data_resultRDY_mult, data_resultRDY_div, d, choose, enable, clr;

    //-----------------------------------------------------------------------------

    assign enable = ctrl_MULT ? 1'b1 : 1'b0;
    assign clr = ctrl_DIV ? 1'b1 : 1'b0;
    dffe_ref one_cycle_mult(choose, ctrl_MULT, clock, enable, clr);

    mult multiplier(data_operandA, data_operandB, ctrl_MULT, clock, data_result_mult, data_exception_mult, data_resultRDY_mult);
    div divider(data_operandA, data_operandB, ctrl_DIV, clock, data_result_div, data_exception_div, data_resultRDY_div);

    assign data_result = choose ? data_result_mult : data_result_div;
    assign data_exception = choose ? data_exception_mult : data_exception_div;
    assign data_resultRDY = choose ? data_resultRDY_mult : data_resultRDY_div;

endmodule
