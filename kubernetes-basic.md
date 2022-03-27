# Basics
[⬅️ Back to Kubernetes overview](kubernetes.md)

Run simple pod
```shell
kubectl run nginx --image nginx --port 80
```
Get all pods in the current namespace
```shell
kubectl get pod
```
Get the specific pod
```shell
kubectl get pod nginx
```
See the logs of the pod and follow them
```shell
kubectl logs --follow nginx
```
📝 How to list just the last 3 lines of log messages?

See details of the pod like image, status, volumes, events etc.
```shell
kubectl describe pod nginx
```
📝 What is the name of the node the pod is running on?

See the whole resource of the pod in YAML format
```shell
kubectl get pod nginx -o yaml
```
📝 Does the pod have any label set? Which? What are labels about anyway again?

Expose the pod to be able to access it locally
```shell
kubectl port-forward pod/nginx 8888:80
```
Visit http://localhost:8888/ to view the default nginx page

Delete pod again
```shell
kubectl delete pod nginx
```

Inspect the cluster
```shell
kubectl get node
kubectl describe node docker-desktop
```

More cluster information
```shell
kubectl version
kubectl cluster-info
kubectl cluster-info dump | less
```

# CLI - `kubectl`
* How to even pronounce? kubecuddle (🥰) vs. kubecontrol vs. kubeCTL vs. ?
* Types/groups of commands
* 💡 imperative vs. declarative / create vs. apply - will revisit later
```shell
kubectl help
```
Also see https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
and https://kubernetes.io/docs/reference/kubectl/conventions/

To save some typing, an alias on the `kubectl` command is very common
```shell
alias k=kubectl
```

Even more convenience is provided with bash auto-completion
```shell
source <(kubectl completion bash)
```
💡 This can auto-complete resource types, options and even specific resource names

But this does not work out of the box with the alias. But can be fixed
```shell
complete -F __start_kubectl k
```

To make these changes permanent, they can be put into the bash startup script
```shell
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

## Exercise

📝 Deploy the voting app (`eesprit/voting-app-vote`) and redis (`redis:alpine`) as pods to Kubernetes. What ports are used? How can you access the vote app? Tip: If you use `kubectl run` you might want to use the `--expose` options. 
