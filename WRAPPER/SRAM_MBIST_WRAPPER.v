module SRAM_MBIST_WRAPPER (
    input               clk,
    input               rst_n,
    input               mbist_enable,    // Điều khiển bật/tắt MBIST
    input               start_bist,      // Kích hoạt MBIST

    output              bist_done,
    output              bist_pass,

    // Cổng giao tiếp bình thường với SRAM
    input               csb0_ext,
    input               web0_ext,
    input  [8:0]        addr0_ext,
    input  [31:0]       din0_ext,
    output [31:0]       dout0_ext,

    // === IEEE 1500 Signals ===
    input        [7:0]  wcr_in,          // Wrapper Control Register (write)
    output reg   [7:0]  wcr_out,         // Wrapper Control Register (read)

    input        [31:0] wdr_in,          // Wrapper Data Register (write)
    output reg  [31:0]  wdr_out,         // Wrapper Data Register (read)

    output reg  [63:0]  wbr,             // Wrapper Boundary Register

    `ifdef USE_POWER_PINS
    inout               vdd,
    inout               gnd
    `endif
);

    // Tín hiệu chọn giữa MBIST và người dùng
    wire csb0_mux, web0_mux;
    wire [8:0] addr0_mux;
    wire [31:0] din0_mux;

    wire [31:0] dout0_sram;

    // MBIST controller outputs
    wire csb0_bist, web0_bist;
    wire [8:0] addr0_bist;
    wire [31:0] din0_bist;

    // Chọn tín hiệu đầu vào dựa vào mbist_enable
    assign csb0_mux   = (mbist_enable) ? csb0_bist   : csb0_ext;
    assign web0_mux   = (mbist_enable) ? web0_bist   : web0_ext;
    assign addr0_mux  = (mbist_enable) ? addr0_bist  : addr0_ext;
    assign din0_mux   = (mbist_enable) ? din0_bist   : din0_ext;

    // Output ra ngoài
    assign dout0_ext = dout0_sram;

    // === Xử lý IEEE 1500 Register ===
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wcr_out  <= 8'h00;
            wdr_out  <= 32'h00000000;
            wbr      <= 64'h0;
        end else begin
            // WCR phản ánh trạng thái MBIST
            wcr_out[0] <= mbist_enable;   // Bit 0: MBIST enable
            wcr_out[1] <= start_bist;     // Bit 1: MBIST trigger
            wcr_out[2] <= bist_done;      // Bit 2: MBIST done
            wcr_out[3] <= bist_pass;      // Bit 3: MBIST pass/fail

            // WDR phản ánh dữ liệu đầu ra SRAM khi cần test
            wdr_out <= dout0_sram;

            // WBR thể hiện trạng thái boundary (dữ liệu + addr)
            wbr <= {addr0_mux, din0_mux};  // Gộp lại để scan
        end
    end

    // SRAM instance
    sram_32_512_sky130A u_sram (
        `ifdef USE_POWER_PINS
        .vdd(vdd),
        .gnd(gnd),
        `endif
        .clk0(clk),
        .csb0(csb0_mux),
        .web0(web0_mux),
        .addr0(addr0_mux),
        .din0(din0_mux),
        .dout0(dout0_sram)
    );

    // MBIST Controller instance
    MBIST_Controller #(
        .ADDR_WIDTH(9),
        .DATA_WIDTH(32)
    ) u_mbist (
        .clk(clk),
        .rst_n(rst_n),
        .start_bist(start_bist),
        .bist_done(bist_done),
        .bist_pass(bist_pass),
        .csb0(csb0_bist),
        .web0(web0_bist),
        .addr0(addr0_bist),
        .din0(din0_bist),
        .dout0(dout0_sram)
    );

endmodule

