#!/bin/bash
#Docker Part 1
#Why Docker, basic understanding of architecture and commands

# Before: Show the architeture and give some background: REST API, Docker Daemon

# get the runtime version 
docker version

# 1st hello world
docker run hello-world

# explain command, action, how theses commands are used. 
docker run --help

# start nginx and open in browser, see the live log, realise what happens if stop with control + c, explain port mapping, explain image  at the end
# mention attach mode
# Rule: hostport / container port
# explain crtl + c to exit 
docker run -p 80:80  nginx 


# show documentation and resources

# Name vs id
# Name is used, even if the container is stopped
# attach  vs. detach explain 
# explain:  detach -d is short for --detach, which means you just run the container and then detach from it. Essentially, you run container in the background.
docker run --name hello_world -p 80:80 -d nginx
curl localhost

# show memory usage & processes & logs
docker stats hello_world
docker top hello_world 
docker logs -f hello_world

docker stop hello_world
docker start hello_world
docker container rename hello_world hello_world_neu
docker rm hallo_world

# -it is short for --interactive + --tty. When you docker run with this command it takes you straight inside the container.
# -itd, it runs both the -it options and detaches you from the container. As a result, your container will still be running in the background even without any default app to run.
# explain exec
docker run -it ubuntu
docker run ubuntu cat /etc/*release*


# explain restart: https://docs.docker.com/config/containers/start-containers-automatically/

# Show some examples how to run an application to try it:
docker run --name some-wordpress -p 8080:80 -d wordpress => https://hub.docker.com/_/wordpress

# Cleanup 
docker system prune -f




# excericese
# which docker version
docker version
# how many containers are running
docker ps 
dcoker container ls
# How many containers are PRESENT on the host now? Including both Running and Not Running ones
docker ps  -a
docker container ls -a
#How many ports are published on this container?=> Run the command docker ps and look under the PORTS column.
docker ps  
#Which of the below ports are the exposed on the CONTAINER?
#Which of the below ports are published on Host?



# how many images are available
docker images
#What is the size of the ubuntu image?
docker images 
#What is the tag of the image?
docker images 
# what is the name of the container with image ubuntu
docker ps  -a
#What is the ID of the container that uses the alpine image and is not running?
# run a redis image
docker run -d redis
# stop the image you have just created
docker stop <container-id> 
#What is the image used to run the nginx-1 container?
docker ps  -a
#Delete all containers from the Docker Host. Both Running and Not Running ones. Remember you may have to stop containers before deleting them.
 #Pull the image nginx:1.14-alpine
docker pull nginx:1.14-alpine
# Run a container with the nginx:1.14-alpine image and name it webapp
docker run -d --name webapp nginx:1.14-alpine
# Cleanup: Delete all images on the host Remove containers as necessary
docker rmi $(docker images -aq)

#  Delete all running and stopped containers on the host. (Explore the documentation to identify an option to force remove running containers)
docker container rm -f $(docker container ls -aq)


