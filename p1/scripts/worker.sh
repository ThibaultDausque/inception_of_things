#!/bin/bash

sudo apt-get update
sudo apt-get install -y iptables

while [ ! -f /vagrant/.token ]; do
	echo "waiting for master"
	sleep 25
done

MASTER_IP=$1

TOKEN=$(cat /vagrant/.token)

curl -sfL https://get.k3s.io | \
		 K3S_URL=https://$MASTER_IP:6443 \
		 K3S_TOKEN=$TOKEN \
		 sh -s - --node-ip=192.168.56.111
