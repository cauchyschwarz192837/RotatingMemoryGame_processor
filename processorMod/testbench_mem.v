`timescale 1ns/1ps

module testbench();

    // ------------------------
    // 1) Testbench Signals
    // ------------------------
    reg clock;
    reg reset;

    // Wires to connect to the processor
    wire [31:0] address_imem;
    wire [31:0] q_imem;
    wire [31:0] address_dmem;
    wire [31:0] data;
    wire        wren;
    wire [31:0] q_dmem;

    wire             ctrl_writeEnable;
    wire [4:0]       ctrl_writeReg;
    wire [4:0]       ctrl_readRegA, ctrl_readRegB;
    wire [31:0]      data_writeReg;
    wire [31:0]      data_readRegA, data_readRegB;

    // ------------------------
    // 2) Instantiate Processor
    // ------------------------
    processor DUT (
        // Control
        .clock          (clock),
        .reset          (reset),

        // Imem
        .address_imem   (address_imem),
        .q_imem         (q_imem),

        // Dmem
        .address_dmem   (address_dmem),
        .data           (data),
        .wren           (wren),
        .q_dmem         (q_dmem),

        // Regfile
        .ctrl_writeEnable (ctrl_writeEnable),
        .ctrl_writeReg    (ctrl_writeReg),
        .ctrl_readRegA    (ctrl_readRegA),
        .ctrl_readRegB    (ctrl_readRegB),
        .data_writeReg    (data_writeReg),
        .data_readRegA    (data_readRegA),
        .data_readRegB    (data_readRegB)
    );

    // ------------------------
    // 3) Stub Memories
    // ------------------------
    // For testing, we'll implement simple reg arrays for Imem & Dmem.
    // In a real system, you might have separate modules or memory files.

    reg [31:0] imem_array [0:1023];  // 1 KB of instructions
    reg [31:0] dmem_array [0:1023];  // 1 KB of data

    // Instruction Memory read (combinational):
    assign q_imem = imem_array[ address_imem[31:2] ]; 
       // Word addressing => shift right by 2

    // Data Memory read (combinational):
    assign q_dmem = dmem_array[ address_dmem[31:2] ];

    // Data Memory write (synchronous):
    always @(posedge clock) begin
        if (wren) begin
            dmem_array[ address_dmem[31:2] ] <= data;
        end
    end

    // ------------------------
    // 4) Simple Stub Regfile
    // ------------------------
    // We'll also emulate the register file in the testbench so you can watch
    // the reads/writes. If your design expects a separate RegFile module,
    // be sure you replicate the same read/write behaviors.

    reg [31:0] regfile [0:31];
    
    // Combinational read:
    assign data_readRegA = regfile[ ctrl_readRegA ];
    assign data_readRegB = regfile[ ctrl_readRegB ];

    // Synchronous write:
    always @(posedge clock) begin
        if (ctrl_writeEnable) begin
            regfile[ ctrl_writeReg ] <= data_writeReg;
        end
    end

    // ------------------------
    // 5) Clock Generation
    // ------------------------
    initial clock = 0;
    always #5 clock = ~clock; // 10 ns period => 100 MHz

    // ------------------------
    // 6) Program: Load YOUR instructions
    // ------------------------
    initial begin
        integer i;
        // Initialize instruction & data memory
        for (i = 0; i < 1024; i=i+1) begin
            imem_array[i] = 32'h00000000; // NOP
            dmem_array[i] = 32'h00000000;
        end

        // Also initialize register file
        for (i = 0; i < 32; i=i+1) begin
            regfile[i] = 32'h00000000;
        end

        // Reset the processor
        reset = 1;
        #20; 
        reset = 0;

        // Now, place instructions into imem_array in the correct order.
        // We'll show placeholders. You must encode them to match your ISA.
        // For example, if your addi has opcode=5'b00101, etc.

        // NOP instructions (lines 0..5 or so):
        imem_array[0] = 32'h00000000; // NOP
        imem_array[1] = 32'h00000000; // NOP
        imem_array[2] = 32'h00000000; // NOP
        imem_array[3] = 32'h00000000; // NOP
        imem_array[4] = 32'h00000000; // NOP
        imem_array[5] = 32'h00000000; // NOP

        // Now encode: addi $3, $0, 1 => r3 = 1
        // e.g. (placeholder)  opcode=00101 (addi), rd=3, rs=0, immediate=1
        // imem_array[6] = 32'b00101_00011_00000_000000000000001; 
        // (You must find the exact bits for your project’s format.)
        
        // Similarly for addi $4, $0, 35 => r4 = 35, etc.
        // ...
        // sub $3, $0, $3 => r3 = -1
        // ...
        // sw $1, 1($0) => memory[1] = r1
        // etc.

        // Once you've added all ~14 instructions from your snippet, the CPU
        // will fetch and execute them in order.

        // ------------------------
        // 7) Dump Waveforms
        // ------------------------
        $dumpfile("waves.vcd");
        $dumpvars(0, testbench);  // dump everything in testbench hierarchy

        // ------------------------
        // 8) Run and Finish
        // ------------------------
        #1000; // let the program run some cycles
        $display("Done with test. Check waveforms in GTKWave.");
        $finish;
    end

endmodule
