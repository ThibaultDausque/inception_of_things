set -e

SERV_IP=$1

sudo apt-get install -y
sudo apt-get update -y

curl -sfL https://get.k3s.io | K3S_URL=https://$SERV_IP:6443 sh -s - server \
	--write-kubeconfig-mode 0644 \
	--node-ip 192.168.56.110

echo "192.168.56.110 app1" >> /etc/hosts
echo "192.168.56.110 app2" >> /etc/hosts
echo "192.168.56.110 app3" >> /etc/hosts

mkdir -p ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown $(id -u):$(id -g) ~/.kube/config

kubectl apply -f /vagrant/tools/deployment.yaml
