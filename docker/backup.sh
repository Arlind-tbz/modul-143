#!/bin/bash

# Set the timestamp for the log filenames
timestamp=$(date +%Y_%m_%d-%H_%M_%S)
log_dir="/var/log/tbz"
log_file1="$log_dir/${timestamp}_backup-hdd.log"
log_file2="$log_dir/${timestamp}_backup-tape.log"
log_file_remote="$log_dir/${timestamp}_backup-remote.log"

# Ensure the log directory exists
mkdir -p "$log_dir"

# Redirect standard output and standard error to log files
exec > >(tee -a "$log_file1") 2>&1

# Set your source directory
source_dir="/home/arlind/docker/"

# Set your local backup destinations (2 different types of media)
local_backup_dir1="/home/arlind/backup-hdd"  # e.g., HDD
local_backup_dir2="/home/arlind/backup-tape"  # e.g., Tape

# Perform the first local backup using rsync and log the output
rsync -avh --delete "$source_dir" "$local_backup_dir1"

# Redirect standard output and standard error to the second log file
exec > >(tee -a "$log_file2") 2>&1

# Perform the second local backup using rsync and log the output
rsync -avh --delete "$source_dir" "$local_backup_dir2"

# Set your remote backup destination (offsite)
remote_user="arlind"
remote_host="localhost"
remote_backup_dir="/home/arlind/backup-remote"

# Redirect standard output and standard error to the remote log file
exec > >(tee -a "$log_file_remote") 2>&1

# Perform the remote backup using rsync over SSH (adjust SSH key authentication as needed) and log the output
rsync -avh --delete -e "ssh -i /home/arlind/.ssh/ssh-key" "$source_dir" "$remote_user@$remote_host:$remote_backup_dir"
