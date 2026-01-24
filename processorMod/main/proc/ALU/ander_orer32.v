module ander32(x, y, res);

	input [31:0] x, y;
	output [31:0] res;

    and ander0(res[0],  x[0],  y[0]);
    and ander1(res[1],  x[1],  y[1]);
    and ander2(res[2],  x[2],  y[2]);
    and ander3(res[3],  x[3],  y[3]);
    and ander4(res[4],  x[4],  y[4]);
    and ander5(res[5],  x[5],  y[5]);
    and ander6(res[6],  x[6],  y[6]);
    and ander7(res[7],  x[7],  y[7]);
    and ander8(res[8],  x[8],  y[8]);
    and ander9(res[9],  x[9],  y[9]);
    and ander10(res[10], x[10], y[10]);
    and ander11(res[11], x[11], y[11]);
    and ander12(res[12], x[12], y[12]);
    and ander13(res[13], x[13], y[13]);
    and ander14(res[14], x[14], y[14]);
    and ander15(res[15], x[15], y[15]);
    and ander16(res[16], x[16], y[16]);
    and ander17(res[17], x[17], y[17]);
    and ander18(res[18], x[18], y[18]);
    and ander19(res[19], x[19], y[19]);
    and ander20(res[20], x[20], y[20]);
    and ander21(res[21], x[21], y[21]);
    and ander22(res[22], x[22], y[22]);
    and ander23(res[23], x[23], y[23]);
    and ander24(res[24], x[24], y[24]);
    and ander25(res[25], x[25], y[25]);
    and ander26(res[26], x[26], y[26]);
    and ander27(res[27], x[27], y[27]);
    and ander28(res[28], x[28], y[28]);
    and ander29(res[29], x[29], y[29]);
    and ander30(res[30], x[30], y[30]);
    and ander31(res[31], x[31], y[31]);

endmodule

//-------------------------------------------------------------------

module orer32(x, y, res);

	input [31:0] x, y;
	output [31:0] res;
	
    or orer0  (res[0],  x[0],  y[0]);
    or orer1  (res[1],  x[1],  y[1]);
    or orer2  (res[2],  x[2],  y[2]);
    or orer3  (res[3],  x[3],  y[3]);
    or orer4  (res[4],  x[4],  y[4]);
    or orer5  (res[5],  x[5],  y[5]);
    or orer6  (res[6],  x[6],  y[6]);
    or orer7  (res[7],  x[7],  y[7]);
    or orer8  (res[8],  x[8],  y[8]);
    or orer9  (res[9],  x[9],  y[9]);
    or orer10 (res[10], x[10], y[10]);
    or orer11 (res[11], x[11], y[11]);
    or orer12 (res[12], x[12], y[12]);
    or orer13 (res[13], x[13], y[13]);
    or orer14 (res[14], x[14], y[14]);
    or orer15 (res[15], x[15], y[15]);
    or orer16 (res[16], x[16], y[16]);
    or orer17 (res[17], x[17], y[17]);
    or orer18 (res[18], x[18], y[18]);
    or orer19 (res[19], x[19], y[19]);
    or orer20 (res[20], x[20], y[20]);
    or orer21 (res[21], x[21], y[21]);
    or orer22 (res[22], x[22], y[22]);
    or orer23 (res[23], x[23], y[23]);
    or orer24 (res[24], x[24], y[24]);
    or orer25 (res[25], x[25], y[25]);
    or orer26 (res[26], x[26], y[26]);
    or orer27 (res[27], x[27], y[27]);
    or orer28 (res[28], x[28], y[28]);
    or orer29 (res[29], x[29], y[29]);
    or orer30 (res[30], x[30], y[30]);
    or orer31 (res[31], x[31], y[31]);

endmodule
