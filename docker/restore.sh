#!/bin/bash

timestamp=$(date +%Y_%m_%d-%H_%M_%S)
log_dir="/var/log/tbz"
log_file1="$log_dir/${timestamp}_restore-hdd.log"
log_file2="$log_dir/${timestamp}_restore-tape.log"
log_file_remote="$log_dir/${timestamp}_restore-remote.log"

remote_user="arlind"
remote_host="localhost"
remote_backup_dir="/home/arlind/backup-remote/*"

bash /home/arlind/docker/stop.sh

echo "Choose a script to execute:"
echo "1. Execute restore from HDD"
echo "2. Execute restore from tape"
echo "3. Execute restore from remote"
read choice

# Function to log messages to the appropriate log file
log_message() {
  local log_file="$1"
  local message="$2"
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> "$log_file"
}

case "$choice" in
  1)
    log_message "$log_file1" "Restoring from HDD"
    rm -rf /home/arlind/docker/mailu
    rm -rf /home/arlind/docker/watchtower
    rm -rf /home/arlind/docker/owncloud
    rm -rf /home/arlind/docker/traefik
    cp -r /home/arlind/backup-hdd/* /home/arlind/docker/
    ;;
  2)
    log_message "$log_file2" "Restoring from tape"
    rm -rf /home/arlind/docker/mailu
    rm -rf /home/arlind/docker/watchtower
    rm -rf /home/arlind/docker/owncloud
    rm -rf /home/arlind/docker/traefik
    cp -r /home/arlind/backup-tape/* /home/arlind/docker/
    ;;
  3)
    log_message "$log_file_remote" "Restoring from remote"
    rm -rf /home/arlind/docker/mailu
    rm -rf /home/arlind/docker/watchtower
    rm -rf /home/arlind/docker/owncloud
    rm -rf /home/arlind/docker/traefik
    scp -r -i /home/arlind/.ssh/ssh-key "$remote_user@$remote_host:$remote_backup_dir" /home/arlind/docker/ >> "$log_file_remote" 2>&1
    ;;
  *)
    log_message "$log_file1" "Invalid choice. Please enter 1, 2, or 3."
    ;;
esac

bash /home/arlind/docker/start.sh

