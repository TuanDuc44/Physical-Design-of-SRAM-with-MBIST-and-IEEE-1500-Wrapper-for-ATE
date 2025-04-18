# 1. Tạo clock 100 MHz
create_clock -name clk -period 10 [get_ports clk]

# 2. Gán delay đầu vào
set_input_delay 2 -clock clk [get_ports start_bist]
set_input_delay 2 -clock clk [get_ports mbist_enable]
set_input_delay 2 -clock clk [get_ports csb0_ext]
set_input_delay 2 -clock clk [get_ports web0_ext]
set_input_delay 2 -clock clk [get_ports addr0_ext[*]]
set_input_delay 2 -clock clk [get_ports din0_ext[*]]
set_input_delay 2 -clock clk [get_ports wcr_in[*]]
set_input_delay 2 -clock clk [get_ports wdr_in[*]]

# 3. Gán delay đầu ra
set_output_delay 2 -clock clk [get_ports bist_done]
set_output_delay 2 -clock clk [get_ports bist_pass]
set_output_delay 2 -clock clk [get_ports dout0_ext[*]]
set_output_delay 2 -clock clk [get_ports wcr_out[*]]
set_output_delay 2 -clock clk [get_ports wdr_out[*]]
set_output_delay 2 -clock clk [get_ports wbr[*]]

# 4. Gỡ delay cho tín hiệu clock
set_input_delay 0 [get_ports clk]

# 5. Bỏ qua đường reset khỏi phân tích timing
set_false_path -from [get_ports rst_n]
