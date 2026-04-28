#!/bin/bash

curl -sfL https://get.k3s.io | sh -

sudo mkdir -p ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown -R vagrant:vagrant ~/.kube/config

sudo cat /var/lib/rancher/k3s/server/node-token > /vagrant/token
