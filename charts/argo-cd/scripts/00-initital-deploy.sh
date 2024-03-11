#!/bin/bash
set -e
helm repo add argo-cd https://argoproj.github.io/argo-helm
helm dep update ~/personal/argocd-helm/charts/argo-cd/

helm install argo-cd ~/personal/argocd-helm/charts/argo-cd/ --namespace argocd --create-namespace -f ~/personal/argocd-helm/charts/argo-cd/values.yaml
