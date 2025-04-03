module decoder_32(out, enable, select);

    input enable;
    input [4:0] select;
    output [31:0] out;

    assign out = enable << select;

endmodule