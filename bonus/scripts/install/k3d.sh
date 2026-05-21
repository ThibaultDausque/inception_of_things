#!/bin/bash
set -e

if command -v k3d &> /dev/null; then
	echo "k3d is already installed"
else
	echo "Installing k3d"
	curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
fi
