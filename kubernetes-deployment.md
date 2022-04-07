# Deployments
[⬅️ Back to Kubernetes overview](kubernetes.md)

Create a deployment with nginx
```shell
kubectl create deployment --image=nginx --port 80 nginx 
```
So what is the difference? There is still a pod, but with a weird name
```shell
kubectl get pod
kubectl describe pod -l "app=nginx"
```
Pod is "Controlled By" a ReplicaSet
```shell
kubectl get replicaset
kubectl describe replicaset -l "app=nginx"
```
ReplicaSet is "Controlled By" the Deployment we've just created
```shell
kubectl get deployment
kubectl describe deployment nginx
```

Labels are properties attached to each object. Selectors filter these items.
```shell
kubectl get pods --selector app=nginx
```

Expose the deployment using a `Service` of type `NodePort`
```shell
kubectl create service nodeport nginx --node-port=30080 --tcp 80:80
```
Visit http://localhost:30080/ to see your deployment.

💡 `NodePort`s can only be in the range of 30000-32767

How does this even know to what pod to route the traffic to? Let's inspect the created service
```shell
kubectl get service
kubectl get service nginx  -o yaml
```

Let's scale the deployment to more instances and watch what happens
```shell
kubectl get pods --watch --output wide
kubectl scale deployment nginx --replicas=2
```

See the new pods? What happens if we delete an existing pod?
```shell
kubectl delete pod -l "app=nginx"
```

Rollout handling
```shell
kubectl rollout status deployment/nginx
kubectl rollout history deployment/nginx
kubectl rollout undo deployment/nginx
```

Check current pods
```shell
kubectl get pods
```

## Exercise
* Create a new deployment with Nginx version 1.20.2 with two replicas
* Expose a node port service with port 30081
* Optional: Change the Nginx version to 1.21.6. You can use the following help command to get further information about changing the image. kubectl set image --help Hint: Container name is Image name. In our case nginx. 

## Different `kubectl` variants at work
```shell
kubectl run nginx --image=nginx --dry-run=client -o yaml
```
Edit resources and apply the changes immediately
```shell
kubectl edit deployment nginx
```
Get definition of the resources and save them to a local file
```shell
kubectl get deployment nginx -o yaml > deployment-nginx.yaml
vi deployment-nginx.yaml
```
Apply the changed configuration
```shell
kubectl apply -f deployment-nginx.yaml
```
See WARNING. Should not mix imperative/declarative commands (due to last-applied config)

Want to remove something you added without any hassle? Just run
```shell
kubectl delete -f deployment-nginx.yaml
```

This might not delete resources created by your resources
```shell
kubectl delete service nginx
```

This is dependent on the type and name of the resources (kind, apiVersion, metadata.name)

💡 Explain alternative deployment methods StatefulSet, DaemonSet, (ReplicaSet)

