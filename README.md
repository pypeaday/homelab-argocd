# Homelab ArgoCD

My ArgoCD app of apps repo for my homelab. This repo contains a `charts` directory with a helm chart for `root-app`. This ArgoCD app then deploys the other ArgoCD applications which themselves deploy other helm charts

## Overview

Prerequisites:

1. kubernetes cluster with ArgoCD installed (see below for instructions on initial installation)
2. `kubectl` installed
3. `helm` v3 installed

### Installing ArgoCD

If ArgoCD is installed move on to installing the root app

You can't use ArgoCD to deploy ArgoCD Applications until you have ArgoCD... so using a helm release initially is a simple pattern either with a script or using terraform like in my [terraform-homelab-k8s](https://www.github.com/pypeaday/terraform-homelab-k8s) module.

Assuming your k8s cluster is up and running the first thing to do is to install ArgoCD which we'll do with `helm`

`./scripts/00-install-argocd.sh` will install the argo-cd chart to the `argocd` namespace, which `helm` will create

### Installing the root app

Someday maybe I'll do this with terraform and have a `terraform-argocd-root-app` module or something.

For now we'll just use `scripts/01-setup.sh` which will template out the `root-app` chart and pipe to `kubetl apply`

### Seeing ArgoCD

I use `k9s` to port-forward the argocd webserver to reach it at http://localhost:8080

## Projects I'm playing with

#### Opoenfaas

Cannot manage openfaas functions via `helm` without Function CRD that only comes with Openfaas pro/standard, which costs money. Not sure how people are doing this at home if they are

### Prefect

1. deployed server
2. made worker pool in server ui and shell'd into server to start the pool `prefect worker start --pool "foo-k8s-workpool"`

I need open an issue - I can't get the worker deployed appropriately

### Terrakube
