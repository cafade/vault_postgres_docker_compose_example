#!/usr/bin/env bash


##
# There seems to be an error when executing sudo through envcounsul, process gets stuck waiting for the user password for sudo to go through(?).
# Run a command with sudo before-hand so the sudo grace period quicks in (if there's any configured) and the envconsul command will continue as normal
# Run like: `VAULT_TOKEN=$(vault token create -policy="docker_creds" -field=token -ttl 1m) envconsul -upcase -secret docker/selfhosted/postgres ./envconsul_docker_compose.sh`
# or directly through docker-compose: VAULT_TOKEN=$(vault token create -policy="docker_creds" -field=token -ttl 1m) envconsul -upcase -secret docker/selfhosted/postgres sudo -E docker-compose -f ./docker-compose.yml up -d
##

# the sudo -E flag is required to pass environment variables to command ran as root
sudo -E docker-compose -f ./docker-compose.yml up -d

