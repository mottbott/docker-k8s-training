# Helm
[⬅️ Back to Kubernetes overview](kubernetes.md)

Add the opsmx helm repository locally. Similar to a docker registry. 
```shell
helm repo add opsmx https://helmcharts.opsmx.com/
```
💡 Helm does support reading/writing Helm charts to an OCI registry. 

Search a specific helm repo
```shell
helm search repo opsmx
```

## Install

Install a Helm chart with its latest version under the release name `my-hello-kubernetes`
```shell
helm install my-hello-kubernetes opsmx/hello-kubernetes
```

See everything related to the just installed Helm chart based on a label
```shell
kubectl get all -l "app.kubernetes.io/instance=my-hello-kubernetes"
```

## Explore installed Helm chart

Foward port of the Grafana service to a local port
```shell
kubectl port-forward service/hello-kubernetes-my-hello-kubernetes 8008:80
```
📝 Can you create a `Service` of type `NodePort` for this deployment 

Where does Helm store its data?
```shell
kubectl get secret sh.helm.release.v1.my-hello-kubernetes.v1
kubectl get secret sh.helm.release.v1.my-hello-kubernetes.v1 -o yaml
```

What if you want to configure the Helm chart? Surely the default config is not what you were looking for..

Let's set a custom message
```shell
helm upgrade my-hello-kubernetes opsmx/hello-kubernetes --set 'message=🥷 was here'
```

```shell
echo "message: I think you are going too fast ... ️🤯️" > values-message.yaml
helm upgrade my-hello-kubernetes opsmx/hello-kubernetes --values values-message.yaml
```
💡 Multiple `values.yaml` files can be provided to a Helm installation
🚧 TODO: 📝 Can you create a `values.yaml` that ...


Explore the chart on https://artifacthub.io/packages/helm/opsmx/hello-kubernetes or locally
```shell
helm pull opsmx/hello-kubernetes --version 1.0.3 --untar
```
The chart should be available in the file `hello-kubernetes-1.0.3.tgz` as well as unpacked in the directory `hello-kubernetes`


🚧 TODO: add example usages of values.yaml

## Helm charts structure

Explain anatomy of Helm CLI
```shell
helm help
```

A few tricks when working with Helm charts
List description/info for a chart
```shell
helm show chart opsmx/hello-kubernetes
```
List all (default) values for a chart.
```shell
helm show values opsmx/hello-kubernetes
```

Explain anatomy of a Helm chart
Create helm Chart of our own
```shell
helm create learn-chart
```

Add Stuff
```shell
helm lint learn-chart
```

🚧 TODO: Create Helm chart for voting app example and exercise

Explain helm dependencies
Review the previously used helm chart of kube-prometheus-stack

Hint at https://artifacthub.io/ 
This is where a lot of charts and also documentation can be found
There are a lot of different charts, obviously. 

💡 For good charts apart from official ones (if available) are the Bitnami ones: https://artifacthub.io/packages/search?kind=0&org=bitnami

## Uninstall

```shell
helm uninstall local-kube-prometheus-stack
```

💡 Alternative to Helm: [kustomize](https://kustomize.io/) 
