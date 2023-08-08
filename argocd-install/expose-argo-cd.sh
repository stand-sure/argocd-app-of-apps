#! /bin/bash
export URL=http://localhost:8080/
echo "Argo CD URL: $URL"

echo "Username: \"admin\""
echo "Password: $(kubectl -n argocd get secret argocd-secret -o jsonpath="{.data.clearPassword}" | base64 -d)"

echo ''

open "$URL"
kubectl port-forward --namespace argocd svc/argo-cd-argocd-server 8080:80
