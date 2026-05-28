all: install start

install: docker k3d kubectl helm

docker:
	@bash scripts/install/docker.sh

k3d:
	@bash scripts/install/k3d.sh

kubectl:
	@bash scripts/install/kubectl.sh

helm:
	@bash scripts/install/helm.sh

start:
	@bash scripts/start/start.sh

clean:
	-k3d cluster delete from-config

.PHONY: all install docker k3d kubectl helm start clean
