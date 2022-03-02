
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


#use case for docker

#Patterns for running tests inside a Docker container: https://www.testcontainers.org/supported_docker_environment/continuous_integration/dind_patterns/
# Confluent Platform all-in-one Docker Compose file: https://docs.confluent.io/platform/current/quickstart/ce-docker-quickstart.html