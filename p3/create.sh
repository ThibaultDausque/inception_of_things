#!/bin/sh

set -e

# create the cluster
sudo k3d cluster create my-cluster --api-port 6443 -p 8080:80@loadbalancer --agents 2

# argoCD
wget https://github.com/argoproj/argo-cd/raw/v1.6.2/manifests/install.yaml
