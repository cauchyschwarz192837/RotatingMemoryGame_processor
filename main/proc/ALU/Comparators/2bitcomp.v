module comp_2(EQ1, GT1, A, B, EQ0, GT0);
    input EQ1, GT1;   
    input [1:0] A, B;       
    output EQ0, GT0;  
    
    wire [2:0] select;

    assign select[2:1] = A;
    assign select[0] = B[1];

    wire EQ_FIRST, GT_FIRST;

    // mux_8(out, select, in0, in1, in2, in3, in4, in5, in6, in7);
    mux_8 gtmux8(GT_FIRST, select, 1'b0, 1'b0, ~B[0], 1'b0, 1'b1, 1'b0, 1'b1, ~B[0]);
    mux_8 eqmux8(EQ_FIRST, select, ~B[0], 1'b0, B[0], 1'b0, 1'b0, ~B[0], 1'b0, B[0]);

    assign EQ0 = EQ1 & ~GT1 & EQ_FIRST;
    assign GT0 = (~EQ1 & GT1) | (EQ1 & GT_FIRST & ~GT1);

endmodule
