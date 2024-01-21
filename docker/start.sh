#!/bin/bash

# Start traefik Docker Compose with specific parameter
docker-compose -f ./traefik/docker-compose.yml up -d

# Start watchtower Docker Compose with specific parameter
docker-compose -f ./watchtower/docker-compose.yml up -d

# Start owncloud Docker Compose with specific parameter
docker-compose -f ./owncloud/docker-compose.yml --env-file "./owncloud/.env" up -d

# Start mailu Docker Compose with specific parameter
docker-compose -f ./mailu/docker-compose.yml --env-file "./mailu/mailu.env" up -d

