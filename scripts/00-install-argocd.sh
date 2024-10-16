#!/bin/bash
set -e

helm repo add argo-cd https://argoproj.github.io/argo-helm

helm install argocd argo/argo-cd --namespace argocd --create-namespace
