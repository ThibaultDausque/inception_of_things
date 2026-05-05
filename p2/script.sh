set -e

sudo apt-get install -y
sudo apt-get update -y

curl -sfL https://get.k3s.io | sh - \
	--node-ip 192.168.110.56


