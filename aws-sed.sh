#!/bin/bash
# Use awk or sed in a script to process a log file and extract only error messages
logfile=system_monitor.log
outputfile=error_messages.log

# Check if log file exists
if [ ! -f "$logfile" ]; then
    echo "Log file $logfile not found!"
    exit 1
fi

# Extract error messages using awk
awk '/error|ERROR|Error/ {print}' "$logfile" > "$outputfile"

# Alternatively, using sed
# sed -n '/error\|ERROR\|Error/p' "$logfile" > "$outputfile"

echo "Error messages extracted to $outputfile"