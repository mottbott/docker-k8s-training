# Basics
[⬅️ Back to Docker overview](docker.md)

Run the first container
```
docker run hello-world
```

Let's try the example which Docker Desktop suggests.
```
docker run --detach --publish 8001:80 docker/getting-started
 ```
Visit http://localhost:8001 to view the getting-started page.

 * 💡 The first port is the host port, the second the container port. 
 * 💡 You don't need to write the URL Docker Desktop already provides the link via GUI via *Container/Apps*. 

# Run a Nginx web server and discover it
Let's start a Nginx container. 
```
docker run --name hello_world --publish 8002:80 --detach nginx
```
Visit http://localhost:8002 to view the default nginx page. 

* 💡 The option -d is short for --detach, which means you just run the container and then detach from it. Essentially, you the run container in the background. Default is the attach mode.
* 💡 Instenad of using **--detach** you can use the short version **-d** and **-p** instead of **--publish**.

List containers
```
docker ps
```
💡 If you don't use a name for your container an ID will be created.

List all containers including exited container. 
```
docker ps -a
```
Want to automatically remove the container when it exits. Use the **rm** flag.
```
docker run --rm -p 8003:80 -d nginx
```

💡 Possible States of a Docker Container: Running, Restarting, Exited, Paused and Dead.
Show stats: The docker stats command returns a live data stream for running containers. 
```
docker stats hello_world
```
Docker top to display the running processes of a container.
```
docker top hello_world 
```
Show Logs and follow the log output
```
docker logs -f hello_world
```
Stop the container
```
docker stop hello_world
```
💡 A stopped container is in the state exited.


## Exercise
* 📝Run your first "Hello World" container.
* 📝Can you find the container in your Docker Desktop GUI and stop it there?


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
💡Only stopped container can be removed.

If you don't want to stop it before ...
```  
docker rm -f hello_world_neu
```

To delete all running and stopped containers on the host. 
```  
docker rm -f $(docker ps -aq)
```  
## Exercise
* 📝Start three different Nginx containers. Did you have any challenges and how did you solve them?
* 📝Start a docker container, open Nginx in the browser and follow the logs via command line. Then reload the page.
* 📝Run a container with Wordpress. The appropriate image can be found here. https://hub.docker.com/_/wordpress


# CLI - `docker`
* Restructured in 2017. https://www.docker.com/blog/whats-new-in-docker-1-13/
* Using an object is more structured but not necessary
* docker \<object> \<command> \<options>
* Container is the object for docker run. Other objects are fore example image, network or volume.
* The CLI support tab completion. For instance write **docker i** and press the tab key. All possible option should be displayed.  

These two commands have the same result.
``` 
docker run hello-world
docker container run hello-world
``` 
Show the status of client and daemon components
``` 
docker version
```
Show the engine version only
``` 
docker --version 
``` 
More information about the docker host, e.g. numbers of containers
``` 
docker system info
```
If you need help
``` 
docker 
docker run --help
docker container --help
docker container run --help
```

## Exercise
* 📝 Use Docker help to figure out how to list all images.
* 📝 Figure out how to get the last three log entries of a container. 

# Container which automatically restart
If you reboot your system, your running container will not be alive. Unless you use **--restart always**. 
```
docker run -d --restart always -p 8005:80 --name my_server nginx
docker container update --restart unless-stopped my_server
docker container inspect my_server
```
* 💡 With the option **inspect** you can get further information about your container, like the restart configuration. Look for "RestartPolicy". 
* 💡 We have three options: unless-stopped, always, on-failure
* 💡 See https://docs.docker.com/config/containers/start-containers-automatically/


# Run a command inside the container
Start a container and execute a command.
``` 
docker run ubuntu cat /etc/*release*
docker run -it ubuntu
``` 
💡 The option -it is short for --interactive + --tty. When you docker run with this command it takes you straight inside the container.

Run a command in an existing container. 
``` 
docker exec -it my_server cat /etc/*release*
# terminal into the docker container
docker exec -it my_server bash
``` 
## Exercise
* 📝 The Docker Desktop provides the CLI option. Can you find it?
