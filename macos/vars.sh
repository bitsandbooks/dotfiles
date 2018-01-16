#!/usr/bin/env sh

# Set $ANSIBLE_CONFIG
export ANSIBLE_CONFIG="/srv/ansible/ansible.cfg"

# boot2docker
export DOCKER_CERT_PATH="/Users/rob/.boot2docker/certs/boot2docker-vm"
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST="tcp://127.0.0.1:2376"
