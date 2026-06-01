#!/bin/bash
set -e

#ArgoCD
k3d cluster delete from-config || true

k3d cluster create --config confs/k3d/config.yaml
kubectl create \
        -n argocd \
        -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl wait --for=condition=available deployment --all -n argocd --timeout=300s

kubectl apply -f confs/argocd/

kubectl port-forward svc/argocd-server -n argocd 8080:80 > /dev/null 2>&1 &
