#!/bin/bash

# Monitors CPU and memory usage every 5 seconds and logs the results to a file

while true; do
    echo "Timestamp: $(date)" >> system_monitor.log # Log current timestamp
    echo "CPU and Memory Usage:" >> system_monitor.log # Header for the log section
    top -b -n1 | head -n 10 >> system_monitor.log # Capture top 10 processes
    echo "----------------------------------------" >> system_monitor.log # Separator
    sleep 5 # Wait for 5 seconds before the next iteration
done