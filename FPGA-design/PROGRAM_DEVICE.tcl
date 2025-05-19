if { $::argc > 0 } {
    set i 1
    foreach arg $::argv {
        # Split at first colon only
        set idx [string first ":" $arg]
        if {$idx != -1} {
            set param [string range $arg 0 [expr {$idx-1}]]
            set value [string range $arg [expr {$idx+1}] end]
            puts "Setting parameter $param to $value"
            set $param $value
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
    set prog_export_path $PROG_EXPORT_PATH
} else {
    error "PROG_EXPORT_PATH is not set"
}


set fpe_export_path "$prog_export_path/FlashProExpress"
set job_file "$fpe_export_path/$TOP_LEVEL_NAME.job"
set project_file "$fpe_export_path/$TOP_LEVEL_NAME/$TOP_LEVEL_NAME.pro"

puts "fpe_export_path: $fpe_export_path"

create_job_project -job_project_location $fpe_export_path -job_file $job_file

open_project -project $project_file -connect_programmers 1
set_programming_action -name $DEVICE -action PROGRAM
run_selected_actions
close_project
