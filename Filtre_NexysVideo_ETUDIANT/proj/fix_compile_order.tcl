# Fix compile order and missing source registration for wah-wah units
# Usage from Vivado Tcl console (project opened):
#   source Filtre_NexysVideo_ETUDIANT/proj/fix_compile_order.tcl

set script_dir [file dirname [file normalize [info script]]]
set root_dir   [file normalize [file join $script_dir ..]]
set hdl_dir    [file join $root_dir src hdl]

set wah_files [list \
  [file join $hdl_dir wahwahUnit.vhd] \
  [file join $hdl_dir wahwah_biquad.vhd] \
  [file join $hdl_dir wahwah_coeff_rom.vhd] \
]

set tb_file [file join $hdl_dir tb_wahwahUnit.vhd]

foreach fs {sources_1 sim_1} {
  foreach f $wah_files {
    if {[file exists $f]} {
      add_files -norecurse -fileset $fs $f
    } else {
      puts "WARNING: missing file: $f"
    }
  }
  update_compile_order -fileset $fs
}

if {[file exists $tb_file]} {
  add_files -norecurse -fileset sim_1 $tb_file
  set_property top tb_wahwahUnit [get_filesets sim_1]
  update_compile_order -fileset sim_1
  puts "INFO: Simulation testbench added: $tb_file"
} else {
  puts "WARNING: testbench not found: $tb_file"
}

puts "INFO: Compile order updated for sources_1 and sim_1."
puts "INFO: You can now run: reset_run synth_1; launch_runs synth_1"
puts "INFO: For simulation: reset_run sim_1; launch_simulation"
