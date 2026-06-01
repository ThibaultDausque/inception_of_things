#!/bin/bash
set -e

#MinIO
helm repo add minio https://charts.min.io/
helm repo update

helm install minio minio/minio \
  -n gitlab \
  --set rootUser=minio \
  --set rootPassword=minio123 \
  --set buckets[0].name=gitlab-backups \
  --set buckets[1].name=gitlab-tmp \
  --set mode=standalone \
  --set resources.requests.memory=256Mi \
  --set resources.limits.memory=512Mi

kubectl apply -f confs/gitlab/minio-secret.yaml
