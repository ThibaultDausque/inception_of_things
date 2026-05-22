#!/bin/bash
set -e

#ArgoCD
k3d cluster delete from-config || true

if ! command -v kubectl &> /dev/null
then
  echo "kubectl is not installed"
  exit 1
fi

k3d cluster create --config confs/k3d/config.yaml
kubectl create \
	-n argocd \
	-f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl wait --for=condition=available deployment --all -n argocd --timeout=300s

kubectl get pods -n argocd

kubectl apply -f confs/argocd/

kubectl port-forward svc/argocd-server -n argocd 8080:80 > /dev/null 2>&1 &

kubectl get secret argocd-initial-admin-secret \
  -n argocd \
  -o jsonpath="{.data.password}" | base64 -d

#Namespace
kubectl create namespace gitlab || true

#bitnami
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

#Redis
helm install redis bitnami/redis \
  -n gitlab \
  --set auth.enabled=false

#PostgreSQL
helm install postgres bitnami/postgresql \
  -n gitlab \
  --set auth.postgresPassword='postgresql'

#Gitlab
helm repo add gitlab https://charts.gitlab.io/
helm repo update

helm upgrade --install gitlab gitlab/gitlab \
  -n gitlab \
  -f confs/gitlab/values.yaml \
  --timeout 1200s

kubectl get secret -n gitlab gitlab-gitlab-initial-root-password \
  -ojsonpath='{.data.password}' |  base64 --decode ; echo
