#!/usr/bin/expect

# Start the bash script that prompts for the captcha
spawn ./simulate-captcha.sh

# Wait for the prompt that contains "Client"
expect -re "Client.*" {

    # Capture the complete buffer up to this point
    set output $expect_out(buffer)

    # Use a regular expression to capture everything starting from "Client"
    if {[regexp -inline {Client.*} $output] ne ""} {
        # Update 'output' to contain only the part starting from "Client"
        set output [regexp -inline {Client.*} $output]
    }

    # Print the filtered output (only the part after "Client")
    # puts "Filtered output: $output"

    # Split the buffer into a list of lines
    set lines [split $output "\n"]

    # Verify if the list has at least 3 entries
    if {[llength $lines] >= 3} {

        # Capture the third line from the list
        set line [lindex $lines 2]

        # remove the = ? at the end of the line
        regsub { = \?} $line "" line

        # solve the captcha
        set result [expr $line]

        # Send the result followed by Enter
        send "$result\r"

        # Wait for the shell prompt after solving the captcha
        expect "$ "
    } else {
        puts "Error: unable to capture the third line, insufficient lines in the buffer"
    }
}
