# Topics to put somewhere
## Usage of ConfigMap
## Usage of Secret (Extended: Ways to manage secrets the real way or why secrets are usually not very secret)
## Usage of ENV vars
## Usage of Service
## Explain & Usage of Ingress?


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
## imperative vs. declarative / create vs. apply
## 

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
