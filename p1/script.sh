!#/bin/bash

set -e

IP=$1

apt-get update
apt-get install -y ca-certificates curl gnupg git systemd net-tools

sudo curl -sfL https://get.k3s.io | K3S_URL=https://$(IP):6443 K3S_KUBECONFIG_MODE=644  sh - --bind-address=192.168.56.110

sudo mkdir -p /home/vagrant/.kube
sudo cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
sudo chown -R vagrant:vagrant /home/vagrant/.kube/config
# token ?
