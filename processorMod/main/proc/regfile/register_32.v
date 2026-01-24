module register_32(out, data, clock, enable, clear);

    input [31:0] data;
    output [31:0] out;
    input clock, enable, clear;
    dffe_ref dffe_reg[31:0] (out, data, clock, enable, clear);
    
endmodule