
# Explain namespaces, what is their use?
# Different environments namespace vs. clusters

# Create namespace
# Create pod with same name in new namespace
## Hint at tools to manage context?
kubectl config view
kubectl help config
# krew ctx etc

## Hint at ~/.kube
kubectl create namespace test-env

# Change config to use the newly created namespace by default
kubectl config set-context $(kubectl config current-context) --namespace=test-env


kubectl get pods
kubectl get pods --namespace=test-env
kubectl get pods --all-namespaces

