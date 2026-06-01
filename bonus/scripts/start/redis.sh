#!/bin/bash
set -e

#Redis
helm install redis bitnami/redis \
  -n gitlab \
  --set auth.enabled=false \
  --set master.resources.requests.memory=128Mi \
  --set replica.resources.requests.memory=128Mi

kubectl create secret generic gitlab-redis-secret \
  --from-literal=secret='' \
  -n gitlab
