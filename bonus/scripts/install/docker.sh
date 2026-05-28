#!/bin/bash
set -e

RED='\033[0;31m'
NORMAL='\033[0m'

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

	sudo apt update -y
	sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
	sudo usermod -aG docker $USER

	echo ""
	echo -e "${RED}Docker installed.${NORMAL}"
	echo -e "${RED}Please log out and log back in before continuing.${NORMAL}"
	echo ""

	exit 42
fi
