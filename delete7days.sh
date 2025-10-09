#!/bin/bash
# Write a script that automatically deletes log files older than 7 days from /var/logs directory and saves the names of deleted files to deleted_logs.txt file

find /var/logs -type f -name "*.log" -mtime +7 -exec rm -v {} \; >> deleted_logs.txt
echo "Deleted log files older than 7 days. Check deleted_logs.txt for details."