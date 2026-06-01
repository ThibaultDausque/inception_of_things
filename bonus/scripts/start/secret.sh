#!/bin/bash
set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NORMAL='\033[0m'

echo -e "${GREEN}ArgoCD Username:${NORMAL} admin"
echo -en "${GREEN}ArgoCD password:${NORMAL}"
kubectl get secret argocd-initial-admin-secret \
  -n argocd \
  -o jsonpath="{.data.password}" | base64 -d
echo ""
echo -e "${BLUE}Link:${NORMAL} https://localhost:8080/"

echo ""

echo -e "${GREEN}Gitlab Username:${NORMAL} root"
echo -en "${GREEN}GitLab password:${NORMAL}"
kubectl get secret -n gitlab gitlab-gitlab-initial-root-password \
  -ojsonpath='{.data.password}' |  base64 --decode ; echo
echo -e "${BLUE}Link:${NORMAL} http://gitlab.local:8082/"
