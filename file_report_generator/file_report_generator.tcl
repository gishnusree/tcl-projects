# File: file_report_generator.tcl
# Description: Intermediate Tcl script to scan a directory
#              and generate a report of all files.
# ===========================================================

# Step 1: Set the directory to scan
set target_dir "./data"

# Step 2: Create folder if it doesn't exist
if {![file isdirectory $target_dir]} {
    file mkdir $target_dir
    puts "Created directory: $target_dir"
}

# Step 3: Create some sample files for demonstration
for {set i 1} {$i <= 3} {incr i} {
    set file_name "$target_dir/sample_$i.txt"
    set fp [open $file_name w]
    puts $fp "This is file number $i"
    close $fp
}
puts "Created 3 sample files inside $target_dir"

# Step 4: Collect all files in directory
set file_list [glob -nocomplain $target_dir/*]

# Step 5: Generate report file
set report_file "./file_summary.txt"
set rpt [open $report_file w]
puts $rpt "=== File Summary Report ==="
puts $rpt "Directory: $target_dir"
puts $rpt "Total Files: [llength $file_list]"
puts $rpt "---------------------------"

# Step 6: Loop through files and print size
foreach file $file_list {
    set size [file size $file]
    puts $rpt "[file tail $file] --> $size bytes"
}
close $rpt

puts "\nGenerated summary report: $report_file"
puts "Contents:"
set fh [open $report_file r]
puts [read $fh]
close $fh
