#! /bin/bash
helm upgrade --install argo-cd bitnami/argo-cd --namespace argocd --create-namespace --values values-override.yaml