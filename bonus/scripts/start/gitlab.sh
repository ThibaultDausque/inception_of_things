#!/bin/bash
set -e

#Gitlab
helm repo add gitlab https://charts.gitlab.io/
helm repo update

helm upgrade --install gitlab gitlab/gitlab \
  -n gitlab \
  -f confs/gitlab/values.yaml \
  --timeout 1200s
