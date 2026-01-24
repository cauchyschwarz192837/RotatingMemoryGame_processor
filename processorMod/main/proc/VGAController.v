`timescale 1 ns / 100 ps

module VGAController(
    input clk,         // 100 MHz system clock
    input reset,       // Reset signal
    output hSync,      // Horizontal sync signal
    output vSync,      // Vertical sync signal
    output [3:0] VGA_R, // 4-bit Red channel
    output [3:0] VGA_G, // 4-bit Green channel
    output [3:0] VGA_B, // 4-bit Blue channel
    input BTNR,
    input BTNL,
    input BTNU,
    input BTND,

    output reg [9:0] block_x,
    output reg [8:0] block_y,

    input b1_ON,
    input b2_ON,
    input b3_ON,
    input b4_ON,
    input b5_ON,
    input b6_ON,
    input b7_ON,
    input b8_ON,
    input b9_ON,
    input b10_ON,
    input b11_ON,
    input b12_ON,
    input b13_ON,
    input b14_ON,
    input b15_ON,
    input b16_ON,

    input [11:0] b1_COLOR,
    input [11:0] b2_COLOR,
    input [11:0] b3_COLOR,
    input [11:0] b4_COLOR,
    input [11:0] b5_COLOR,
    input [11:0] b6_COLOR,
    input [11:0] b7_COLOR,
    input [11:0] b8_COLOR,
    input [11:0] b9_COLOR,
    input [11:0] b10_COLOR,
    input [11:0] b11_COLOR,
    input [11:0] b12_COLOR,
    input [11:0] b13_COLOR,
    input [11:0] b14_COLOR,
    input [11:0] b15_COLOR,
    input [11:0] b16_COLOR,

    input b1_SOLVED,
    input b2_SOLVED,
    input b3_SOLVED,
    input b4_SOLVED,
    input b5_SOLVED,
    input b6_SOLVED,
    input b7_SOLVED,
    input b8_SOLVED,
    input b9_SOLVED,
    input b10_SOLVED,
    input b11_SOLVED,
    input b12_SOLVED,
    input b13_SOLVED,
    input b14_SOLVED,
    input b15_SOLVED,
    input b16_SOLVED

);

//------------------------------------------------------------------------------------------

    // Divide 100 MHz clock to 25 MHz for VGA timing
    reg [1:0] pixCounter = 0;
    wire clk25;
    always @(posedge clk or posedge reset) begin
        if (reset)
            pixCounter <= 0;
        else
            pixCounter <= pixCounter + 1;
    end
    assign clk25 = pixCounter[1];

//------------------------------------------------------------------------------------------

    // VGA Timing Generation for a 640 x 480 display
    localparam VIDEO_WIDTH  = 640;
    localparam VIDEO_HEIGHT = 480;
    
    wire active, screenEnd;
    wire [9:0] x;
    wire [8:0] y;
    
    VGATimingGenerator #(
        .WIDTH(VIDEO_WIDTH),
        .HEIGHT(VIDEO_HEIGHT)
    ) vga_timing (
        .clk25(clk25),
        .reset(reset),
        .screenEnd(screenEnd),
        .active(active),
        .hSync(hSync),
        .vSync(vSync),
        .x(x),
        .y(y) // gives the x and y coordinates that we should consider
    );
    
//------------------------------------------------------------------------------------------

    parameter GRID_ROWS  = 4;
    parameter GRID_COLS  = 4;
    parameter CELL_SIZE  = 70;  
    parameter GAP_SIZE   = 20;
    localparam GRID_WIDTH  = GRID_COLS * CELL_SIZE + (GRID_COLS + 1) * GAP_SIZE;
    localparam GRID_HEIGHT = GRID_ROWS * CELL_SIZE + (GRID_ROWS + 1) * GAP_SIZE;
    localparam LEFT_MARGIN = (VIDEO_WIDTH  - GRID_WIDTH)  / 2; 
    localparam TOP_MARGIN  = (VIDEO_HEIGHT - GRID_HEIGHT) / 2;

//------------------------------------------------------------------------------------------

    parameter BLOCK_BASE_COLOR = 12'hFFF; // Color for grid blocks (white)
    parameter GAP_COLOR   = 12'h0F0; // Color for gaps (green)
    parameter BG_COLOR    = 12'h00F; // Background color (blue) 
    parameter CHAR_COLOR  = 12'hF00; // Color for character block (red)

//------------------------------------------------------------------------------------------

    wire [11:0] colorOut;
    reg  [11:0] pixel_color;

    // Compute coordinates relative to the grid area, check if within the play area
    wire [9:0] x_rel = (x >= LEFT_MARGIN && x < LEFT_MARGIN + GRID_WIDTH) ? (x - LEFT_MARGIN) : 0;
    wire [9:0] y_rel = (y >= TOP_MARGIN  && y < TOP_MARGIN + GRID_HEIGHT) ? (y - TOP_MARGIN) : 0; 

    // One period = one cell plus one gap
    localparam PERIOD = CELL_SIZE + GAP_SIZE;
    wire [9:0] mod_x = x_rel % PERIOD;
    wire [9:0] mod_y = y_rel % PERIOD;

//------------------------------------------------------------------------------------------

    parameter MOVE_DELAY = 32'd2; // update position every 2 frames
    reg [31:0] move_delay_counter; // Delay counter for movement

//------------------------------------------------------------------------------------------

    always @(posedge clk) begin
        pixel_color = BG_COLOR;
        if (!active) begin
            pixel_color = BG_COLOR;
        end else if (x < LEFT_MARGIN || x >= LEFT_MARGIN + GRID_WIDTH || y < TOP_MARGIN  || y >= TOP_MARGIN + GRID_HEIGHT) begin
            pixel_color = BG_COLOR;
        end else if (mod_x < GAP_SIZE || mod_y < GAP_SIZE) begin
            pixel_color = GAP_COLOR;
        end else begin
            if (x > 149 && x <= 220 && y > 69 && y <= 140) begin  // BLOCK 1
                if (b1_SOLVED == 1) begin
                    pixel_color = GAP_COLOR;
                end else if (b1_ON == 1) begin
                    pixel_color = b1_COLOR;
                end else begin
                    pixel_color = BLOCK_BASE_COLOR;
                end
            end else if (x > 239 && x <= 310 && y > 69 && y <= 140) begin  // BLOCK 2                
                if (b2_SOLVED == 1) begin
                    pixel_color = GAP_COLOR;
                end else if (b2_ON == 1) begin
                    pixel_color = b2_COLOR;
                end else begin
                    pixel_color = BLOCK_BASE_COLOR;
                end
            end else if (x > 329 && x <= 400 && y > 69 && y <= 140) begin  // BLOCK 3
                if (b3_SOLVED == 1) begin
                    pixel_color = GAP_COLOR;
                end else if (b3_ON == 1) begin
                    pixel_color = b3_COLOR;
                end else begin
                    pixel_color = BLOCK_BASE_COLOR;
                end
            end else if (x > 419 && x <= 490 && y > 69 && y <= 140) begin  // BLOCK 4
                if (b4_SOLVED == 1) begin
                    pixel_color = GAP_COLOR;
                end else if (b4_ON == 1) begin
                    pixel_color = b4_COLOR;
                end else begin
                    pixel_color = BLOCK_BASE_COLOR;
                end
            end else if (x > 149 && x <= 220 && y > 159 && y <= 230) begin // BLOCK 5
                if (b5_SOLVED == 1) begin
                    pixel_color = GAP_COLOR;
                end else if (b5_ON == 1) begin
                    pixel_color = b5_COLOR;
                end else begin
                    pixel_color = BLOCK_BASE_COLOR;
                end
            end else if (x > 239 && x <= 310 && y > 159 && y <= 230) begin // BLOCK 6
                if (b6_SOLVED == 1) begin
                    pixel_color = GAP_COLOR;
                end else if (b6_ON == 1) begin
                    pixel_color = b6_COLOR;
                end else begin
                    pixel_color = BLOCK_BASE_COLOR;
                end
            end else if (x > 329 && x <= 400 && y > 159 && y <= 230) begin // BLOCK 7
                if (b7_SOLVED == 1) begin
                    pixel_color = GAP_COLOR;
                end else if (b7_ON == 1) begin
                    pixel_color = b7_COLOR;
                end else begin
                    pixel_color = BLOCK_BASE_COLOR;
                end
            end else if (x > 419 && x <= 490 && y > 159 && y <= 230) begin // BLOCK 8
                if (b8_SOLVED == 1) begin
                    pixel_color = GAP_COLOR;
                end else if (b8_ON == 1) begin
                    pixel_color = b8_COLOR;
                end else begin
                    pixel_color = BLOCK_BASE_COLOR;
                end
            end else if (x > 149 && x <= 220 && y > 249 && y <= 320) begin // BLOCK 9
                if (b9_SOLVED == 1) begin
                    pixel_color = GAP_COLOR;
                end else if (b9_ON == 1) begin
                    pixel_color = b9_COLOR;
                end else begin
                    pixel_color = BLOCK_BASE_COLOR;
                end
            end else if (x > 239 && x <= 310 && y > 249 && y <= 320) begin // BLOCK 10
                if (b10_SOLVED == 1) begin
                    pixel_color = GAP_COLOR;
                end else if (b10_ON == 1) begin
                    pixel_color = b10_COLOR;
                end else begin
                    pixel_color = BLOCK_BASE_COLOR;
                end
            end else if (x > 329 && x <= 400 && y > 249 && y <= 320) begin // BLOCK 11
                if (b11_SOLVED == 1) begin
                    pixel_color = GAP_COLOR;
                end else if (b11_ON == 1) begin
                    pixel_color = b11_COLOR;
                end else begin
                    pixel_color = BLOCK_BASE_COLOR;
                end
            end else if (x > 419 && x <= 490 && y > 249 && y <= 320) begin // BLOCK 12
                if (b12_SOLVED == 1) begin
                    pixel_color = GAP_COLOR;
                end else if (b12_ON == 1) begin
                    pixel_color = b12_COLOR;
                end else begin
                    pixel_color = BLOCK_BASE_COLOR;
                end
            end else if (x > 149 && x <= 220 && y > 339 && y <= 410) begin // BLOCK 13
                if (b13_SOLVED == 1) begin
                    pixel_color = GAP_COLOR;
                end else if (b13_ON == 1) begin
                    pixel_color = b13_COLOR;
                end else begin
                    pixel_color = BLOCK_BASE_COLOR;
                end
            end else if (x > 239 && x <= 310 && y > 339 && y <= 410) begin // BLOCK 14
                if (b14_SOLVED == 1) begin
                    pixel_color = GAP_COLOR;
                end else if (b14_ON == 1) begin
                    pixel_color = b14_COLOR;
                end else begin
                    pixel_color = BLOCK_BASE_COLOR;
                end
            end else if (x > 329 && x <= 400 && y > 339 && y <= 410) begin // BLOCK 15
                if (b15_SOLVED == 1) begin
                    pixel_color = GAP_COLOR;
                end else if (b15_ON == 1) begin
                    pixel_color = b15_COLOR;
                end else begin
                    pixel_color = BLOCK_BASE_COLOR;
                end
            end else if (x > 419 && x <= 490 && y > 339 && y <= 410) begin // BLOCK 16
                if (b16_SOLVED == 1) begin
                    pixel_color = GAP_COLOR;
                end else if (b16_ON == 1) begin
                    pixel_color = b16_COLOR;
                end else begin
                    pixel_color = BLOCK_BASE_COLOR;
                end
            end
        end
    end 

//------------------------------------------------------------------------------------------

    reg [9:0] ref_reg_x; 
	reg [8:0] ref_reg_y;
	wire active_square;

    assign active_square = (x >= ref_reg_x && x < ref_reg_x + 10'b0000001100 && y >= ref_reg_y && y < ref_reg_y + 9'b000001100);
    assign colorOut = active_square ? CHAR_COLOR : pixel_color;

//------------------------------------------------------------------------------------------

    // Initialize the moving character block registers and delay counter
    initial begin
        ref_reg_x = LEFT_MARGIN;
        ref_reg_y = TOP_MARGIN;
        move_delay_counter = 0;
    end

    // MOVING CHARACTER BLOCK with delay
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ref_reg_x <= LEFT_MARGIN;
            ref_reg_y <= TOP_MARGIN;
            move_delay_counter <= 0;
            block_x <= LEFT_MARGIN;
            block_y <= TOP_MARGIN;
        end else if (screenEnd) begin
            if (move_delay_counter < MOVE_DELAY) begin
                move_delay_counter <= move_delay_counter + 1;
            end else begin
                move_delay_counter <= 0;

                if (BTNU) begin
                    ref_reg_y <= ref_reg_y - 1;
                end else if (BTND) begin
                    ref_reg_y <= ref_reg_y + 1;
                end else if (BTNR) begin
                    ref_reg_x <= ref_reg_x + 1;
                end else if (BTNL) begin
                    ref_reg_x <= ref_reg_x - 1;
                end

                block_x <= ref_reg_x;
                block_y <= ref_reg_y;
            end
        end
    end

//------------------------------------------------------------------------------------------

    assign {VGA_R, VGA_G, VGA_B} = active ? colorOut : 12'h000;

endmodule
