# Assumes flow_helpers.tcl has been read.
read_libraries
#link_design $top_module
#read_verilog $synth_verilog
#read_sdc $sdc_file

set_thread_count [exec getconf _NPROCESSORS_ONLN]
# Temporarily disable sta's threading due to random failures
sta::set_thread_count 1

utl::metric "IFP::ord_version" [ord::openroad_git_describe]
# Note that sta::network_instance_count is not valid after tapcells are added.
utl::metric "IFP::instance_count" [sta::network_instance_count]

initialize_floorplan -site $site \
  -die_area $die_area \
  -core_area $core_area
  
# Thêm utilization ngay sau khi initialize floorplan
set utilization 0.55  ;# 70% utilization
utl::metric "IFP::utilization" $utilization

source $tracks_file

# remove buffers inserted by synthesis 
remove_buffers

################################################################
# IO Placement (random)
place_pins -random -hor_layers $io_placer_hor_layer -ver_layers $io_placer_ver_layer

################################################################
# Macro Placement
#if { [have_macros] } {
#  lassign $macro_place_halo halo_x halo_y
#  set report_dir [make_result_file ${design}_${platform}_rtlmp]
#  rtl_macro_placer -halo_width $halo_x -halo_height $halo_y \
#      -report_directory $report_dir
#}
place_macro -macro_name u_sram -location {560 366} -orientation N
################################################################
# Tapcell insertion
eval tapcell $tapcell_args

################################################################
# Power distribution network insertion
#source $pdn_cfg
#pdngen
################################################################
# Global connections
add_global_connection -net VDD -inst_pattern {.*} -pin_pattern {^VDD$} -power
add_global_connection -net VDD -inst_pattern {.*} -pin_pattern {^VDDPE$}
add_global_connection -net VDD -inst_pattern {.*} -pin_pattern {^VDDCE$}
add_global_connection -net VDD -inst_pattern {.*} -pin_pattern {^VPWR}
add_global_connection -net VDD -inst_pattern {.*} -pin_pattern {^VPB}
add_global_connection -net VSS -inst_pattern {.*} -pin_pattern {^VSS$} -ground
add_global_connection -net VSS -inst_pattern {.*} -pin_pattern {^VSSE$}
add_global_connection -net VSS -inst_pattern {.*} -pin_pattern {^VGND}
add_global_connection -net VSS -inst_pattern {.*} -pin_pattern {^VNB}
global_connect

# Voltage domain
set_voltage_domain -name CORE -power VDD -ground VSS

# Grid cho cell chuẩn (MBIST)
define_pdn_grid -name stdcell_grid -voltage_domains CORE -pins {met4 met5}
add_pdn_stripe -grid stdcell_grid -layer met1 -width 0.48 -pitch 7.56 -offset 0 -followpins
add_pdn_stripe -grid stdcell_grid -layer met4 -width 0.8 -pitch 60.0 -offset 0
add_pdn_connect -grid stdcell_grid -layers {met1 met4}
add_pdn_connect -grid stdcell_grid -layers {met4 met5}

# Grid cho SRAM (macro)
define_pdn_grid -name sram_grid -voltage_domains CORE -macro -cells u_sram -halo {2.0 2.0 2.0 2.0}
add_pdn_stripe -grid sram_grid -layer met4 -width 1.6 -pitch 80.0 -offset 2.0
add_pdn_stripe -grid sram_grid -layer met5 -width 1.6 -pitch 80.0 -offset 2.0
add_pdn_connect -grid sram_grid -layers {met4 met5}

##################################################################
################################################################
# Global placement

foreach layer_adjustment $global_routing_layer_adjustments {
  lassign $layer_adjustment layer adjustment
  set_global_routing_layer_adjustment $layer $adjustment
}
set_routing_layers -signal $global_routing_layers \
  -clock $global_routing_clock_layers
set_macro_extension 2

create_voltage_area -name block_under_sram -coordinate {560 20 1640.16 366} -guard_band_x 10 -guard_band_y 10
global_placement -density 0.15 -pad_left 50 -pad_right 50 -routability_driven -overflow 0.1
#global_placement -routability_driven -density 0.40 \
#  -pad_left $global_place_pad -pad_right $global_place_pad

# IO Placement
place_pins -hor_layers $io_placer_hor_layer -ver_layers $io_placer_ver_layer

# checkpoint
set global_place_db [make_result_file ${design}_${platform}_global_place.db]
write_db $global_place_db

################################################################
# Repair max slew/cap/fanout violations and normalize slews
source $layer_rc_file
set_wire_rc -signal -layer $wire_rc_layer
set_wire_rc -clock  -layer $wire_rc_layer_clk
set_dont_use $dont_use

estimate_parasitics -placement

repair_design -slew_margin $slew_margin -cap_margin $cap_margin

repair_tie_fanout -separation $tie_separation $tielo_port
repair_tie_fanout -separation $tie_separation $tiehi_port


set_placement_padding -global -left 2 -right 2
detailed_placement

# post resize timing report (ideal clocks)
report_worst_slack -min -digits 3
report_worst_slack -max -digits 3
report_tns -digits 3
# Check slew repair
report_check_types -max_slew -max_capacitance -max_fanout -violators

utl::metric "RSZ::repair_design_buffer_count" [rsz::repair_design_buffer_count]
utl::metric "RSZ::max_slew_slack" [expr [sta::max_slew_check_slack_limit] * 100]
utl::metric "RSZ::max_fanout_slack" [expr [sta::max_fanout_check_slack_limit] * 100]
utl::metric "RSZ::max_capacitance_slack" [expr [sta::max_capacitance_check_slack_limit] * 100]

################################################################
# Clock Tree Synthesis

# Clone clock tree inverters next to register loads
# so cts does not try to buffer the inverted clocks.
#repair_clock_inverters

#clock_tree_synthesis -root_buf $cts_buffer -buf_list $cts_buffer \
#  -sink_clustering_enable \
#  -sink_clustering_max_diameter $cts_cluster_diameter
set_dont_use {sky130_fd_sc_hd__clkinvlp_* sky130_fd_sc_hd__inv_*}

clock_tree_synthesis \
  -root_buf sky130_fd_sc_hd__clkbuf_4 \
  -buf_list {sky130_fd_sc_hd__clkbuf_1 sky130_fd_sc_hd__clkbuf_2 sky130_fd_sc_hd__clkbuf_4 sky130_fd_sc_hd__clkbuf_8} \
  -sink_clustering_enable \
  -sink_clustering_max_diameter 100
  
# CTS leaves a long wire from the pad to the clock tree root.
repair_clock_nets

# place clock buffers
detailed_placement

# checkpoint
set cts_db [make_result_file ${design}_${platform}_cts.db]
write_db $cts_db

################################################################
# Setup/hold timing repair

set_propagated_clock [all_clocks]

# Global routing is fast enough for the flow regressions.
# It is NOT FAST ENOUGH FOR PRODUCTION USE.
set repair_timing_use_grt_parasitics 0
if { $repair_timing_use_grt_parasitics } {
  # Global route for parasitics - no guide file requied
  global_route -congestion_iterations 100
  estimate_parasitics -global_routing
} else {
  estimate_parasitics -placement
}

repair_timing -skip_gate_cloning

# Post timing repair.
report_worst_slack -min -digits 3
report_worst_slack -max -digits 3
report_tns -digits 3
report_check_types -max_slew -max_capacitance -max_fanout -violators -digits 3

utl::metric "RSZ::worst_slack_min" [sta::worst_slack -min]
utl::metric "RSZ::worst_slack_max" [sta::worst_slack -max]
utl::metric "RSZ::tns_max" [sta::total_negative_slack -max]
utl::metric "RSZ::hold_buffer_count" [rsz::hold_buffer_count]

################################################################
# Detailed Placement

detailed_placement

# Capture utilization before fillers make it 100%
utl::metric "DPL::utilization" [format %.1f [expr [rsz::utilization] * 100]]
utl::metric "DPL::design_area" [sta::format_area [rsz::design_area] 0]

# checkpoint
set dpl_db [make_result_file ${design}_${platform}_dpl.db]
write_db $dpl_db

set verilog_file [make_result_file ${design}_${platform}.v]
write_verilog $verilog_file

################################################################

# ✅ Xử lý net "zero_" là GROUND (dùng add_global_connection đúng cú pháp OpenROAD)
add_global_connection -net zero_ -inst_pattern .* -pin_pattern zero_ -ground
################################################################






################################################################
# Global routing

pin_access -bottom_routing_layer $min_routing_layer \
           -top_routing_layer $max_routing_layer

set route_guide [make_result_file ${design}_${platform}.route_guide]

#global_route -guide_file $route_guide \
#             -congestion_iterations 100 -verbose

set_routing_layers -signal met1-met5
set_layer_rc -layer met1 -resistance 0.002 -capacitance 0.0004
set_layer_rc -layer met2 -resistance 0.002 -capacitance 0.0004
set_layer_rc -layer met3 -resistance 0.0005 -capacitance 0.0001
set_layer_rc -layer met4 -resistance 0.0005 -capacitance 0.0001
set_layer_rc -layer met5 -resistance 0.0003 -capacitance 0.00005

global_route -congestion_iterations 100 -congestion_report_iter_step 10 -verbose -guide_file route.guide -allow_congestion


set verilog_file [make_result_file ${design}_${platform}.v]
write_verilog -remove_cells $filler_cells $verilog_file

################################################################
# Repair antennas post-GRT

utl::set_metrics_stage "grt__{}"
repair_antennas -iterations 5

check_antennas
utl::clear_metrics_stage
utl::metric "GRT::ANT::errors" [ant::antenna_violation_count]

################################################################
# Detailed routing

# Run pin access again after inserting diodes and moving cells
pin_access -bottom_routing_layer $min_routing_layer \
           -top_routing_layer $max_routing_layer

detailed_route -output_drc [make_result_file "${design}_${platform}_route_drc.rpt"] \
               -output_maze [make_result_file "${design}_${platform}_maze.log"] \
               -no_pin_access \
               -save_guide_updates \
               -bottom_routing_layer $min_routing_layer \
               -top_routing_layer $max_routing_layer \
               -verbose 0

write_guides [make_result_file "${design}_${platform}_output_guide.mod"]
set drv_count [detailed_route_num_drvs]
utl::metric "DRT::drv" $drv_count

set routed_db [make_result_file ${design}_${platform}_route.db]
write_db $routed_db

set routed_def [make_result_file ${design}_${platform}_route.def]
write_def $routed_def

################################################################
# Repair antennas post-DRT

set repair_antennas_iters 0
utl::set_metrics_stage "drt__repair_antennas__pre_repair__{}"
while {[check_antennas] && $repair_antennas_iters < 5} {
  utl::set_metrics_stage "drt__repair_antennas__iter_${repair_antennas_iters}__{}"

  repair_antennas

  detailed_route -output_drc [make_result_file "${design}_${platform}_ant_fix_drc.rpt"] \
                 -output_maze [make_result_file "${design}_${platform}_ant_fix_maze.log"] \
                 -save_guide_updates \
                 -bottom_routing_layer $min_routing_layer \
                 -top_routing_layer $max_routing_layer \
                 -verbose 0

  incr repair_antennas_iters
}

utl::set_metrics_stage "drt__{}"
check_antennas

utl::clear_metrics_stage
utl::metric "DRT::ANT::errors" [ant::antenna_violation_count]

if {![design_is_routed]} {
  error "Design has unrouted nets."
}

set repair_antennas_db [make_result_file ${design}_${platform}_repaired_route.odb]
write_db $repair_antennas_db

################################################################
# Filler placement

filler_placement $filler_cells
check_placement -verbose

# checkpoint
set fill_db [make_result_file ${design}_${platform}_fill.db]
write_db $fill_db

#################################################################################
####################################################################################

