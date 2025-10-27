# Copyright (C) 2023  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and any partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details, at
# https://fpgasoftware.intel.com/eula.

# Quartus Prime: Generate Tcl File for Project
# File: fourb_vm.tcl
# Generated on: Fri Dec  1 23:51:28 2023

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "fourb_vm"]} {
		puts "Project fourb_vm is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists fourb_vm]} {
		project_open -revision fourb_vm fourb_vm
	} else {
		project_new -revision fourb_vm fourb_vm
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "MAX 10"
	set_global_assignment -name DEVICE 10M08DAF484C8G
	set_global_assignment -name TOP_LEVEL_ENTITY BinaryVedicAdder_4bit
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 22.1STD.2
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "18:38:04  NOVEMBER 24, 2023"
	set_global_assignment -name LAST_QUARTUS_VERSION "22.1std.2 Lite Edition"
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 256
	set_global_assignment -name SYSTEMVERILOG_FILE ../vedicadder1/BinaryVedicAdder_4bit.sv
	set_global_assignment -name SYSTEMVERILOG_FILE fourb_vm.sv
	set_global_assignment -name SYSTEMVERILOG_FILE CarryLookaheadAdder_2bit.sv
	set_global_assignment -name SYSTEMVERILOG_FILE VedicMultiplier_2bit.sv
	set_global_assignment -name VECTOR_WAVEFORM_FILE Waveform5.vwf
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name VECTOR_WAVEFORM_FILE Waveform6.vwf
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name VECTOR_WAVEFORM_FILE Waveform7.vwf
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
