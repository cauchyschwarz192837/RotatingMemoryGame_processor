module adder1(x, y, Cin, Sum); // no carry out bit
    input x, y, Cin;
    output Sum;
    wire w1, w2;

    xor s1(w1, x, y);
    xor s2(Sum, Cin, w1);

endmodule

//-------------------------------------------------------------------

module adder8(x, y, Cin, Sum, P, G);
    input [7:0] x, y;
    input Cin;
    output [7:0] Sum;
    wire p0, p1, p2, p3, p4, p5, p6, p7, g0, g1, g2, g3, g4, g5, g6, g7;
    wire c1, c2, c3, c4, c5, c6, c7;
    wire Cout;
    output P, G;

    and and0(g0, x[0], y[0]);
	or(p0, x[0], y[0]);
    and and1(g1, x[1], y[1]);
	or(p1, x[1], y[1]);
    and and2(g2, x[2], y[2]);
	or(p2, x[2], y[2]);
    and and3(g3, x[3], y[3]);
	or(p3, x[3], y[3]);
    and and4(g4, x[4], y[4]);
	or(p4, x[4], y[4]);
    and and5(g5, x[5], y[5]);
	or(p5, x[5], y[5]);
    and and6(g6, x[6], y[6]);
	or(p6, x[6], y[6]);
    and and7(g7, x[7], y[7]);
	or(p7, x[7], y[7]);

    //---------------------------------------------------------

    wire G0, G1, G2, G3, G4, G5, G6;

	and andP(P, p0, p1, p2, p3, p4, p5, p6, p7);
	and andG0(G0, p1, p2, p3, p4, p5, p6, p7, g0);
	and andG1(G1, p2, p3, p4, p5, p6, p7, g1);
	and andG2(G2, p3, p4, p5, p6, p7, g2);
	and andG3(G3, p4, p5, p6, p7, g3);
	and andG4(G4, p5, p6, p7, g4);
	and andG5(G5, p6, p7, g5);
	and andG6(G6, p7, g6);
	or (G, g7, G0, G1, G2, G3, G4, G5, G6);

    wire temp8;

    and andtemp8(temp8, P, Cin);
    or (Cout, G, temp8);

    //---------------------------------------------------------

    wire G7_0, G7_1, G7_2, G7_3, G7_4, G7_5;
    wire Gtemp7, P7;

    and andP_7(P7, p0, p1, p2, p3, p4, p5, p6);
    and andG7_0(G7_0, p1, p2, p3, p4, p5, p6, g0);
	and andG7_1(G7_1, p2, p3, p4, p5, p6, g1);
	and andG7_2(G7_2, p3, p4, p5, p6, g2);
	and andG7_3(G7_3, p4, p5, p6, g3);
	and andG7_4(G7_4, p5, p6, g4);
	and andG7_5(G7_5, p6, g5);
    or (Gtemp7, g6, G7_0, G7_1, G7_2, G7_3, G7_4, G7_5);

    wire temp7;

    and andtemp7(temp7, P7, Cin);
    or (c7, Gtemp7, temp7);

    //---------------------------------------------------------

    wire G6_0, G6_1, G6_2, G6_3, G6_4;
    wire Gtemp6, P6;

    and andP_6(P6, p0, p1, p2, p3, p4, p5);
    and andG6_0(G6_0, p1, p2, p3, p4, p5, g0);
	and andG6_1(G6_1, p2, p3, p4, p5, g1);
	and andG6_2(G6_2, p3, p4, p5, g2);
	and andG6_3(G6_3, p4, p5, g3);
	and andG6_4(G6_4, p5, g4);
    or (Gtemp6, g5, G6_0, G6_1, G6_2, G6_3, G6_4);

    wire temp6;

    and andtemp6(temp6, P6, Cin);
    or (c6, Gtemp6, temp6);

    //---------------------------------------------------------

    wire G5_0, G5_1, G5_2, G5_3;
    wire Gtemp5, P5;

    and andP_5(P5, p0, p1, p2, p3, p4);
    and andG5_0(G5_0, p1, p2, p3, p4, g0);
	and andG5_1(G5_1, p2, p3, p4, g1);
	and andG5_2(G5_2, p3, p4, g2);
	and andG5_3(G5_3, p4, g3);
    or (Gtemp5, g4, G5_0, G5_1, G5_2, G5_3);

    wire temp5;

    and andtemp5(temp5, P5, Cin);
    or (c5, Gtemp5, temp5);

    //---------------------------------------------------------

    wire G4_0, G4_1, G4_2;
    wire Gtemp4, P4;

    and andP_4(P4, p0, p1, p2, p3);
    and andG4_0(G4_0, p1, p2, p3, g0);
	and andG4_1(G4_1, p2, p3, g1);
	and andG4_2(G4_2, p3, g2);
    or (Gtemp4, g3, G4_0, G4_1, G4_2);

    wire temp4;

    and andtemp4(temp4, P4, Cin);
    or (c4, Gtemp4, temp4);

    //---------------------------------------------------------

    wire G3_0, G3_1;
    wire Gtemp3, P3;

    and andP_3(P3, p0, p1, p2);
    and andG3_0(G3_0, p1, p2, g0);
	and andG3_1(G3_1, p2, g1);
    or (Gtemp3, g2, G3_0, G3_1);

    wire temp3;

    and andtemp3(temp3, P3, Cin);
    or (c3, Gtemp3, temp3);

    //---------------------------------------------------------

    wire G2_0;
    wire Gtemp2, P2;

    and andP_2(P2, p0, p1);
    and andG2_0(G2_0, p1, g0);
    or (Gtemp2, g1, G2_0);

    wire temp2;

    and andtemp2(temp2, P2, Cin);
    or (c2, Gtemp2, temp2);

    //---------------------------------------------------------

    wire temp1;

    and andtemp1(temp1, p0, Cin);
    or (c1, g0, temp1);

    //---------------------------------------------------------

    adder1 myadder_0(x[0], y[0], Cin, Sum[0]);
    adder1 myadder_1(x[1], y[1], c1, Sum[1]);
    adder1 myadder_2(x[2], y[2], c2, Sum[2]);
    adder1 myadder_3(x[3], y[3], c3, Sum[3]);
    adder1 myadder_4(x[4], y[4], c4, Sum[4]);
    adder1 myadder_5(x[5], y[5], c5, Sum[5]);
    adder1 myadder_6(x[6], y[6], c6, Sum[6]);
    adder1 myadder_7(x[7], y[7], c7, Sum[7]);
    
endmodule

//-------------------------------------------------------------------

module adder32(x, y, Cin, Sum, isNotEqual, isLessThan, overflow);
    input [31:0] x, y;
    input Cin;
    output [31:0] Sum;
    output isNotEqual, isLessThan, overflow;

    wire P0, P1, P2, P3;
	wire G0, G1, G2, G3;
    wire c8, c16, c24, c32;

    //---------------------------------------------------------

    wire c8_1;
    adder8 myadder8_0(x[7:0], y[7:0], Cin, Sum[7:0], P0, G0);

    and andc8_1(c8_1, P0, Cin);
	or (c8, G0, c8_1);

    //---------------------------------------------------------

    wire c16_2, c16_1;
    adder8 myadder8_1(x[15:8], y[15:8], c8, Sum[15:8], P1, G1);

	and andc16_1(c16_1, P1, P0, Cin);
	and andc16_2(c16_2, P1, G0);
	or (c16, G1, c16_1, c16_2);
    
    //---------------------------------------------------------

    wire c24_3, c24_2, c24_1;
    adder8 myadder8_2(x[23:16], y[23:16], c16, Sum[23:16], P2, G2);

	and andc24_1(c24_1, P2, P1, P0, Cin);
	and andc24_2(c24_2, P2, P1, G0);
	and andc24_3(c24_3, P2, G1);
	or (c24, G2, c24_1, c24_2, c24_3);

    //--------------------------------------------------------- 

    adder8 myadder8_3(x[31:24], y[31:24], c24, Sum[31:24], P3, G3);

    wire c32_4, c32_3, c32_2, c32_1;
    and andc32_1(c32_1, P3, P2, P1, P0, Cin);
	and andc32_2(c32_2, P3, P2, P1, G0);
	and andc32_3(c32_3, P3, P2, G1);
	and andc32_4(c32_4, P3, G2);
	or (c32, G3, c32_1, c32_2, c32_3, c32_4);

    //--------------------------------------------------------- 

    // detecting overflow

    wire notx, noty, notres;
    not notx_g(notx, x[31]);
    not noty_g(noty, y[31]);
    not notres_g(notres, Sum[31]);

    // if x is positive (0), y is positive (0) and Sum is negative (1)
    wire addCheck;
    and and_add(addCheck, notx, noty, Sum[31]);

    // if x is negative (1), y is negative (1) and Sum is positive (0)
    wire subCheck;
    and and_sub(subCheck, x[31], y[31], notres);

    or (overflow, addCheck, subCheck);

    //--------------------------------------------------------- 

    // detecting isNotEqual, only for SUBTRACT operation

    or (isNotEqual, Sum[0], Sum[1], Sum[2], Sum[3], Sum[4], Sum[5], Sum[6], Sum[7], Sum[8], Sum[9], Sum[10], Sum[11], Sum[12], Sum[13], Sum[14], Sum[15], Sum[16], Sum[17], Sum[18], Sum[19], Sum[20], Sum[21], Sum[22], Sum[23], Sum[24], Sum[25], Sum[26], Sum[27], Sum[28], Sum[29], Sum[30], Sum[31]);
    
    //--------------------------------------------------------- 

    // detecting isLessThan, only for SUBTRACT operation

    xor xor_lt(isLessThan, Sum[31], overflow);

endmodule
