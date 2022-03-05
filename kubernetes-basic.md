# Basics
Run simple pod
```
kubectl run nginx --image nginx --port 80
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
Expose the pod to be able to access it locally
```
k port-forward pod/nginx 8888:80
```
Visit http://localhost:8888/ to view the default nginx page

Delete pod again
```
kubectl delete pod nginx
```

Inspect the cluster
```
kubectl get node
kubectl describe node docker-desktop
```

# CLI - `kubectl`
* How to even pronounce? kubecuddle (🥰) vs. kubecontrol vs. kubeCTL vs. ?
* Types/groups of commands
* 💡 Use short names to save time typing
* 💡 imperative vs. declarative / create vs. apply - will revisit later
```
kubectl help
```
Also see https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
and https://kubernetes.io/docs/reference/kubectl/conventions/

To save some typing, an alias on the `kubectl` command is very common
```
alias k=kubectl
```

Even more convenience is provided with bash auto-completion
```
source <(kubectl completion bash)
```
💡 This can auto-complete resource types, options and even specific resource names

But this does not work out of the box with the alias. But can be fixed
```
complete -F __start_kubectl k
```

To make these changes permanent, they can be put into the bash startup script
```
echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc
```
* 💡 zsh + https://github.com/ohmyzsh/ohmyzsh + kubectl plugin https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kubectl is quite convenient and powerful 
* 💡 IDEs provide integrations (listing resources, auto-completion, debugging) for Kubernetes which can be very helpful. 
  * https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vs-tools-for-kubernetes
  * https://marketplace.visualstudio.com/items?itemName=mindaro.mindaro
  * https://plugins.jetbrains.com/plugin/10485-kubernetes 
  * https://code.visualstudio.com/docs/azure/kubernetes

# Resources
Structure, API / Kind
Most frequently used resources: Deployment, Service, ConfigMap, Secret
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


