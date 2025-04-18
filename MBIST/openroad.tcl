set script_dir [file dirname [info script]]
set test_dir "/home/tuan/Desktop/OpenROAD/test"

# Load helper scripts
source "$test_dir/helpers.tcl"
source "$test_dir/flow_helpers.tcl"
source "$test_dir/sky130hd/sky130hd.vars"

read_lef /home/tuan/Desktop/OpenROAD/test/sky130hd/sky130hd.tlef
read_lef /home/tuan/Desktop/OpenROAD/test/sky130hd/sky130hd_std_cell.lef
read_liberty /home/tuan/Desktop/OpenROAD/test/sky130hd/sky130hd_tt.lib

# Set design parameters
set design "MBIST_Controller"
set top_module "MBIST_Controller"
set synth_verilog "MBIST_Controller_synth.v"
set sdc_file "top2.sdc"

# Set physical design constraints
set die_area {0 0 120 120}
set core_area {10 10 100 100}
set site unithd
# Load flow script
source -echo "floorplan.tcl"


