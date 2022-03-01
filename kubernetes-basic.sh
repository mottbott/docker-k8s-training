# Topics to put somewhere
## Usage of ENV vars
## Usage of Service (NodePort, ClusterIP, LoadBalancer)
## Liveness/readyness probes
## Hint at DNS
## Explain K8s architecture and essential components (ETCD, Kube API, Kube Controller, Kube Scheduler, Kube Proxy, Kubelet, ...)
## Hint at CPU/Memory resources request/limits?
## Hint at Quotas (CPU/memory/pods)
## Explain & Usage of Ingress?
## Add on topics Jobs & CronJobs
## Deep dive on labels/label selectors. Doing blue/green or canary deployment with services & labels
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

# TODO expose/port-forward


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

# TODO bash completion
# Hint at zsh + https://github.com/ohmyzsh/ohmyzsh + kubectl plugin

# Inpsect Kubernetes resources
kubectl explain
kubectl explain deployment.spec.replicas
kubectl explain deployment.spec.selector --recursive
# Also see https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/

# Access the API natively without having to fiddle with authentication

kubectl proxy
curl http://localhost:8001/
curl http://localhost:8001/api/v1/pods

# Check out the OpenAPI spec of your cluster
curl http://localhost:8001/openapi/v2
# Can load it into any OpenAPI browser like https://editor.swagger.io/ (might be slow, does not allow mixing http/https so go via file)
curl http://localhost:8001/openapi/v2 -o k8s-api.yaml


# TODO
# Kubectl Plugin Manager KREW
# Kubernetes IDE Plugins