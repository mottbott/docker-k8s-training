# Docker Compose 
[⬅️ Back to Docker overview](docker.md)

* Docker Compose is a tool that was developed to help define and share **multi-container applications**. With Compose, we can create a YAML file to define the services and with a single command, can spin everything up or tear it all down.
* Docker compose itself is one binary file. If your are using Docker Desktop it should be installed via Settings => General and *Enables the docker-compose command to use Docker Compose V2*. For other purposes the installation manual can be found here: https://docs.docker.com/compose/install/



# Start with some examples
* .NET Microservices Sample Reference Application. Sample .NET Core reference application, powered by Microsoft, based on a simplified microservices architecture and Docker containers. https://github.com/dotnet-architecture/eShopOnContainers
* A whole Apache Kafka setup including Broker, Zookeeper, ksqlDB and much more. https://github.com/confluentinc/cp-all-in-one.git
* Wordpress: https://github.com/kassambara/wordpress-docker-compose


Start the .NET Microservices Sample Reference Application

```
git clone https://github.com/dotnet-architecture/eShopOnContainers
cd eShopOnContainers/src
docker-compose build
# up  Create and start containers
docker-compose up -d

# Stop services
docker-compose stop
# Stop and remove containers, networks
docker-compose down
```
Visit http://host.docker.internal:5104/catalog to view the catalog.

* 💡 Docker Compose commands are executed where the **docker-compose.yml** is located. 
* 💡 The first clone, build and application start can take some time. 

# Let's do it manually
We start with an example to see where Docker Compose supports us. The example is a simple clickcounter webapp. The results are stored in a redis db. 
```  
# Clone the demo application
git clone https://github.com/dockersamples/example-voting-app.git
cd example-voting-app/votes

# Build the and start the webapp
docker build . -t voting-app
docker run -p 5000:80 voting-app
``` 

* Now wen can open the application in our browser and start voting. 
* In the logs we should see that the redis is missing. **redis.exceptions.ConnectionError: Error -2 connecting to redis:6379. Name or service not known.**
* Next we can create a Redis database. Afterward we start the voting-app and link it to our container so that the webapp can access the redis database. 
``` 
docker run --name=redis -d redis:alpine
docker run -d --name=voting-app --link redis:redis -p 5000:80 voting-app
``` 
💡 Using the link option is only for demonstration purpose. The --link flag is a deprecated legacy feature of Docker.


## Exercise
* 📝 Explore the docker-compose.yml and figure out how services, images and port mappings are utilized. https://github.com/kassambara/wordpress-docker-compose/blob/master/docker-compose.yml
* 📝 Create a **docker-compose.yml** file in your working directory. The webapplication contains of webapp and redis db. 
* 📝 For the redis service you can use the image **redis:alpine.**
* 📝 For the clickcounter service you can use the image **kodekloud/click-counter**.
* The webapp runs on port 5000 and should be exposed it on the host port 8085.