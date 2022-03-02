# Basics
The most basic command
```
docker run hello-world
```

First example what Docker Desktop suggests.
```
docker run -d -p 8001:80 docker/getting-started
 ```

# Run an Nginx web server and lets discover it.
💡 If you don't use a name an id will be created.
 -d is short for --detach, which means you just run the container and then detach from it. Essentially, you the run container in the background.
First host port, second container port. 
```
docker run --name hello_world -p 8002:80 -d nginx
```
List containers
```
docker ps
```
Show stats: The docker stats command returns a live data stream for running containers. 
```
docker stats hello_world
```
Docker top to display the running processes of a container.
```
docker top hello_world 
```
Show Logs
```
docker logs -f hello_world
```
Stop the container
```
docker stop hello_world
```
Start the container
``` 
docker start hello_world
```
Rename the container
```  
docker container rename hello_world hello_world_neu
```
Remove the container
```  
docker rm hello_world_neu
```
## Exercise
* 📝Start three different Nginx containers. Did you have any challenges?
* 📝Start a docker container, open Nginx in the browser and follow the logs.
* 📝Run a container with Wordpress. See https://hub.docker.com/_/wordpress


# CLI - `docker`
* Restructured in 2017. https://www.docker.com/blog/whats-new-in-docker-1-13/
* Using an oject is more structured but not necessarey
* docker <object> <command> <options>
* Container is the object for docker run. Other objects are fore example image, network or volume.

These two commands are the same
``` 
docker  run hello-world
docker container run hello-world
Show the status of client and daemon components
``` 
docker version
```
Show the cli version
``` 
docker --version 
More information about the docker host, e.g. numbers of containers
``` 
docker system info
```
💡 If you need help
``` 
docker run --help
docker container --help
docker container run --help
```
📝 Use the help to figure out how to list all images.

# Container which automatically restart
💡 We have three options: unless-stopped, always, on-failure
See https://docs.docker.com/config/containers/start-containers-automatically/

```
docker run -d --restart always -p 8005:80 --name my_server nginx
docker container update --restart unless-stopped my_server
docker container inspect my_server
```

# Run a command inside the container
* -it is short for --interactive + --tty. When you docker run with this command it takes you straight inside the container.
* -itd, it runs both the -it options and detaches you from the container. As a result, your container will still be running in the background even without any default app to run.
``` 
docker run -it ubuntu
docker run ubuntu cat /etc/*release*
