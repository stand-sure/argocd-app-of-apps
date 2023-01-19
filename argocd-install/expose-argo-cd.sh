#! /bin/bash
kubectl port-forward --namespace argocd svc/argo-cd-argocd-server 8080:80 &
export URL=http://127.0.0.1:8080/
echo "Argo CD URL: http://127.0.0.1:8080/"

echo "Username: \"admin\""
echo "Password: $(kubectl -n argocd get secret argocd-secret -o jsonpath="{.data.clearPassword}" | base64 -d)"
echo ""
