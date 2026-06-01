all: install start

install: docker k3d kubectl helm
start: argocd gitlab-init redis postgresql minio gitlab secret

docker:
	@bash scripts/install/docker.sh
k3d:
	@bash scripts/install/k3d.sh
kubectl:
	@bash scripts/install/kubectl.sh
helm:
	@bash scripts/install/helm.sh

argocd:
	@bash scripts/start/argocd.sh
gitlab-init:
	@bash scripts/start/gitlab-init.sh
redis:
	@bash scripts/start/redis.sh
postgresql:
	@bash scripts/start/postgresql.sh
minio:
	@bash scripts/start/minio.sh
gitlab:
	@bash scripts/start/gitlab.sh
secret:
	@bash scripts/start/secret.sh

clean:
	-k3d cluster delete from-config

.PHONY: all install docker k3d kubectl helm start clean
