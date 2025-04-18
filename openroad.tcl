set script_dir [file dirname [info script]]
set test_dir "/home/tuan/Desktop/OpenROAD/test"

# Load helper scripts
source "$test_dir/helpers.tcl"
source "$test_dir/flow_helpers.tcl"
source "$test_dir/sky130hd/sky130hd.vars"

read_lef /home/tuan/Desktop/OpenROAD/test/sky130hd/sky130hd.tlef
read_lef /home/tuan/Desktop/OpenROAD/test/sky130hd/sky130hd_std_cell.lef

read_liberty /home/tuan/Desktop/OpenROAD/test/sky130hd/sky130hd_tt.lib
read_liberty sram_32_512_sky130A_TT_1p8V_25C.lib
# Load LEF
read_lef sram_32_512_sky130A.lef

# read netlist
set design "SRAM_MBIST_WRAPPER"
read_verilog SRAM_MBIST_WRAPPER_synth.v
link_design SRAM_MBIST_WRAPPER
read_sdc top3.sdc

# Set physical design constraints
set die_area {0 0 2400 2400}
set core_area {20 20 2360 2360}

# Place SRAM macro


# Power distribution network (PDN)


# Load flow script
source -echo "floorplan.tcl"


