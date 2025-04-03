module tri_state(in, oe, out);

    input [31:0] in;
    input oe;
    output [31:0] out;

    assign out = oe ? in : 32'bz;

endmodule

module tri_state_5(in, enable, out);

    input [4:0] in;
    input enable;
    output [4:0] out;

    assign out = enable ? in : 5'bz;

endmodule