# Entry


## Docker
What are the components of the Docker Engine? 
REST API, Docker Daemon
Images, Containers, Volumes
Docker Cli, Docker Daemon, REST API

What component of the docker engine manages the images, containers, volumes and networks on a host?
 REST API
 Docker Daemon
 Docker CLI

 We can run containers without installing Docker.
 True
 False

 By default, data stored inside the container is always persistent
 True
 False

 By default, Docker is configured to look for images on Google Cloud Registry
 True
 False

 Which component is a read-only template used for creating a Docker container?
 Docker Network
 Docker images
 Container
 Docker volume


What is the command used to list the running containers on the Docker Host?
 docker container ls
 docker container start
 docker container stop
 None of the above

 Which of the below commands create a container with nginx image and name nginx?
 docker container create nginx --name nginx
 docker container --name nginx nginx
 docker container run nginx
 docker container create --name nginx nginx

 What is the command to run a “nginx” container in a detached mode with name “webapp”?
 docker container run -it --name webapp nginx
 docker container run -it --name nginx webapp
 docker container run -d --name webapp nginx
 docker container run -d --name nginx webapp

Delete the stopped container named “webapp”.
docker container delete webapp
 docker container remove webapp
 docker container kill webapp
 docker container rm webapp


How do I get only the IDs of running containers?
 docker container ls
 docker container ls -a
 docker container ls -aq
 docker container ls -q

You have a webapp container and image httpd.
Inspect the logs of the webapp container.
Which command is used to get the stream logs of the webapp container so that you can view the logs live?

 docker container log webapp
 docker container log -f webapp
 docker container logs webapp
 docker container logs -f webapp

 Delete all running and stopped containers on the host. (Explore the documentation to identify an option to force remove running containers)

 docker container stop $(docker container ls -q)
 docker container rm $(docker container ls -q)
 docker container stop $(docker container ps -q)
 docker container rm -f $(docker container ls -aq)

 Run a container named webapp with nginx image in detached mode. Select the right answer.

 docker container run --detach --name=webapp nginx
 docker container run --detach --name=nginx webapp
 docker container create -d --name=nginx webapp
 docker container create -d nginx

 Which command can be used to check the restart policy of webapp container?

 docker container inspect webapp
 docker container info webapp
 docker container check webapp
 None of the above

 Which option could be used to expose a webapp container to the outside world?

 -p
 -P
 –publish
 –expose

 What is the hostname set on the container when the following command is run :
docker container run -d --name webapp httpd

 webapp
 apache
 httpd
 containers unique id

 Map TCP port 80 in the container to port 8080 on the Docker host for connections to host IP 192.168.1.10 . Select the all right answers

 -p 192.168.1.10:8080:80
 -p 192.168.1.10:80:8080
 -p 192.168.1.10:8080:80/tcp
 -p 192.168.1.10:8080:8080

 We have created a docker compose file for an application. Choose the correct option to deploy the application and run it in the background.

 docker-compose up -d
 docker-compose up -b
 docker-compose up --detach
 docker-compose start --background

 Compose files using the version ‘2’ and version ‘3’ syntax must indicate the version number at the root of the document.

 True
 False

 What is the command to see the running process inside of containers created by compose file?

 docker-compose top
 docker-compose stats
 docker top
 docker stats

## K8S

How many pods are running in the "kube-system" namespace on a default Docker Desktop cluster?
0
7
9
13
