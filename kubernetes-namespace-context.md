# Namespace

Explain namespaces, what is their use?
Different environments: namespace vs. clusters

Create namespace
```
kubectl create namespace test-env
```

Create pod with same name in new namespace

🚧 TODO create stuff in this namespace

Hint at tools to manage context?
Hint at ~/.kube
```
kubectl config view
kubectl help config
```

🚧 TODO Kubectl Plugin Manager KREW

Listing resources for specific namespaces
```
kubectl get pods
kubectl get pods --namespace=test-env
kubectl get pods --all-namespaces
```


Change config to use the newly created namespace by default
```
kubectl config set-context $(kubectl config current-context) --namespace=test-env
```

