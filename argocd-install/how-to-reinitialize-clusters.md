## How to Reinitialize Clusters

*Assumes argocd-cli is installed*

```bash
# reinstall argo cd
./install-argo-cd.sh 

# get password
kubectl -n argocd get secret argocd-secret -o jsonpath="{.data.clearPassword}" | base64 -d; echo
# k view-secret --namespace argocd argocd-secret clearPassword; echo

argocd login localhost:8443

# add other clusters -- must be in ~/.kube/config
argocd cluster add beelink-debian

# add repo -- https is easiest for public repos
argocd repo add https://github.com/stand-sure/argocd-app-of-apps.git

# create app for local
argocd app create app-of-apps \
	--repo https://github.com/stand-sure/argocd-app-of-apps \
	--path argocd-apps \
	--dest-namespace default \
	--dest-server https://kubernetes.default.svc \
	--directory-recurse

# create app for other cluster
argocd app create app-of-apps-bs \
	--repo https://github.com/stand-sure/argocd-app-of-apps \
	--path argocd-apps \
	--dest-namespace default \
	--dest-server https://192.168.87.209:6443 \
	--directory-recurse
```

