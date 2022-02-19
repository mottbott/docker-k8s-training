# Topics to put somewhere
## Usage of ConfigMap
## Usage of Secret (Extended: Ways to manage secrets the real way or why secrets are usually not very secret)
## Usage of ENV vars
## Usage of Service (NodePort, ClusterIP, LoadBalancer)
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

# Create a deployment with nginx
kubectl create deployment --image=nginx nginx
# So what is the difference? There is still a pod, but with a weird name
kubectl get pod
kubectl describe pod -l "app=nginx"
# Pod is "Controlled By" a ReplicaSet
kubectl get replicaset
kubectl describe replicaset -l "app=nginx"
# ReplicaSet is "Controlled By" the Deployment we've just created
kubectl get deployment
kubectl describe deployment nginx

# Lets scale the deployment to more instances and watch what happens
k get pods --watch --output wide
k scale deployment nginx --replicas=2
# See the new pods? What happens if we delete an existing pod?
k delete pod -l "app=nginx"

# kubectl CLI in detail
## How to even pronounce?
## Types/groups of commands
## Short names
kubectl api-resources
## imperative vs. declarative / create vs. apply
kubectl help
# Also see https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
# and https://kubernetes.io/docs/reference/kubectl/conventions/

kubectl run nginx --image=nginx --dry-run=client -o yaml
# Edit resources and apply the changes immediately
kubectl edit deployment nginx
# Get definition of the resources and save them to a local file
kubectl get deployment nginx -o yaml > deployment-nginx.yaml
vi deployment-nginx.yaml
# Apply the changed configuration
kubectl apply -f deployment-nginx.yaml
# See WARNING. Should not mix imperative/declarative commands (due to last-applied config)

# Want to remove somethings you added without any hassle? Just run
kubectl delete -f deployment-nginx.yaml
# But be aware, this might not delete resources created by your resources
# Also be aware, this is dependant on the type and name of the resources (kind, apiVersion, metadata.name)

# Explain alternative deployment methods StatefulSet, DaemonSet, (ReplicaSet)

# Create StatefulSet based on the example
k apply -f kubernetes/statefulset/resources.yaml
# Inpsect the resources that have been created. What about their name?
k get pods
k get service
k get pvc
k get pv

k port-forward service/nginx-sts 8180:80

# What are these volumes we just used/created?
# Explain PVs / PVCs. What are storage classes?

# Lets copy different content to the volumes to see the effect
k cp kubernetes/statefulset/index-light.html web-0:/usr/share/nginx/html/index.html
k cp kubernetes/statefulset/index-dark.html web-1:/usr/share/nginx/html/index.html

# Foward the specific pods to local ports to verify the result
k port-forward pod/web-0 8080:80
k port-forward pod/web-1 8181:80

# As this is persistent storage, this change is permanent in case of a pod restart
k delete pod web-0

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

# Helm
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

# Search a specific helm repo
helm search repo prometheus-community

# HACK install nginx ingress first
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace

# Inspect/see customized installation notes

# Install a Helm chart with its latest version under the release name local-kube-prometheus-stack
helm upgrade --install local-kube-prometheus-stack prometheus-community/kube-prometheus-stack \
  --set prometheus-node-exporter.hostRootFsMount=false

# See all pods related to the just installed Helm chart
kubectl --namespace default get pods -l "release=local-kube-prometheus-stack"

# Foward port of the Grafana service to a local port
kubectl port-forward service/local-kube-prometheus-stack-grafana 8888:80

# What?! It needs credentials.. but I dont have any..
# List all Secret in the current namespace
kubectl get secrets

# Get the content of the Grafana secret
kubectl get secret local-kube-prometheus-stack-grafana -o yaml

# What is this gibberish content? That does not work!?
# Directly extract content from the secrets and decode them (base64)
kubectl get secret local-kube-prometheus-stack-grafana -o go-template='{{index .data "admin-password"}}' | base64 -d
kubectl get secret local-kube-prometheus-stack-grafana -o go-template='{{index .data "admin-user"}}' | base64 -d

# Access Grafana with the credentials
# E.g. 
# Node (Pod) Dashboard: http://localhost:8888/d/200ac8fdbfbb74b39aff88118e4d1c2c/kubernetes-compute-resources-node-pods?orgId=1&refresh=10s
# Alertmanager Dashboard: http://localhost:8888/d/alertmanager-overview/alertmanager-overview?orgId=1&refresh=30s

# Check out Alertmanager
kubectl port-forward service/local-kube-prometheus-stac-alertmanager 8889:9093
# Visit http://localhost:8889/#/alerts

# Inspect the installed resources
kubectl get all
# See examples of Deployment, DaemonSets and StatefulSets. What are their purpose again?
# But wait. Is this really all? Shouldn't there be some Secrets and ConfigMaps?
kubectl get configmap
kubectl get secret

# List really all resources in current namespace
kubectl get $(kubectl api-resources| awk '{ print $1 }'|grep -v "NAME"|xargs|sed -e 's/ /,/g')

# Alternatively there is a plugin ketall https://github.com/corneliusweig/ketall
kubectl krew install get-all
# List all resources in the cluster (namespaced and non-namespaced)
kubectl get-all
# List everything created in the last hour
kubectl get-all --since=1h

# Hint at CRDs - The way to extend K8s
kubectl get crd
# Example ServiceMonitor
kubectl get crd servicemonitors.monitoring.coreos.com -o yaml
#

# List installed Helm charts
helm ls

# Where does Helm store its data?
kubectl get secret sh.helm.release.v1.local-kube-prometheus-stack.v1 -o yaml

# Explain anatomy of Helm CLI
helm help

# A few tricks when working with Helm charts
# List description/info for a chart
helm show chart prometheus-community/kube-prometheus-stack
# List all values for a chart. Beware: long!
helm show values prometheus-community/kube-prometheus-stack

# Explain anatomy of a Helm chart
# Create helm Chart of our own
helm create test-chart

# Add Stuff

helm lint test-chart

# Explain helm dependencies
# Review the previously used helm chart of kube-prometheus-stack

# Hint at https://artifacthub.io/ 
# This is where a lot of charts and also documentation can be found
# There are a lot of different charts obvously. Tip for good charts apart from official ones (if available) are the Bitnami ones: https://artifacthub.io/packages/search?kind=0&org=bitnami

helm uninstall local-kube-prometheus-stack

# Alternative to helm: kustomize 
