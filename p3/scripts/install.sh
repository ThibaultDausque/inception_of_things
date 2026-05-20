#!/bin/bash
set -e

#Install Docker
if command -v docker &> /dev/null; then
	echo "Docker is already installed"
else
	echo "Installing Docker"
	sudo apt update -y
	sudo apt install ca-certificates curl -y
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc

	sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

	sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
	sudo usermod -aG docker $USER
fi

#Install k3d
if command -v k3d &> /dev/null; then
	echo "k3d is already installed"
else
	echo "Installing k3d"
	curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
fi

#Install kubectl
if command -v kubectl &> /dev/null; then
	echo "Kubectl is already installed"
else
	echo "Installing kubectl"
	VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
	
	curl -LO "https://dl.k8s.io/release/VERSION/bin/linux/amd64/kubectl"
	
	chmod +x kubectl
	sudo mv kubectl /usr/local/bin/
fi
