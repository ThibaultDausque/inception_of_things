all: install start

install: docker k3d kubectl

docker:
	@bash scripts/install/install_docker.sh

k3d:
	@bash scripts/install/install_k3d.sh

kubectl:
	@bash scripts/install/install_kubectl.sh

start:
	@bash scripts/start/start.sh

clean:
	-k3d cluster delete from-config

.PHONY: all install docker k3d kubectl start clean
