# Stateful
* 🚧 TODO Usage of ConfigMap 
* 🚧 TODO Usage of Secret (Extended: Ways to manage secrets the real way or why secrets are usually not very secret)

Create StatefulSet based on the example
```
k apply -f kubernetes/statefulset/resources.yaml
```

Inpsect the resources that have been created. What about their name?
```
k get pods
k get service
k get pvc
k get pv
```

Forward service 
```
k port-forward service/nginx-sts 8180:80
```

❔ What are these volumes we just used/created?

Explain PVs / PVCs. Retention policies

❔ What are storage classes?

Let's copy different content to the volumes to see the effect
```
k cp kubernetes/statefulset/index-light.html web-0:/usr/share/nginx/html/index.html
k cp kubernetes/statefulset/index-dark.html web-1:/usr/share/nginx/html/index.html
```
💡 `cp` can be really hand but only works for volumes mounted on pods.

Forward the specific pods to local ports to verify the result
```
k port-forward pod/web-0 8080:80
k port-forward pod/web-1 8181:80
```
🚧 TODO: Alternatively create a NodePort service?

As this is persistent storage, this change is permanent in case of a pod restart
```
k delete pod web-0
```


💡 Service special case: Headless service to give unique but deterministic DNS names for each Pod.