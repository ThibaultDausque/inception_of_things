#!/bin/bash

sudo apt-get update -y
sudo apt-get install curl -y

while [ ! -f /vagrant/token ]; do
	echo "waiting for token..."
	sleep 5
done

curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=$(cat /vagrant/token) sh -
