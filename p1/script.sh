!#/bin/bash

set -e

apt-get update
apt-get install -y ca-certificates curl gnupg git

curl -sfL https://get.k3s.io | sh -
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
# install kubernets
