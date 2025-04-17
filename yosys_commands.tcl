#Read modules from verilog
read_verilog MBIST_Controller.v
#Elaborate design hierarchy
hierarchy -check -top MBIST_Controller

#Translate Processes to netlist
proc

#mapping to the internal cell library
techmap

#mapping flip-flops to lib
dfflibmap -liberty /home/tuan/Desktop/OpenROAD/test/sky130hd/sky130_fd_sc_hd__tt_025C_1v80.lib
opt


#mapping logic to lib
abc -liberty /home/tuan/Desktop/OpenROAD/test/sky130hd/sky130_fd_sc_hd__tt_025C_1v80.lib


#remove unused cells
clean

#write the synthesized design in a verilog file
stat -liberty /home/tuan/Desktop/OpenROAD/test/sky130hd/sky130_fd_sc_hd__tt_025C_1v80.lib

write_verilog -noattr MBIST_Controller_synth.v

