# 1. Tạo clock (100 MHz)
create_clock -name clk -period 10 [get_ports clk]

# 2. Gán delay đầu vào
set_input_delay 2 -clock clk [get_ports start_bist]
set_input_delay 2 -clock clk [get_ports dout0[*]] ;# nếu là bus

# 3. Gán delay đầu ra
set_output_delay 2 -clock clk [get_ports {bist_done bist_pass csb0 web0}]
set_output_delay 2 -clock clk [get_ports addr0[*]]
set_output_delay 2 -clock clk [get_ports din0[*]]

# 4. Gỡ input delay cho tín hiệu clock
set_input_delay 0 [get_ports clk]

# 5. Loại reset ra khỏi STA (vì thường không kiểm timing với reset)
set_false_path -from [get_ports rst_n]
