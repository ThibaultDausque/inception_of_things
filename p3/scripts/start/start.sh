#!/bin/bash
set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NORMAL='\033[0m'

k3d cluster delete from-config || true

k3d cluster create --config confs/k3d/config.yaml
kubectl create \
	-n argocd \
	-f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl wait --for=condition=available deployment --all -n argocd --timeout=300s

kubectl get pods -n argocd

kubectl apply -f confs/argocd/

kubectl port-forward svc/argocd-server -n argocd 8080:80 > /dev/null 2>&1 &

echo -e "${GREEN}ArgoCD Username:${NORMAL} admin"
echo -en "${GREEN}ArgoCD password:${NORMAL}"
kubectl get secret argocd-initial-admin-secret \
  -n argocd \
  -o jsonpath="{.data.password}" | base64 -d
echo ""
echo -e "${BLUE}Link:${NORMAL} https://localhost:8080/"
