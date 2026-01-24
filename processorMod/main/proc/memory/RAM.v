`timescale 1ns / 1ps
module RAM #( parameter DATA_WIDTH = 32, ADDRESS_WIDTH = 12, DEPTH = 128) (
    //decrease RAM

    // add button inputs into RAM module
    // hardcode preallocated address in RAM

    input wire                     clk,
    input wire                     wEn,
    input wire [ADDRESS_WIDTH-1:0] addr,
    input wire [DATA_WIDTH-1:0]    dataIn,
    output reg [DATA_WIDTH-1:0]    dataOut = 0,

    output reg                     b1_ON,
    output reg                     b2_ON,
    output reg                     b3_ON,
    output reg                     b4_ON,
    output reg                     b5_ON,
    output reg                     b6_ON,
    output reg                     b7_ON,
    output reg                     b8_ON,
    output reg                     b9_ON,
    output reg                     b10_ON,
    output reg                     b11_ON,
    output reg                     b12_ON,
    output reg                     b13_ON,
    output reg                     b14_ON,
    output reg                     b15_ON,
    output reg                     b16_ON,

    output reg [11:0]              b1_COLOR,
    output reg [11:0]              b2_COLOR,
    output reg [11:0]              b3_COLOR,
    output reg [11:0]              b4_COLOR,
    output reg [11:0]              b5_COLOR,
    output reg [11:0]              b6_COLOR,
    output reg [11:0]              b7_COLOR,
    output reg [11:0]              b8_COLOR,
    output reg [11:0]              b9_COLOR,
    output reg [11:0]              b10_COLOR,
    output reg [11:0]              b11_COLOR,
    output reg [11:0]              b12_COLOR,
    output reg [11:0]              b13_COLOR,
    output reg [11:0]              b14_COLOR,
    output reg [11:0]              b15_COLOR,
    output reg [11:0]              b16_COLOR, 

    output reg                     b1_SOLVED,
    output reg                     b2_SOLVED,
    output reg                     b3_SOLVED,
    output reg                     b4_SOLVED,
    output reg                     b5_SOLVED,
    output reg                     b6_SOLVED,
    output reg                     b7_SOLVED,
    output reg                     b8_SOLVED,
    output reg                     b9_SOLVED,
    output reg                     b10_SOLVED,
    output reg                     b11_SOLVED,
    output reg                     b12_SOLVED,
    output reg                     b13_SOLVED,
    output reg                     b14_SOLVED,
    output reg                     b15_SOLVED,
    output reg                     b16_SOLVED
    );
    
    reg[DATA_WIDTH-1:0] MemoryArray[0:DEPTH-1];
    
    integer i;
    initial begin
        for (i = 0; i < DEPTH; i = i + 1) begin
            MemoryArray[i] <= 0;
        end
        // if(MEMFILE > 0) begin
        //     $readmemh(MEMFILE, MemoryArray);
        // end
    end
    
    always @(posedge clk) begin
        if(wEn) begin
            MemoryArray[addr] <= dataIn;
        end else begin
            dataOut <= MemoryArray[addr];
        end

        b1_ON     <= MemoryArray[80][0];  // newly-assigned (+79)
        b2_ON     <= MemoryArray[81][0];
        b3_ON     <= MemoryArray[82][0];
        b4_ON     <= MemoryArray[83][0];
        b5_ON     <= MemoryArray[84][0];
        b6_ON     <= MemoryArray[85][0];
        b7_ON     <= MemoryArray[86][0];
        b8_ON     <= MemoryArray[87][0];
        b9_ON     <= MemoryArray[88][0];
        b10_ON    <= MemoryArray[89][0];
        b11_ON    <= MemoryArray[90][0];
        b12_ON    <= MemoryArray[91][0];
        b13_ON    <= MemoryArray[92][0];
        b14_ON    <= MemoryArray[93][0];
        b15_ON    <= MemoryArray[94][0];
        b16_ON    <= MemoryArray[95][0];

        b1_COLOR  <= MemoryArray[20][11:0];  // pre-determined (+19)
        b2_COLOR  <= MemoryArray[21][11:0];
        b3_COLOR  <= MemoryArray[22][11:0];
        b4_COLOR  <= MemoryArray[23][11:0];
        b5_COLOR  <= MemoryArray[24][11:0];
        b6_COLOR  <= MemoryArray[25][11:0];
        b7_COLOR  <= MemoryArray[26][11:0];
        b8_COLOR  <= MemoryArray[27][11:0];
        b9_COLOR  <= MemoryArray[28][11:0];
        b10_COLOR <= MemoryArray[29][11:0];
        b11_COLOR <= MemoryArray[30][11:0];
        b12_COLOR <= MemoryArray[31][11:0];
        b13_COLOR <= MemoryArray[32][11:0];
        b14_COLOR <= MemoryArray[33][11:0];
        b15_COLOR <= MemoryArray[34][11:0];
        b16_COLOR <= MemoryArray[35][11:0];

        b1_SOLVED  <= MemoryArray[110][0];  // newly-assigned (+109)
        b2_SOLVED  <= MemoryArray[111][0];
        b3_SOLVED  <= MemoryArray[112][0];
        b4_SOLVED  <= MemoryArray[113][0];
        b5_SOLVED  <= MemoryArray[114][0];
        b6_SOLVED  <= MemoryArray[115][0];
        b7_SOLVED  <= MemoryArray[116][0];
        b8_SOLVED  <= MemoryArray[117][0];
        b9_SOLVED  <= MemoryArray[118][0];
        b10_SOLVED <= MemoryArray[119][0];
        b11_SOLVED <= MemoryArray[120][0];
        b12_SOLVED <= MemoryArray[121][0];
        b13_SOLVED <= MemoryArray[122][0];
        b14_SOLVED <= MemoryArray[123][0];
        b15_SOLVED <= MemoryArray[124][0];
        b16_SOLVED <= MemoryArray[125][0];

    end
endmodule
