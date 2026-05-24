#!/bin/sh

set -e

k3d cluster create p3-dev --config ../k3d/conf.yaml

kubectl apply -n dev --server-side --force-conflicts -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl apply -f application.yaml -n dev
