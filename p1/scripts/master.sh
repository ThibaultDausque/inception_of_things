#!/bin/bash

sudo apt-get update
sudo apt-get install -y iptables

curl -sfL https://get.k3s.io | sh -s - server --node-ip=192.168.56.110

sudo mkdir -p /home/vagrant/.kube
sudo cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
sudo chown vagrant:vagrant /home/vagrant/.kube/config
echo 'export KUBECONFIG=/home/vagrant/.kube/config' >> /home/vagrant/.bashrc

TOKEN=$(sudo cat /var/lib/rancher/k3s/server/node-token)

echo $TOKEN > /vagrant/.token
