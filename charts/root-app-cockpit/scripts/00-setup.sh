#!/bin/bash
helm template ~/personal/argocd-helm/charts/root-app/ | kubectl apply -f -
# helm template ~/personal/argocd-helm/charts/root-app/ | kubectl apply -v=8 -f -
