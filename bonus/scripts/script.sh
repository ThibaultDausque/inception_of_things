#!/bin/sh

set -e

k3d cluster create p3 --config ../k3d/conf.yaml

helm repo add gitlab https://charts.gitlab.io/
helm repo update
helm upgrade --install gitlab gitlab/gitlab \
  --timeout 600s \
  --set global.hosts.domain=bonus.com \
  --set global.hosts.externalIP=127.0.0.1 \
  --set certmanager-issuer.email=tdausque@example.com
