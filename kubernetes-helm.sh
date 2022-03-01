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