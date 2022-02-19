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

## K8S