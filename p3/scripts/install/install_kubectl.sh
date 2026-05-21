#!/bin/bash
set -e

if command -v kubectl &> /dev/null; then
	echo "Kubectl is already installed"
else
	echo "Installing kubectl"
	VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)

	curl -LO "https://dl.k8s.io/release/$VERSION/bin/linux/amd64/kubectl"
	curl -LO "https://dl.k8s.io/release/$VERSION/bin/linux/amd64/kubectl.sha256"

	echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
	rm -f kubectl.sha256

	chmod +x kubectl
	sudo mv kubectl /usr/local/bin/
fi
