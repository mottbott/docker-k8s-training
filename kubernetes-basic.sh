# Topics to put somewhere
## Usage of ConfigMap
## Usage of Secret (Extended: Ways to manage secrets the real way or why secrets are usually not very secret)
## Usage of ENV vars
## Usage of Service (NodePort, ClusterIP, LoadBalancer)
## Hint at DNS
## Explain K8s architecture and essential components (ETCD, Kube API, Kube Controller, Kube Scheduler, Kube Proxy, Kubelet, ...)
## Hint at CPU/Memory resources request/limits?
## Hint at Quotas (CPU/memory/pods)
## Hint at RBAC
## Explain & Usage of Ingress?
## What the heck is YAML? Can't I just use JSON? (yes you can)

# Run pod simple
kubectl run pod nginx --image nginx
kubectl get pod
kubectl get pod nginx
kubectl describe pod nginx
kubectl get pod nginx -o yaml

# Resources 
## Structure, API / Kind
## Most frequently used resources: Deployment, Service, ConfigMap, Secret

# Run a deployment with replicas > 1
# Delete running Pod, what happens?

# kubectl CLI in detail
## How to even pronounce?
## Types/groups of commands
## Short names
kubectl api-resources
## imperative vs. declarative / create vs. apply
kubectl help
# Also see https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
# and https://kubernetes.io/docs/reference/kubectl/conventions/

kubectl run nginx-run --image=nginx
kubectl run nginx --image=nginx --dry-run=client -o yaml
kubectl create deployment --image=nginx nginx
kubectl update ...
kubectl edit deployment nginx

kubectl apply

## Should not nix imperative/declarative commands (due to last-applied config)

# Scale deployment
# Change deployment to see rolling update

# Alternative deployment methods StatefulSet, DaemonSet, (ReplicaSet)

# Create StatefulSet 

# What are these volumes we just used/created?
# Explain PVs / PVCs

# Explain namespaces, what is their use?
# Different environments namespace vs. clusters

# Create namespace
# Create pod with same name in new namespace
## Hint at tools to manage context?
## Hint at ~/.kube
kubectl create namespace
kubectl config set-context $(kubectl config current-context) --namespace=dev
kubectl get pods
kubectl get pods --namespace=default 
kubectl get pods --all-namespaces 
# List "everything" in the cluster, if permissions allow it
kubectl get all --all-namespaces 

# Helm
helm install X

# Inspect/see customized installation notes
# Inspect the installed resources
# List all related resources
# Hint at CRDs (e.g. Helm release) - The way to extend K8s

helm upgrade

# Explain anatomy of a Helm chart
# Explain helm dependencies

helm uninstall

# Alternative to helm: kustomize 
