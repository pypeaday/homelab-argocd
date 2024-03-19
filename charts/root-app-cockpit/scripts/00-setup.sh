#!/bin/bash
helm template ~/personal/argocd-helm/charts/root-app-cockpit/ | kubectl apply -f -
# helm template ~/personal/argocd-helm/charts/root-app-cockpit/ | kubectl apply -v=8 -f -
