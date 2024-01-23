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
traefik_compose="/home/arlind/docker/traefik/docker-compose.yml"
watchtower_compose="/home/arlind/docker/watchtower/docker-compose.yml"
owncloud_compose="/home/arlind/docker/owncloud/docker-compose.yml"
mailu_compose="/home/arlind/docker/mailu/docker-compose.yml"

# Check if each file exists and start the corresponding Docker Compose with specific parameters if it does
if file_exists "$traefik_compose"; then
  docker-compose -f "$traefik_compose" up -d
fi

if file_exists "$watchtower_compose"; then
  docker-compose -f "$watchtower_compose" up -d
fi

if file_exists "$owncloud_compose"; then
  docker-compose -f "$owncloud_compose" --env-file "/home/arlind/docker/owncloud/.env" up -d
fi

if file_exists "$mailu_compose"; then
  docker-compose -f "$mailu_compose" --env-file "/home/arlind/docker/mailu/mailu.env" up -d
fi

