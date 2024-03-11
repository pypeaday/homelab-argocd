#!/bin/bash
set -e
helm upgrade argo-cd ~/personal/argocd-helm/charts/argo-cd --namespace argocd -f ~/personal/argocd-helm/charts/argo-cd/values.yaml
