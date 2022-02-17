#!/bin/bash
#images, build, environment variables, entrypoint vs. cmd, 

# show layered architecture and copy-on-write
# explain differences between python:3.6 and python-alpine:3.6

# Docker images are supposed to be small and light weight. Let us try to trim it down.
# docker images 
# docker pull 

# docker build with and without tags


# environment variables
docker build . -t webapp-color
docker run -d --name blue-app -e APP_COLOR='blue' -p 38282:8080 kodekloud/simple-webapp
docker run -d --name mysql-db -e MYSQL_ROOT_PASSWORD='db_pass123' mysql

# command vs. entrypoint (here are slides necessary)
# CMD defines the programs that would be run within the container. CMD for nginx or mysqld. ubnutu run bash, if it can not find a terminal it exists. 

# immediately disappears container are meant to run a specific tasks or process. only lives as long the process is alive. 
 docker run ubuntu

# CMD will be replace entirely
docker run ubuntu sleep 5

# Entrypoint, command line parameters will be appanded 
# Dockerfile: FROM Ubuntu ENTRYPOINT["sleep"]
docker run ubuntu-sleeper 10 

# Operand is missing
docker run ubuntu-sleeper 

# Solution: use bot => # Dockerfile: FROM Ubuntu ENTRYPOINT["sleep"] CMD["5"]
# Overwrite the entrypoint docker run --entrypoint sleep2.0 ubuntu-sleeper 10


#Excercises
# Build and  Images
#To what location within the container is the application code copied to during a Docker build?
#Inspect the Dockerfile in the webapp-color directory.

#When a container is created using the image built with this Dockerfile, what is the command used to RUN the application inside it.
#Inspect the Dockerfile in the webapp-color directory.
#Open the Dockerfile and look for ENTRYPOINT command.
#What port is the web application run within the container?
#Inspect the Dockerfile in the webapp-color directory. => Open the Dockerfile and look for the port in EXPOSE command.
#Build a docker image using the Dockerfile and name it webapp-color. No tag to be specified.
docker build -t webapp-color .
#Run an instance of the image webapp-color and publish port 8080 on the container to 8282 on the host.
docker run -p 8282:8080 webapp-color
#What is the base Operating System used by the python:3.6 image? If required, run an instance of the image to figure it out.
Run docker run python:3.6 cat /etc/*release* command.
#What is the approximate size of the webapp-color image?
docker images
# Build a new smaller docker image by modifying the same Dockerfile and name it webapp-color and tag it lite. Hint: Find a smaller base image for python:3.6. Make sure the final image is less than 150MB.
# Modify Dockerfile to use python:3.6-alpine image and then build using docker build -t webapp-color:lite .
#Run an instance of the new image webapp-color:lite and publish port 8080 on the container to 8383 on the host.
docker run -d -p 8383:8080 webapp-color:lite


#environment variables
#Inspect the environment variables set on the running container and identify the value set to the APP_COLOR variable.
 docker ps 
 docker inspect container-name/container-id
 #Run a container named blue-app using image kodekloud/simple-webapp and set the environment variable APP_COLOR to blue. Make the application available on port 38282 on the host. The application listens on port 8080.
 docker run -p 38282:8080 --name blue-app -e APP_COLOR=blue -d kodekloud/simple-webapp
#To know the env field from within a webapp container, run docker exec -it webapp env

#Deploy a mysql database using the mysql image and name it mysql-db. Set the database password to use db_pass123. Lookup the mysql image on Docker Hub and identify the correct environment variable to use for setting the root password.
#Run the command: docker run -d -e MYSQL_ROOT_PASSWORD=db_pass123 --name mysql-db mysql
#To know the env field from within a mysql-db container, run docker exec -it mysql-db env

# get this Dockerfiles: Dockerfile-mysql  Dockerfile-python  Dockerfile-ubuntu  Dockerfile-wordpress 
# What is the ENTRYPOINT configured on the mysql image?
# What is the CMD configured on the wordpress image?
# What is the final command run at startup when the wordpress image is run. Consider both ENTRYPOINT and CMD instructions
# What is the command run at startup when the ubuntu image is run?
# Run an instance of the ubuntu image to run the sleep 1000 command at startup. Run it in detached mode.
docker run -d ubuntu sleep 1000