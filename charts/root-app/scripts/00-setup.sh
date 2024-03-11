#!/bin/bash
pushd ~/personal/argocd-helm/charts/root-app
helm template ~/personal/argocd-helm/charts/root-app/ | kubectl apply -f -
popd
