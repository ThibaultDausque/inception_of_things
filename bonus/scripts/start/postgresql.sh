#!/bin/bash
set -e

#PostgreSQL
helm install postgres bitnami/postgresql \
  -n gitlab \
  --set auth.postgresPassword='postgresql' \
  --set auth.username='gitlab' \
  --set auth.password='gitlabpass' \
  --set auth.database='gitlabhq_production' \
  --set primary.resources.requests.memory=256Mi
