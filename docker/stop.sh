#!/bin/bash

# Function to check if a file exists
file_exists() {
  if [ -f "$1" ]; then
    return 0  # File exists
  else
    return 1  # File does not exist
  fi
}

# Paths to Docker Compose files
mailu_compose="/home/arlind/docker/mailu/docker-compose.yml"
owncloud_compose="/home/arlind/docker/owncloud/docker-compose.yml"
traefik_compose="/home/arlind/docker/traefik/docker-compose.yml"
watchtower_compose="/home/arlind/docker/watchtower/docker-compose.yml"

# Check if each file exists and stop the corresponding Docker Compose if it does
if file_exists "$mailu_compose"; then
  sudo docker-compose -f "$mailu_compose" down
fi

if file_exists "$owncloud_compose"; then
  sudo docker-compose -f "$owncloud_compose" down
fi

if file_exists "$traefik_compose"; then
  sudo docker-compose -f "$traefik_compose" down
fi

if file_exists "$watchtower_compose"; then
  sudo docker-compose -f "$watchtower_compose" down
fi

