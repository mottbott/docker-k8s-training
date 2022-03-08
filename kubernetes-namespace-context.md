# Namespace
[⬅️ Back to Kubernetes overview](kubernetes.md)

Explain namespaces, what is their use?
Different environments: namespace vs. clusters

Create namespace
```shell
kubectl get namespace
kubectl create namespace test-env
```
📝 How many namespaces do you currently have on your system?

Create pod with same name in new namespace
```shell
kubectl run nginx --image nginx --port 80
kubectl run nginx --image nginx --port 80 --namespace test-env
```

Listing resources for specific namespaces
```shell
kubectl get pods
kubectl get pods --namespace=test-env
kubectl get pods --all-namespaces
```

Change config to use the newly created namespace by default
```shell
kubectl config set-context $(kubectl config current-context) --namespace=test-env
```

Where is this configuration saved?
```shell
kubectl config view
kubectl help config
ls -l ~/.kube/
cat ~/.kube/config
```

To extend and improve the functionality of `kubectl`. Let's install the plugin manager Krew. Accorind to https://krew.sigs.k8s.io/docs/user-guide/setup/install/
```shell
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

```
💡 More information about kubectl plugins https://kubernetes.io/docs/tasks/extend-kubectl/kubectl-plugins/


Test the installation
```shell
kubectl krew list
```
📝 How many krew plugins do currently exist?

To add the Krew installation directory to your path permanently do the following:
```shell
echo 'export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"' >> .bashrc
```

Let's install some useful plugins
```shell
kubectl krew install ns
kubectl krew install ctx
```

Let's explore the plugins 
```shell
kubectl ns
kubectl ns test-env
kubectl ns --help

kubectl ctx
kubectl ctx docker-desktop
kubectl ctx --help
```
* 💡 More information about the plugins can be found here https://github.com/ahmetb/kubectx
* 💡 Note that the plugins help can only be accessed via the `--help` flag and not via `kubectl help <plugin>`
* 📝 How many contexts do you currently have on your system?
* 📝 Copy the current kubectl config from WSL (`~/.kube/config`) to your Windows home directory (`%HOME%/.kube/config`)




