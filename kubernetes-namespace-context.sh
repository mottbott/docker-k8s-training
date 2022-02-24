
# Explain namespaces, what is their use?
# Different environments namespace vs. clusters

# Create namespace
# Create pod with same name in new namespace
## Hint at tools to manage context?
## Hint at ~/.kube
kubectl create namespace test-env
kubectl config set-context $(kubectl config current-context) --namespace=test-env
kubectl get pods
kubectl get pods --namespace=test-env
kubectl get pods --all-namespaces

