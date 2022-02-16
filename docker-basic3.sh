#!/bin/bash
# compose 
# explain versions  1, 2,3 default bridge network in version 1, 
# Introduction to yaml => SLide, advantages fo compose
# Link: https://docs.docker.com/compose/compose-file/
# Good example https://github.com/dockersamples/example-voting-app


# Excercise
#First create a redis database container called redis, image redis:alpine. 
docker run --name redis -d redis:alpine

#Next, create a simple container called clickcounter with the image kodekloud/click-counter, link it to the redis container that we created in the previous task and then expose it on the host port 8085
#The clickcounter app run on port 5000. 
docker run -d --name=clickcounter --link redis:redis -p 8085:5000 kodekloud/click-counter
# You can now access this application using the Click-Counter tab above the terminal. Refresh the page and see the count increase.
# Let's clean up the actions carried out in previous steps. Delete the redis and the clickcounter containers.
#To stop the containers: docker stop <CONTAINER-NAME>
#To delete the containers: docker rm <CONTAINER-NAME>

#Create a docker-compose.yml file under the directory /root/clickcounter. Once done, run docker-compose up.

#The compose file should have the exact specification as follows - redis service specification - Image name should be redis:alpine.
#clickcounter service specification - Image name should be kodekloud/click-counter, app is run on port 5000 and expose it on the host port 8085 in the compose file.

