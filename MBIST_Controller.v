// MBIST_Controller.v - tương thích chuẩn OpenRAM
module MBIST_Controller #(
    parameter ADDR_WIDTH = 9,
    parameter DATA_WIDTH = 32
)(
    input clk,
    input rst_n,
    input start_bist,
    output reg bist_done,
    output reg bist_pass,

    output reg csb0,
    output reg web0,
    output reg [ADDR_WIDTH-1:0] addr0,
    output reg [DATA_WIDTH-1:0] din0,
    input [DATA_WIDTH-1:0] dout0
);

    reg [ADDR_WIDTH:0] addr_cnt;
    reg [2:0] state;

    localparam IDLE        = 3'd0,
               WRITE_ZERO  = 3'd1,
               READ_ZERO   = 3'd2,
               WRITE_ONE   = 3'd3,
               READ_ONE    = 3'd4,
               DONE        = 3'd5;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
            addr_cnt <= 0;
            bist_done <= 0;
            bist_pass <= 1;
            csb0 <= 1;
            web0 <= 1;
        end else begin
            case (state)
                IDLE: begin
                    if (start_bist) begin
                        addr_cnt <= 0;
                        bist_done <= 0;
                        bist_pass <= 1;
                        state <= WRITE_ZERO;
                    end
                end

                WRITE_ZERO: begin
                    csb0 <= 0; web0 <= 0;
                    addr0 <= addr_cnt;
                    din0 <= 32'h00000000;

                    if (addr_cnt == (1 << ADDR_WIDTH) - 1)
                        state <= READ_ZERO;
                    addr_cnt <= addr_cnt + 1;
                end

                READ_ZERO: begin
                    csb0 <= 0; web0 <= 1;
                    addr0 <= addr_cnt;

                    if (dout0 !== 32'h00000000)
                        bist_pass <= 0;

                    if (addr_cnt == (1 << ADDR_WIDTH) - 1) begin
                        addr_cnt <= 0;
                        state <= WRITE_ONE;
                    end else
                        addr_cnt <= addr_cnt + 1;
                end

                WRITE_ONE: begin
                    csb0 <= 0; web0 <= 0;
                    addr0 <= addr_cnt;
                    din0 <= 32'hFFFFFFFF;

                    if (addr_cnt == (1 << ADDR_WIDTH) - 1)
                        state <= READ_ONE;
                    addr_cnt <= addr_cnt + 1;
                end

                READ_ONE: begin
                    csb0 <= 0; web0 <= 1;
                    addr0 <= addr_cnt;

                    if (dout0 !== 32'hFFFFFFFF)
                        bist_pass <= 0;

                    if (addr_cnt == (1 << ADDR_WIDTH) - 1)
                        state <= DONE;
                    addr_cnt <= addr_cnt + 1;
                end

                DONE: begin
                    csb0 <= 1; web0 <= 1;
                    bist_done <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule

