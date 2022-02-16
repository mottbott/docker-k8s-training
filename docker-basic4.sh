# storage, registry, network

# engine
# docker engine A PID namespace is a set of unique numbers that identify processes. Linux provides tools to create multiple PID namespaces. Each namespace has a complete set of possible PIDs. This means that each PID namespace will contain its own PID 1, 2, 3, and so on.
# cgroups (abbreviated from control groups) is a Linux kernel feature that limits, accounts for, and isolates the resource usage of a collection of processes.


#storage: Old-school mit -v und auf Bindmound hinweisen. https://docs.docker.com/storage/bind-mounts/
# mention that nothing is persitent.
#storage. rellay demostrate with interactive commands and so on. #mysql would be an example
docker run -d --restart always -p 81:80 -m 64m --name a5 -v /home/adamm/test:/home nginx:latest


#registry 
# explain naming and docker login
# By default, the Docker engine interacts with ? DockerHub => DockerHub is a hosted registry solution by Docker Inc.
docker run -d -p 5000:5000 -name registry registry:2
docker image tag my-image localhost:5000/my-image
docker push localhost:5000/my-image
docker pull localhost:5000/my-image

#Let practice deploying a registry server on our own.
# Run a registry server with name equals to my-registry using registry:2 image with host port set to 5000, and restart policy set to always. Note: Registry server is exposed on port 5000 in the image.
docker run -d -p 5000:5000 --restart=always --name my-registry registry:2

#Now its time to push some images to our registry server. Let's push two images for now .i.e. nginx:latest and httpd:latest. Note: Don't forget to pull them first.
#To check the list of images pushed , use curl -X GET localhost:5000/v2/_catalog
Run: docker pull nginx:latest then docker image tag nginx:latest localhost:5000/nginx:latest and finally push it using docker push localhost:5000/nginx:latest.
We will use the same steps for the second image docker pull httpd:latest and then docker image tag httpd:latest localhost:5000/httpd:latest and finally push it using docker push localhost:5000/httpd:latest

#Now we can pull images from our registry-server as well. Use docker pull [server-addr/image-name] to pull the images that we pushed earlier.
In our case we can use: docker pull localhost:5000/nginx



# network: bridge, none and host
# docker has by default one internal network and DNS (container name)
docker run ubuntu
docker run ubuntu --network=none
docker run ubuntu --network=host
docker network ls 
#via docker inspect i get the ip, inspect work for networks as well. for instance to get the subnet. 

#create a new network
docker network create --driver bridge --subnet 182.18.0.1/24 --gateway 182.18.0.1 wp-mysql-network

#Deploy a mysql database using the mysql:5.6 image and name it mysql-db. Attach it to the newly created network wp-mysql-network
#Set the database password to use db_pass123. The environment variable to set is MYSQL_ROOT_PASSWORD.
docker run -d -e MYSQL_ROOT_PASSWORD=db_pass123 --name mysql-db --network wp-mysql-network mysql:5.6

#Deploy a web application named webapp using the kodekloud/simple-webapp-mysql image. Expose the port to 38080 on the host.
#The application makes use of two environment variable:
#1: DB_Host with the value mysql-db.
#2: DB_Password with the value db_pass123.
#Make sure to attach it to the newly created network called wp-mysql-network.
#Also make sure to link the MySQL and the webapp container.
# note: -e is multiple times possible
docker run --network=wp-mysql-network -e DB_Host=mysql-db -e DB_Password=db_pass123 -p 38080:8080 --name webapp --link mysql-db:mysql-db -d kodekloud/simple-webapp-mysql

