
# Cleanup 
Which command is used to delete the stopped containers?
docker container prune
docker system prune -f


# exercises
# which docker version
docker version
# how many containers are running
docker ps 
docker container ls
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


#use case for docker
#Patterns for running tests inside a Docker container: https://www.testcontainers.org/supported_docker_environment/continuous_integration/dind_patterns/
# Confluent Platform all-in-one Docker Compose file: https://docs.confluent.io/platform/current/quickstart/ce-docker-quickstart.html