#!/bin/bash
#Docker Part 1
#Why Docker & use cases (local development, in a cluster, etc.), understanding

docker run hello-world

# explain command, action, how theses commands are used. 
docker run --help

# start nginx and open in browser, see the live log, realise what happens if stop with control + c, explain port mapping, explain image  at the end
# mention attach mode
# Rule: hostport / container port
docker run -p 80:80  nginx 

# show documentation and resources

# Name vs id
# Name is used, even if the container is stopped
# attach  vs. detach explain 
docker run --name hallo_world -p 80:80 -d nginx
curl localhost
docker stop hallo_world
docker rm hallo_world

# explain:  detach -d is short for --detach, which means you just run the container and then detach from it. Essentially, you run container in the background.

# immediately disappears container are meant to run a specific tasks or process. only lives as long the process is alive. 
 docker run ubuntu

# -it is short for --interactive + --tty. When you docker run with this command it takes you straight inside the container.
# -itd, it runs both the -it options and detaches you from the container. As a result, your container will still be running in the background even without any default app to run.
# explain exec
docker run -it ubuntu
docker run ubuntu cat /etc/*release*

# explain restart: https://docs.docker.com/config/containers/start-containers-automatically/

# explain volume with -v, https://docs.docker.com/storage/volumes/ 

# Exercise
docker run -d --restart always -p 81:80 -m 64m --name a5 -v /home/adamm/test:/home nginx:latest

# Show some examples how to run an application to try it:
#$ docker run --name some-wordpress -p 8080:80 -d wordpress => https://hub.docker.com/_/wordpress

# Cleanup 
docker system prune -f

