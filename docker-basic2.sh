#!/bin/bash
#images, build, environment variables, entrypoint vs. cmd, 


# explain differences between python:3.6 and python-alpine:3.6

# docker images 
# docker pull 

# docker build with and without tags


# environment variables
docker build . -t webapp-color
docker run -d --name blue-app -e APP_COLOR='blue' -p 38282:8080 kodekloud/simple-webapp
docker run -d --name mysql-db -e MYSQL_ROOT_PASSWORD='db_pass123' mysql

# command vs. entrypoint (here are slides necessary)
# CMD defines the programs that would be run within the container. CMD for nginx or mysqld. ubnutu run bash, if it can not find a terminal it exists. 

# CMD will be replace entirely
docker run ubuntu sleep 5

# Entrypoint, command line parameters will be appanded 
# Dockerfile: FROM Ubuntu ENTRYPOINT["sleep"]
docker run ubuntu-sleeper 10 

# Operand is missing
docker run ubuntu-sleeper 

# Solution: use bot => # Dockerfile: FROM Ubuntu ENTRYPOINT["sleep"] CMD["5"]
# Overwrite the entrypoint docker run --entrypoint sleep2.0 ubuntu-sleeper 10
