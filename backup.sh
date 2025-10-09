#!/bin/bash
# Set up a cron job that runs a script to back up (zip/tar) a directory daily

source_dir=/C/Users/KranthiVodnala/Downloads/60_days_DevOps
backup_dir=/C/Users/KranthiVodnala/Downloads/60_days_Devops/backup

# Create a backup directory if it doesn't exist
mkdir -p $backup_dir
# Create a timestamp
timestamp=$(date +"%Y%m%d_%H%M%S")
# Create a backup file name
backup_file="$backup_dir/backup_$timestamp.tar.gz"
# Create a tar.gz backup of the source directory
tar -czf $backup_file -C $source_dir .
# Print a message
echo "Backup of $source_dir completed and saved to $backup_file"
# Add a cron job to run this script daily at 2am if not already added
(crontab -l | grep -v -F "$0"; echo "0 2 * * * $0") | crontab -
echo "Cron job added to run this script daily at 2am"
# End of script