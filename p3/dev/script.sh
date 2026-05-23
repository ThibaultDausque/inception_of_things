#!/bin/sh

set -e

kubectl create ns dev
kubectl apply -n dev --server-side --force-conflicts -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
