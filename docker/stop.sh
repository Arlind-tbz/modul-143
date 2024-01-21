#!/bin/bash

# Stop mailu Docker Compose
docker-compose -f ./mailu/docker-compose.yml down

# Stop owncloud Docker Compose
docker-compose -f ./owncloud/docker-compose.yml down

# Stop traefik Docker Compose
docker-compose -f ./traefik/docker-compose.yml down

# Stop watchtower Docker Compose
docker-compose -f ./watchtower/docker-compose.yml down

