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
💡 `cp` can be really hand but only works for volumes mounted on pods.

Check the result of the change by going to http://localhost:30888
It might take a few (or even many) tries to get to both instances

As this is persistent storage, this change is permanent in case of a pod restart
```shell
kubectl delete pod web-0
```
💡 Service special case: Headless service to give unique but deterministic DNS names for each Pod.

* 📝 What happens with the `pv` if you delete the `StatefulSet`?
* 📝 Create a custom `pvc` and use it in a `Deployment`. What is the difference compared to a `StatefulSet`?

# Environment variables, ConfigMaps & Secrets

Inspect and apply the template "hello-kubernetes" example under `kubernetes/hello-kubernetes/resources.yaml`
```shell
kubectl apply -f kubernetes/hello-kubernetes/resources.yaml
```
Check the deployed app under http://localhost:31313

📝 How does the page know about the `Pod` name etc?

Let's externalize the message into an external configuration using a `ConfigMap`
```shell
kubectl create configmap hello-message --from-literal="message=👋 Hello from the ConfigMap"
kubectl get configmap
kubectl get configmap hello-message -o yaml
```

📝 This `ConfigMap` is now created imperatively. How could we make it declarative and manage it with the other resources?

Replace the environment variable definition with a lookup to the `ConfigMap`
```yaml
          - name: MESSAGE
            valueFrom:
              configMapKeyRef:
                name: hello-message
                key: message
```

Apply the resources again
```shell
kubectl apply -f kubernetes/hello-kubernetes/resources.yaml
```

Let's check the result under http://localhost:31313

📝 Did the pods restart to show this change? Why (not)?

Let's update the value in the `ConfigMap` (Can also be done decoratively if part of the resource)
```shell
kubectl edit configmap hello-message
```

Let's check the result under http://localhost:31313

📝 Can you explain the result?

The environment inside the container can also be checked. Note: the `Pod` name will certainly be different
```shell
kubectl exec -it hello-kubernetes-59bb8ffc5f-gvlbq -- env
kubectl exec -it hello-kubernetes-59bb8ffc5f-gvlbq -- env | grep MESSAGE
```

📝 What can we do?

If we want to "protect" the values of externalized configuration, we can use `Secrets`
```shell
kubectl create secret generic secret-message --from-literal="message=🤫 ... this is a secret message"
kubectl get secret
kubectl get secret secret-message -o yaml
```

Looks safe, doesn't it?

Let's use it instead of the `ConfigMap`
```yaml
          - name: MESSAGE
            valueFrom:
              secretKeyRef:
                name: secret-message
                key: message
```

Let's check the result under http://localhost:31313

💡 In the [Helm module](kubernetes-helm.md), there is a way described on how to read contents of a secret

📝 Can you put a whole file into a `ConfigMap` or `Secret`?
📝 Can you mount a `ConfigMap` or `Secret` to the file system rather than environment variables?

