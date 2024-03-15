# argocd-helm

## Overview

Prerequisites:

1. kubernetes cluster - I like `kind`
2. `kubectl` installed
3. `helm` v3 installed

Assuming your k8s cluster is up and running the first thing to do is to install ArgoCD which we'll do with `helm`

`./charts/argo-cd/scripts/00-initital-deploy.sh` will install argo-cd to the `argocd` namespace, which `helm` will create

Then I use `k9s` to port-forward the argocd webserver to reach it at http://localhost:8080

After that we'll install the `root-app` to implement the `app-of-apps` model. Depending on the state of this repo, more apps may be provisioned at the same time. Right now I ahve `argo-cd.yaml` to bring argocd under its own management, and `openfaas.yaml` to also deploy openfaas operator to my cluster. Do this with `./charts/root-app.scripts/00-setup.sh` which uses `helm` to template out the k8s manifest for your root-app, and then pipes that to `kubectl apply`. Fromthere, as things are added to the templates directory, argocd will just apply them in its own way - probably most generally it'll be helm charts that it does exactly `helm template ... | kubectl apply -f -`

## TODOs

2. Once I figure that out I want to deploy openfaas as an argocd application, not sure if I should with a template via root-app app-of-apps model, or using terraform... I want to use tf so that I can start messing with terrakube
3. I'm not sure where terraform fits into this without unnecessary abstraction and complexity for my homelab... will try to manage a few things with it to paly with terrakube
4. I need to better document all this so that I can start migrating my homelab over to a real k8s cluster.
5. NAMESPACE CREATION - right now I'm just `kubectl create namespace ...` but there HAS to be a way to do taht with this app of apps pattern... helm hooks maybe? I don't want to do terraform for just that... feels needless


Ok so I just `helm repo add argo https://argoproj.github.io/argo-helm` and `helm install argocd argo/argo-cd` on koober
