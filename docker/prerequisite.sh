#!/bin/bash

mkdir -p owncloud/data traefik/data owncloud/mysql owncloud/redis

docker network create --driver bridge --gateway 172.16.0.1 --ip-range 172.16.0.0/24 --subnet 172.16.0.0/16 proxy

cat > /home/arlind/docker/traefik/data/traefik.yml <<EOF
api:
  dashboard: true
  debug: true
entryPoints:
  http:
    address: ":80"
    http:
      redirections:
        entryPoint:
          to: https
          scheme: https
  https:
    address: ":443"
serversTransport:
  insecureSkipVerify: true
providers:
  docker:
    endpoint: "unix:///var/run/docker.sock"
    exposedByDefault: false
  file:
    filename: /config.yml
certificatesResolvers:
  cloudflare:
    acme:
      email: yourcloudflare@email.com
      storage: acme.json
      dnsChallenge:
        provider: cloudflare
        resolvers:
          - "1.1.1.1:53"
          - "1.0.0.1:53"
EOF

touch /home/arlind/docker/traefik/data/config.yml

sudo chown -R 1000:1000 ./

chmod -R 755 ./

touch /home/arlind/docker/traefik/data/acme.json

chmod 600 /home/arlind/docker/traefik/data/acme.json
