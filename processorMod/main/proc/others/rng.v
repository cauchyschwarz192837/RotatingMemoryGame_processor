module rng(random_number, clk);
    input clk;
    output[3:0] random_number;
    
    reg initial_cycle = 1;
    always @ (posedge clk) begin
        initial_cycle <= 0;
    end

    wire q_0, q_1, q_2, q_3, d_0;
    assign d_0 = q_2 ^ q_3;

    // module dffe_ref (q, d, clk, en, clr);
    dffe_ref flip_flop_0(q_0, initial_cycle ? 1'b1 : d_0, clk, 1'b1, 1'b0);
    dffe_ref flip_flop_1(q_1, q_0, clk, 1'b1, 1'b0);
    dffe_ref flip_flop_2(q_2, q_1, clk, 1'b1, 1'b0);
    dffe_ref flip_flop_3(q_3, q_2, clk, 1'b1, 1'b0);

    assign random_number[0] = q_0;
    assign random_number[1] = q_1;
    assign random_number[2] = q_2;
    assign random_number[3] = q_3;

endmodule