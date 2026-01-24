
// logical shift

module sll1(x, cond, y);
    input [31:0] x;
    input cond;
    output [31:0] y;

    assign y[0] = cond ? 1'b0 : x[0];
    assign y[1] = cond ? x[0] : x[1];
    assign y[2] = cond ? x[1] : x[2];
    assign y[3] = cond ? x[2] : x[3];
    assign y[4] = cond ? x[3] : x[4];
    assign y[5] = cond ? x[4] : x[5];
    assign y[6] = cond ? x[5] : x[6];
    assign y[7] = cond ? x[6] : x[7];
    assign y[8] = cond ? x[7] : x[8];
    assign y[9] = cond ? x[8] : x[9];
    assign y[10] = cond ? x[9] : x[10];
    assign y[11] = cond ? x[10] : x[11];
    assign y[12] = cond ? x[11] : x[12];
    assign y[13] = cond ? x[12] : x[13];
    assign y[14] = cond ? x[13] : x[14];
    assign y[15] = cond ? x[14] : x[15];
    assign y[16] = cond ? x[15] : x[16];
    assign y[17] = cond ? x[16] : x[17];
    assign y[18] = cond ? x[17] : x[18];
    assign y[19] = cond ? x[18] : x[19];
    assign y[20] = cond ? x[19] : x[20];
    assign y[21] = cond ? x[20] : x[21];
    assign y[22] = cond ? x[21] : x[22];
    assign y[23] = cond ? x[22] : x[23];
    assign y[24] = cond ? x[23] : x[24];
    assign y[25] = cond ? x[24] : x[25];
    assign y[26] = cond ? x[25] : x[26];
    assign y[27] = cond ? x[26] : x[27];
    assign y[28] = cond ? x[27] : x[28];
    assign y[29] = cond ? x[28] : x[29];
    assign y[30] = cond ? x[29] : x[30];
    assign y[31] = cond ? x[30] : x[31];

endmodule

module sll2(x, cond, y);
    input [31:0] x;
    input cond;
    output [31:0] y;

    assign y[1:0] = cond ? 2'b0 : x[1:0];
    assign y[2] = cond ? x[0] : x[2];
    assign y[3] = cond ? x[1] : x[3];
    assign y[4] = cond ? x[2] : x[4];
    assign y[5] = cond ? x[3] : x[5];
    assign y[6] = cond ? x[4] : x[6];
    assign y[7] = cond ? x[5] : x[7];
    assign y[8] = cond ? x[6] : x[8];
    assign y[9] = cond ? x[7] : x[9];
    assign y[10] = cond ? x[8] : x[10];
    assign y[11] = cond ? x[9] : x[11];
    assign y[12] = cond ? x[10] : x[12];
    assign y[13] = cond ? x[11] : x[13];
    assign y[14] = cond ? x[12] : x[14];
    assign y[15] = cond ? x[13] : x[15];
    assign y[16] = cond ? x[14] : x[16];
    assign y[17] = cond ? x[15] : x[17];
    assign y[18] = cond ? x[16] : x[18];
    assign y[19] = cond ? x[17] : x[19];
    assign y[20] = cond ? x[18] : x[20];
    assign y[21] = cond ? x[19] : x[21];
    assign y[22] = cond ? x[20] : x[22];
    assign y[23] = cond ? x[21] : x[23];
    assign y[24] = cond ? x[22] : x[24];
    assign y[25] = cond ? x[23] : x[25];
    assign y[26] = cond ? x[24] : x[26];
    assign y[27] = cond ? x[25] : x[27];
    assign y[28] = cond ? x[26] : x[28];
    assign y[29] = cond ? x[27] : x[29];
    assign y[30] = cond ? x[28] : x[30];
    assign y[31] = cond ? x[29] : x[31];

endmodule

module sll4(x, cond, y);

    input [31:0] x;
    input cond;
    output [31:0] y;

    assign y[3:0] = cond ? 4'b0 : x[3:0];
    assign y[4] = cond ? x[0] : x[4];
    assign y[5] = cond ? x[1] : x[5];
    assign y[6] = cond ? x[2] : x[6];
    assign y[7] = cond ? x[3] : x[7];
    assign y[8] = cond ? x[4] : x[8];
    assign y[9] = cond ? x[5] : x[9];
    assign y[10] = cond ? x[6] : x[10];
    assign y[11] = cond ? x[7] : x[11];
    assign y[12] = cond ? x[8] : x[12];
    assign y[13] = cond ? x[9] : x[13];
    assign y[14] = cond ? x[10] : x[14];
    assign y[15] = cond ? x[11] : x[15];
    assign y[16] = cond ? x[12] : x[16];
    assign y[17] = cond ? x[13] : x[17];
    assign y[18] = cond ? x[14] : x[18];
    assign y[19] = cond ? x[15] : x[19];
    assign y[20] = cond ? x[16] : x[20];
    assign y[21] = cond ? x[17] : x[21];
    assign y[22] = cond ? x[18] : x[22];
    assign y[23] = cond ? x[19] : x[23];
    assign y[24] = cond ? x[20] : x[24];
    assign y[25] = cond ? x[21] : x[25];
    assign y[26] = cond ? x[22] : x[26];
    assign y[27] = cond ? x[23] : x[27];
    assign y[28] = cond ? x[24] : x[28];
    assign y[29] = cond ? x[25] : x[29];
    assign y[30] = cond ? x[26] : x[30];
    assign y[31] = cond ? x[27] : x[31];

endmodule

module sll8(x, cond, y);

    input [31:0] x;
    input cond;
    output [31:0] y;

    assign y[7:0] = cond ? 8'b0 : x[7:0];
    assign y[8] = cond ? x[0] : x[8];
    assign y[9] = cond ? x[1] : x[9];
    assign y[10] = cond ? x[2] : x[10];
    assign y[11] = cond ? x[3] : x[11];
    assign y[12] = cond ? x[4] : x[12];
    assign y[13] = cond ? x[5] : x[13];
    assign y[14] = cond ? x[6] : x[14];
    assign y[15] = cond ? x[7] : x[15];
    assign y[16] = cond ? x[8] : x[16];
    assign y[17] = cond ? x[9] : x[17];
    assign y[18] = cond ? x[10] : x[18];
    assign y[19] = cond ? x[11] : x[19];
    assign y[20] = cond ? x[12] : x[20];
    assign y[21] = cond ? x[13] : x[21];
    assign y[22] = cond ? x[14] : x[22];
    assign y[23] = cond ? x[15] : x[23];
    assign y[24] = cond ? x[16] : x[24];
    assign y[25] = cond ? x[17] : x[25];
    assign y[26] = cond ? x[18] : x[26];
    assign y[27] = cond ? x[19] : x[27];
    assign y[28] = cond ? x[20] : x[28];
    assign y[29] = cond ? x[21] : x[29];
    assign y[30] = cond ? x[22] : x[30];
    assign y[31] = cond ? x[23] : x[31];

endmodule

module sll16(x, cond, y);

    input [31:0] x;
    input cond;
    output [31:0] y;

    assign y[15:0] = cond ? 16'b0 : x[15:0];
    assign y[16] = cond ? x[0] : x[16];
    assign y[17] = cond ? x[1] : x[17];
    assign y[18] = cond ? x[2] : x[18];
    assign y[19] = cond ? x[3] : x[19];
    assign y[20] = cond ? x[4] : x[20];
    assign y[21] = cond ? x[5] : x[21];
    assign y[22] = cond ? x[6] : x[22];
    assign y[23] = cond ? x[7] : x[23];
    assign y[24] = cond ? x[8] : x[24];
    assign y[25] = cond ? x[9] : x[25];
    assign y[26] = cond ? x[10] : x[26];
    assign y[27] = cond ? x[11] : x[27];
    assign y[28] = cond ? x[12] : x[28];
    assign y[29] = cond ? x[13] : x[29];
    assign y[30] = cond ? x[14] : x[30];
    assign y[31] = cond ? x[15] : x[31];

endmodule

module sll32(x, shiftamt, y);

    input [31:0] x;
    input [4:0] shiftamt;
    output [31:0] y;

    wire [31:0] temp1, temp2, temp3, temp4;

    sll16 mysll16(x, shiftamt[4], temp4);
    sll8 mysll8(temp4, shiftamt[3], temp3);
    sll4 mysll4(temp3, shiftamt[2], temp2);
    sll2 mysll2(temp2, shiftamt[1], temp1);
    sll1 mysll1(temp1, shiftamt[0], y);

endmodule

//-------------------------------------------------------------------

// arithmetic shift

module sra1(x, cond, y);

    input [31:0] x;
    input cond;
    output [31:0] y;

    assign y[31] = cond ? x[31] : x[31];
    assign y[30] = cond ? x[31] : x[30];

    assign y[29] = cond ? x[30] : x[29];
    assign y[28] = cond ? x[29] : x[28];
    assign y[27] = cond ? x[28] : x[27];
    assign y[26] = cond ? x[27] : x[26];
    assign y[25] = cond ? x[26] : x[25];
    assign y[24] = cond ? x[25] : x[24];
    assign y[23] = cond ? x[24] : x[23];
    assign y[22] = cond ? x[23] : x[22];
    assign y[21] = cond ? x[22] : x[21];
    assign y[20] = cond ? x[21] : x[20];
    assign y[19] = cond ? x[20] : x[19];
    assign y[18] = cond ? x[19] : x[18];
    assign y[17] = cond ? x[18] : x[17];
    assign y[16] = cond ? x[17] : x[16];
    assign y[15] = cond ? x[16] : x[15];
    assign y[14] = cond ? x[15] : x[14];
    assign y[13] = cond ? x[14] : x[13];
    assign y[12] = cond ? x[13] : x[12];
    assign y[11] = cond ? x[12] : x[11];
    assign y[10] = cond ? x[11] : x[10];
    assign y[9] = cond ? x[10] : x[9];
    assign y[8] = cond ? x[9] : x[8];
    assign y[7] = cond ? x[8] : x[7];
    assign y[6] = cond ? x[7] : x[6];
    assign y[5] = cond ? x[6] : x[5];
    assign y[4] = cond ? x[5] : x[4];
    assign y[3] = cond ? x[4] : x[3];
    assign y[2] = cond ? x[3] : x[2];
    assign y[1] = cond ? x[2] : x[1];
    assign y[0] = cond ? x[1] : x[0];

endmodule

module sra2(x, cond, y);

    input [31:0] x;
    input cond;
    output [31:0] y;
    
    assign y[31] = cond ? x[31] : x[31];
    assign y[30] = cond ? x[31] : x[30];
    assign y[29] = cond ? x[31] : x[29];

    assign y[28] = cond ? x[30] : x[28];
    assign y[27] = cond ? x[29] : x[27];
    assign y[26] = cond ? x[28] : x[26];
    assign y[25] = cond ? x[27] : x[25];
    assign y[24] = cond ? x[26] : x[24];
    assign y[23] = cond ? x[25] : x[23];
    assign y[22] = cond ? x[24] : x[22];
    assign y[21] = cond ? x[23] : x[21];
    assign y[20] = cond ? x[22] : x[20];
    assign y[19] = cond ? x[21] : x[19];
    assign y[18] = cond ? x[20] : x[18];
    assign y[17] = cond ? x[19] : x[17];
    assign y[16] = cond ? x[18] : x[16];
    assign y[15] = cond ? x[17] : x[15];
    assign y[14] = cond ? x[16] : x[14];
    assign y[13] = cond ? x[15] : x[13];
    assign y[12] = cond ? x[14] : x[12];
    assign y[11] = cond ? x[13] : x[11];
    assign y[10] = cond ? x[12] : x[10];
    assign y[9] = cond ? x[11] : x[9];
    assign y[8] = cond ? x[10] : x[8];
    assign y[7] = cond ? x[9] : x[7];
    assign y[6] = cond ? x[8] : x[6];
    assign y[5] = cond ? x[7] : x[5];
    assign y[4] = cond ? x[6] : x[4];
    assign y[3] = cond ? x[5] : x[3];
    assign y[2] = cond ? x[4] : x[2];
    assign y[1] = cond ? x[3] : x[1];
    assign y[0] = cond ? x[2] : x[0];

endmodule

module sra4(x, cond, y);

    input [31:0] x;
    input cond;
    output [31:0] y;
    
    assign y[31] = cond ? x[31] : x[31];
    assign y[30] = cond ? x[31] : x[30];
    assign y[29] = cond ? x[31] : x[29];
    assign y[28] = cond ? x[31] : x[28];
    assign y[27] = cond ? x[31] : x[27];

    assign y[26] = cond ? x[30] : x[26];
    assign y[25] = cond ? x[29] : x[25];
    assign y[24] = cond ? x[28] : x[24];
    assign y[23] = cond ? x[27] : x[23];
    assign y[22] = cond ? x[26] : x[22];
    assign y[21] = cond ? x[25] : x[21];
    assign y[20] = cond ? x[24] : x[20];
    assign y[19] = cond ? x[23] : x[19];
    assign y[18] = cond ? x[22] : x[18];
    assign y[17] = cond ? x[21] : x[17];
    assign y[16] = cond ? x[20] : x[16];
    assign y[15] = cond ? x[19] : x[15];
    assign y[14] = cond ? x[18] : x[14];
    assign y[13] = cond ? x[17] : x[13];
    assign y[12] = cond ? x[16] : x[12];
    assign y[11] = cond ? x[15] : x[11];
    assign y[10] = cond ? x[14] : x[10];
    assign y[9] = cond ? x[13] : x[9];
    assign y[8] = cond ? x[12] : x[8];
    assign y[7] = cond ? x[11] : x[7];
    assign y[6] = cond ? x[10] : x[6];
    assign y[5] = cond ? x[9] : x[5];
    assign y[4] = cond ? x[8] : x[4];
    assign y[3] = cond ? x[7] : x[3];
    assign y[2] = cond ? x[6] : x[2];
    assign y[1] = cond ? x[5] : x[1];
    assign y[0] = cond ? x[4] : x[0];
    
endmodule

module sra8(x, cond, y);

    input [31:0] x;
    input cond;
    output [31:0] y;
    
    assign y[31] = cond ? x[31] : x[31];
    assign y[30] = cond ? x[31] : x[30];
    assign y[29] = cond ? x[31] : x[29];
    assign y[28] = cond ? x[31] : x[28];
    assign y[27] = cond ? x[31] : x[27];
    assign y[26] = cond ? x[31] : x[26];
    assign y[25] = cond ? x[31] : x[25];
    assign y[24] = cond ? x[31] : x[24];
    assign y[23] = cond ? x[31] : x[23];

    assign y[22] = cond ? x[30] : x[22];
    assign y[21] = cond ? x[29] : x[21];
    assign y[20] = cond ? x[28] : x[20];
    assign y[19] = cond ? x[27] : x[19];
    assign y[18] = cond ? x[26] : x[18];
    assign y[17] = cond ? x[25] : x[17];
    assign y[16] = cond ? x[24] : x[16];
    assign y[15] = cond ? x[23] : x[15];
    assign y[14] = cond ? x[22] : x[14];
    assign y[13] = cond ? x[21] : x[13];
    assign y[12] = cond ? x[20] : x[12];
    assign y[11] = cond ? x[19] : x[11];
    assign y[10] = cond ? x[18] : x[10];
    assign y[9] = cond ? x[17] : x[9];
    assign y[8] = cond ? x[16] : x[8];
    assign y[7] = cond ? x[15] : x[7];
    assign y[6] = cond ? x[14] : x[6];
    assign y[5] = cond ? x[13] : x[5];
    assign y[4] = cond ? x[12] : x[4];
    assign y[3] = cond ? x[11] : x[3];
    assign y[2] = cond ? x[10] : x[2];
    assign y[1] = cond ? x[9] : x[1];
    assign y[0] = cond ? x[8] : x[0];

endmodule

module sra16(x, cond, y);

    input [31:0] x;
    input cond;
    output [31:0] y;

    assign y[31] = cond ? x[31] : x[31];
    assign y[30] = cond ? x[31] : x[30];
    assign y[29] = cond ? x[31] : x[29];
    assign y[28] = cond ? x[31] : x[28];
    assign y[27] = cond ? x[31] : x[27];
    assign y[26] = cond ? x[31] : x[26];
    assign y[25] = cond ? x[31] : x[25];
    assign y[24] = cond ? x[31] : x[24];
    assign y[23] = cond ? x[31] : x[23];
    assign y[22] = cond ? x[31] : x[22];
    assign y[21] = cond ? x[31] : x[21];
    assign y[20] = cond ? x[31] : x[20];
    assign y[19] = cond ? x[31] : x[19];
    assign y[18] = cond ? x[31] : x[18];
    assign y[17] = cond ? x[31] : x[17];
    assign y[16] = cond ? x[31] : x[16];
    assign y[15] = cond ? x[31] : x[15];

    assign y[14] = cond ? x[30] : x[14];
    assign y[13] = cond ? x[29] : x[13];
    assign y[12] = cond ? x[28] : x[12];
    assign y[11] = cond ? x[27] : x[11];
    assign y[10] = cond ? x[26] : x[10];
    assign y[9] = cond ? x[25] : x[9];
    assign y[8] = cond ? x[24] : x[8];
    assign y[7] = cond ? x[23] : x[7];
    assign y[6] = cond ? x[22] : x[6];
    assign y[5] = cond ? x[21] : x[5];
    assign y[4] = cond ? x[20] : x[4];
    assign y[3] = cond ? x[19] : x[3];
    assign y[2] = cond ? x[18] : x[2];
    assign y[1] = cond ? x[17] : x[1];
    assign y[0] = cond ? x[16] : x[0];

endmodule

module sra32(x, shiftamt, y);

    input [31:0] x;
    input [4:0] shiftamt;
    output [31:0] y;

    wire [31:0] temp00, temp11, temp22, temp33;

    sra16 mysra16(x, shiftamt[4], temp00);
    sra8 mysra8(temp00, shiftamt[3], temp11);
    sra4 mysra4(temp11, shiftamt[2], temp22);
    sra2 mysra2(temp22, shiftamt[1], temp33);
    sra1 mysra1(temp33, shiftamt[0], y);
    
endmodule