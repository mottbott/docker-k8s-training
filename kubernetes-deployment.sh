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
