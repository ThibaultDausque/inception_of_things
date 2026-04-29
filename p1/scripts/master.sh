#!/bin/bash

sudo apt-get update -y
sudo apt-get install curl -y

curl -sfL https://get.k3s.io | sh -

sudo mkdir -p /home/vagrant/.kube
sudo cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
sudo sed -i 's/127.0.0.1/192.168.56.110/' /home/vagrant/.kube/config
sudo chown -R vagrant:vagrant /home/vagrant/.kube/config

mkdir -p /home/vagrant
sudo cat /var/lib/rancher/k3s/server/node-token > /vagrant/token
