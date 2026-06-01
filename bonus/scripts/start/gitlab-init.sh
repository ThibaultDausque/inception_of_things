#!/bin/bash
set -e

#Namespace
kubectl create namespace gitlab || true

#bitnami
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
