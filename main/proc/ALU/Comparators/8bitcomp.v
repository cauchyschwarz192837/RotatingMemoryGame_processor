module comp_8(EQ1, GT1, A, B, EQ0, GT0);
    input EQ1, GT1;
    input [7:0] A, B;
    output EQ0, GT0;

    wire e1t2, g1t2;
    wire e2t3, g2t3;
    wire e3t4, g3t4;

    // module comp_2(EQ1, GT1, A, B, EQ0, GT0);

    comp_2 firstcomp_2(EQ1, GT1, A[7:6], B[7:6], e1t2, g1t2);
    comp_2 secondcomp_2(e1t2, g1t2, A[5:4], B[5:4], e2t3, g2t3);
    comp_2 thirdcomp_2(e2t3, g2t3, A[3:2], B[3:2], e3t4, g3t4);
    comp_2 fourthcomp_2(e3t4, g3t4, A[1:0], B[1:0], EQ0, GT0);

endmodule