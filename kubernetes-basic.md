# Basics
Run simple pod
```
kubectl run nginx --image nginx
```
Get all pods in the current namespace
```
kubectl get pod
```
Get the specific pod
```
kubectl get pod nginx
```
See the logs of the pod and follow them
```
kubectl logs --follow nginx
```
See details of the pod like image, status, volumes, events etc.
```
kubectl describe pod nginx
```
See the whole resource of the pod in YAML format
```
kubectl get pod nginx -o yaml
```
Delete pod again
```
kubectl delete pod nginx
```

🚧TODO expose/port-forward


# CLI - `kubectl`
* How to even pronounce? kubecuddle (🥰) vs. kubecontrol vs. kubeCTL vs. ?
* Types/groups of commands

💡 Use short names to save time typing
💡 imperative vs. declarative / create vs. apply - will revisit later
```
kubectl help
```
Also see https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
and https://kubernetes.io/docs/reference/kubectl/conventions/

```
alias k=kubectl
```

🚧TODO bash completion

🚧TODO Kubernetes IDE Plugins

💡 zsh + https://github.com/ohmyzsh/ohmyzsh + kubectl plugin is quite powerful

# Resources
* Structure, API / Kind
* Most frequently used resources: Deployment, Service, ConfigMap, Secret
```
kubectl api-resources
```

Inspect Kubernetes resources
```
kubectl explain
kubectl explain deployment.spec.replicas
kubectl explain deployment.spec.selector --recursive
```
Also see https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/

Access the API natively without having to fiddle with authentication
```
kubectl proxy
curl http://localhost:8001/
curl http://localhost:8001/api/v1/pods
```

Check out the OpenAPI spec of your cluster
```
curl http://localhost:8001/openapi/v2
```
Can load it into any OpenAPI browser like https://editor.swagger.io/ (might be slow, does not allow mixing http/https so go via file)
```
curl http://localhost:8001/openapi/v2 -o k8s-api.yaml
```


