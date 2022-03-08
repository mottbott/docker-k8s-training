# Registry 
[⬅️ Back to Docker overview](docker.md)

By default, the Docker engine interacts with DockerHub which is a hosted registry solution by Docker Inc. If you run **docker run nginx** the image is pulled from DockerHub.

Login to Docker hub
``` 
docker login
``` 
You can create your own registry and push/pull images from there. 
``` 
docker run -d -p 5000:5000 --name registry registry:2
``` 
Choose a folder with a Dockerfile 
``` 
docker build . -t my-image
``` 
Tag the build image and push it to your registry
``` 
docker image tag my-image localhost:5000/my-image
docker push localhost:5000/my-image
``` 
💡 The name of the image contains the registry. 
Use docker pull [server-addr/image-name] to pull the images that we pushed earlier.
```
docker pull localhost:5000/my-image
``` 
💡 To check the list of images pushed , use **curl -X GET localhost:5000/v2/_catalog**

## Exercise
* 📝 Run a registry server with name equals to my-registry using registry:2 image with host port set to 5001, and restart policy set to always. Note: Registry server is exposed on port 5000 in the image.
* 📝 Pull the latest httpd image from docker hub and push it to your newly created registry. 