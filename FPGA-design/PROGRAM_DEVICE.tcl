if { $::argc > 0 } {
    set i 1
    foreach arg $::argv {
        if {[string match "*:*" $arg]} {
            set temp [split $arg ":"]
            puts "Setting parameter [lindex $temp 0] to [lindex $temp 1]"
            set [lindex $temp 0] "[lindex $temp 1]"
        } else {
            set $arg 1
            puts "set $arg to 1"
        }
        incr i
    }
} else {
    puts "no command line argument passed"
}

if {[info exists PROG_EXPORT_PATH]} {
    set prog_export_path $PROG_EXPORT_PATH/bitstream
} else {
    set prog_export_path $local_dir/bitstream
}

puts "Current directory: [pwd]"


set fpe_export_path "[pwd]/$prog_export_path/FlashProExpress"
set job_file "$fpe_export_path/$TOP_LEVEL_NAME.job"
set project_file "$fpe_export_path/$TOP_LEVEL_NAME/$TOP_LEVEL_NAME.pro"

puts "fpe_export_path: $fpe_export_path"

create_job_project -job_project_location $fpe_export_path -job_file $job_file

open_project -project $project_file -connect_programmers 1
# enable_prg -name S208651 -enable TRUE
set_programming_action -name $DEVICE -action PROGRAM
run_selected_actions
close_project
