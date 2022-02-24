# Topics to put somewhere
## Usage of ENV vars
## Usage of Service (NodePort, ClusterIP, LoadBalancer)
## Liveness/readyness probes
## Hint at DNS
## Explain K8s architecture and essential components (ETCD, Kube API, Kube Controller, Kube Scheduler, Kube Proxy, Kubelet, ...)
## Hint at CPU/Memory resources request/limits?
## Hint at Quotas (CPU/memory/pods)
## Explain & Usage of Ingress?
## What the heck is YAML? Can't I just use JSON? (yes you can)

# Run pod simple
kubectl run nginx --image nginx
# Get all pods in the current namespace
kubectl get pod
# Get the specific pod
kubectl get pod nginx
# See the logs of the pod and follow them
kubectl logs --follow nginx
# See details of the pod like image, status, volumes, events etc.
kubectl describe pod nginx
# See the whole resource of the pod in YAML format
kubectl get pod nginx -o yaml
# Delete pod again
kubectl delete pod nginx

# Resources 
## Structure, API / Kind
## Most frequently used resources: Deployment, Service, ConfigMap, Secret

# kubectl CLI in detail
## How to even pronounce?
## Types/groups of commands
## Short names
kubectl api-resources
## imperative vs. declarative / create vs. apply
kubectl help
# Also see https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
# and https://kubernetes.io/docs/reference/kubectl/conventions/

alias k=kubectl

# Inpsect Kubernetes resources
kubectl explain
kubectl explain explain deployment.spec.replicas
# Also see https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/
# Accessing the Kubernetes API directly https://nieldw.medium.com/curling-the-kubernetes-api-server-d7675cfc398c


