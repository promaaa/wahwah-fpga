# Fix compile order and missing source registration for wah-wah units
# Usage from Vivado Tcl console (project opened):
#   source Filtre_NexysVideo_ETUDIANT/proj/fix_compile_order.tcl

set script_dir [file dirname [file normalize [info script]]]
set root_dir   [file normalize [file join $script_dir ..]]
set hdl_dir    [file join $root_dir src hdl]

set wah_files [list \
  [file join $hdl_dir wahwahUnit.vhd] \
  [file join $hdl_dir wahwah_biquad.vhd] \
  [file join $hdl_dir wahwah_biquad_fsm.vhd] \
  [file join $hdl_dir wahwah_coeff_rom.vhd] \
]

set tb_file [file join $hdl_dir tb_wahwahUnit.vhd]

set src_fs [get_filesets sources_1]
set sim_fs [get_filesets sim_1]

set_property default_lib work [current_project]

foreach f $wah_files {
  if {[file exists $f]} {
    add_files -norecurse -fileset $src_fs $f
    set f_obj [get_files -quiet -of_objects $src_fs $f]
    if {[llength $f_obj] > 0} {
      set_property library work $f_obj
      set_property used_in_synthesis true $f_obj
      set_property used_in_implementation true $f_obj
    }
  } else {
    puts "WARNING: missing file: $f"
  }
}

# Force VHDL dependency order for wah-wah chain
set ordered_wah_files [list \
  [file join $hdl_dir wahwah_biquad_fsm.vhd] \
  [file join $hdl_dir wahwah_coeff_rom.vhd] \
  [file join $hdl_dir wahwah_biquad.vhd] \
  [file join $hdl_dir wahwahUnit.vhd] \
  [file join $hdl_dir fir.vhd] \
]

foreach f $ordered_wah_files {
  if {[file exists $f]} {
    set f_obj [get_files -quiet -of_objects $src_fs $f]
    if {[llength $f_obj] > 0} {
      reorder_files -front $f_obj
    }
  }
}
update_compile_order -fileset $src_fs

if {[file exists $tb_file]} {
  add_files -norecurse -fileset $sim_fs $tb_file
  set_property top tb_wahwahUnit $sim_fs
  update_compile_order -fileset $sim_fs
  puts "INFO: Simulation testbench added: $tb_file"
} else {
  puts "WARNING: testbench not found: $tb_file"
}

puts "INFO: Compile order updated for sources_1 and sim_1."
puts "INFO: You can now run: reset_run synth_1; launch_runs synth_1"
puts "INFO: For simulation: reset_run sim_1; launch_simulation"
