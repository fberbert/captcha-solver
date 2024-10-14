#!/usr/bin/expect

# Start the bash script that prompts for the captcha
spawn ./simulate_captcha.sh

# Wait for the prompt that contains "Client"
expect -re "Client.*" {

    # Capture the complete buffer up to this point
    set output $expect_out(buffer)

    # Split the buffer into a list of lines
    set lines [split $output "\n"]

    # Verify if the list has at least 3 entries
    if {[llength $lines] >= 3} {
        # Capture the third line from the list
        set line [lindex $lines 2]

        # Use a regular expression to capture the arithmetic expression (the captcha)
        if {[regexp {([0-9]+ *[+\-*\/] *[0-9]+)} $line match expression]} {

            # Evaluate the expression using 'expr' in Tcl
            set result [expr $expression]
            
            # Send the result followed by Enter
            send "$result\r"

            # Wait for the shell prompt after solving the captcha
            expect "$ "
        } else {
            puts "Error: unable to capture the expression"
        }
    } else {
        puts "Error: unable to capture the third line, insufficient lines in the buffer"
    }
}
