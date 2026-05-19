#!/bin/sh

set -e

kubectl create namespace dev
kubectl apply -n dev --server-side --force-conflicts -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl patch svc argocd-server -n dev -p '{"spec": {"type": "LoadBalancer"}}'
kubectl get svc argocd-server -n dev -o=jsonpath='{.status.loadBalancer.ingress[0].ip}'

kubectl apply -f ingress.yaml -n dev
kubectl port-forward svc/argocd-server -n dev 8080:443
