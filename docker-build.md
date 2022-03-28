# Build
[⬅️ Back to Docker overview](docker.md)

Show all local images
```
docker images 
```
Download a python image from Docker hub.
```
docker pull python
```
💡 Docker Desktop depicts the images as well. 

Delete all images on the host 
```
docker rmi $(docker images -aq)
```
Build a docker image without a Tag
```
docker build .
```
* 💡 If you are using **build .** without any further options the image will only have an ID. 
* 💡 The example app can be found in the folder **simple-docker-app**.

Add a tag and a version
```
docker build . -t webapp-color:0.1
```
* 💡 docker build -t username/*image_name:tag_name* . 
* 💡 Tags are aliases to the ID of your image. 
* 💡 Whenever an image is tagged without an explicit tag, it’s given the **latest** tag by default.

Run the self build image
```
docker run -d -p 8010:8080 webapp-color:0.1 
```
Visit the website http://localhost:8010

Set environment variables with the option **--env** or **-e** 
```
docker run -d --name blue-app -e APP_COLOR='blue' -p 38282:8080 webapp-color:0.1
```
Visit the website http://localhost:38282
* 💡 Variables have the following format: KEY=value
* 💡 Inside the container you can also use the echo command to print a shell variable. **echo $KEY**
* 💡 The option **-e** can be used multiple times.
* 💡 Not all colours are available. You can use `red`, `green`, `blue`, `blue2` or `pink`.

🚧 TODO: Merge with exercise below. Differentiate between tips & exercise more cleanly

## Exercise
* 📝 Build your own image based on the given example with following image name and tag *my-webapp:1.0*. The source code can be found here https://github.com/kodekloudhub/webapp-color
* 📝 Inspect the Dockerfile. Where is your application code stored inside the container and how is declared that the port inside the container is **8080**?
* 📝 *Optional:* Deploy a MySQL database using the mysql image and name it mysql-db. Set the database password to use db_pass123. Lookup the MySQL image on Docker Hub and identify the correct environment variable to use for setting the root password.


# command vs. entrypoint 
* Containers are not meant to run an operating system. Container are meant to run a specific tasks or process. and only lives as long the process is alive. 
* A CMD defines the programs that would be run within the container when it starts. CMD for nginx or mysqld. ubuntu run bash, if it can not find a terminal it exists. 
* Immediately disappears 
 docker run ubuntu

*Replace* the CMD entirely. It waits for 5 seconds and disappears. 
```
docker run ubuntu sleep 5
```

Build your own Dockerfile with default 5 seconds sleep. 
* Dockerfile: 
* FROM ubuntu 
* CMD sleep 5
```
docker build . -t ubuntu_sleeper
docker run ubuntu_sleeper
```

Entrypoint, command line parameters will be *appended*
* Dockerfile: 
* FROM ubuntu
* ENTRYPOINT ["sleep"]
* CMD ["1"]
              

```
docker build . -t ubuntu_sleeper
docker run ubuntu_sleeper 10 
```
💡 Without no **CMD** and no parameter you would get the following error: **sleep: missing operand**
💡 The entrypoint can be overwritten with the entrypoint **--entrypoint** option. 
