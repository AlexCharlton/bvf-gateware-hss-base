source ./ENV.tcl

set project_file "$project_dir/$project_name.prjx"
puts "project_file: $project_file"

if {[info exists HSS_IMAGE_PATH]} {
    open_project -file "$project_file"
    create_eNVM_config "$local_dir/script_support/components/MSS/ENVM.cfg" "$HSS_IMAGE_PATH"
    run_tool -name {GENERATEPROGRAMMINGDATA}
    configure_envm -cfg_file {script_support/components/MSS/ENVM.cfg}
    configure_spiflash -cfg_file {./script_support/spiflash.cfg}
    run_tool -name {GENERATEPROGRAMMINGFILE}
    source ./script_support/export_flashproexpress.tcl
} else {
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts "!!!              No Hart Software Services (HSS) image provided.             !!!"
}