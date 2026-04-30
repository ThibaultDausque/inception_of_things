#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y curl openssh-server

while ! nc -z 192.168.56.110 8080; do
  echo "waiting for master..."
  sleep 5
done

TOKEN=$(curl -s http://192.168.56.110:8080/token)

curl -sfL https://get.k3s.io | \
  K3S_URL=https://192.168.56.110:6443 \
  K3S_TOKEN=$TOKEN sh -
