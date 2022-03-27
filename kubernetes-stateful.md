# Stateful
[⬅️ Back to Kubernetes overview](kubernetes.md)

Create StatefulSet based on the example
```shell
kubectl apply -f kubernetes/statefulset/resources.yaml
```
Check the result if the deployment worked by visiting http://localhost:30888 

📝 Why is there a nginx error page displayed?

Inspect the resources that have been created. What about their name?
```shell
kubectl get pods
kubectl get service
kubectl get persistentvolumeclaims
kubectl get persistentvolume
```

What are these volumes we just used/created?
Explain `PersistentVolume`s and `PersistentVolumeClaim`s as well as retention policies.

💡 Retention policies should always be checked before depleting any `PersistentVolume` or `PersistentVolumeClaim`

So what about storage classes?
```shell
kubectl get storageclass
kubectl get storageclass hostpath -o yaml
```
* 💡 Visit https://kubernetes.io/docs/concepts/storage/storage-classes/ for more information
* 💡 `StorageClass`es will be one of the 

Let's copy different content to the volumes to see the effect
```shell
kubectl cp kubernetes/statefulset/index-light.html web-0:/usr/share/nginx/html/index.html
kubectl cp kubernetes/statefulset/index-dark.html web-1:/usr/share/nginx/html/index.html
```
💡 `cp` can be really handy but only works for volumes mounted on pods.

Check the result of the change by going to http://localhost:30888
It might take a few (or even many) tries to get to both instances

As this is persistent storage, this change is permanent in case of a pod restart
```shell
kubectl delete pod web-0
```
💡 Service special case: Headless service to give unique but deterministic DNS names for each Pod.

* 📝 What happens with the `pv` if you delete the `StatefulSet`?
* 📝 Create a custom `pvc` and use it in a `Deployment`. What is the difference compared to a `StatefulSet`?
