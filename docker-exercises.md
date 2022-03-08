# Docker Exercise
[⬅️ Back to Docker overview](docker.md)

## Create your own Docker application

Goals
* Become familiar with the Docker ecosystem
* Utilise the main learnings from the course
* Understand the  lifecycle in Docker

Exercise
* Create your own simple Docker application while using the programming language of your choice.
* Create a REST Endpoint which receives a requests and progress it like the click-counter example. 
* Build a Docker image, store it in your own registry and write a compose file to run it.
* Update your application by implementing new feature and create new releases.
* Optional: Store the requests in a container-based database with a persistent data store. 
* Optional: Allocate resources like CPU and Memory. 

Links
* Click counter example: https://hub.docker.com/r/kodekloud/click-counter
* Runtime options with Memory, CPUs, and GPUs: https://docs.docker.com/config/containers/resource_constraints/

## Move your workload to the cloud

Goals
* Discover cloud solutions for container
* Understand how workloads are moved to the cloud

Exercise
* Use external Docker registry from a public cloud provider and push your images
* Run your container in the cloud with container services like **Azure Container Instances** or **AWS ECS.**
* Make your application available on the internet. 


Links
* AWS Container Registry: https://aws.amazon.com/de/ecr/
* Azure Azure Container Registry: https://azure.microsoft.com/en-us/services/container-registry/
* Azure Container Instances: https://azure.microsoft.com/en-us/services/container-instances/
* AWS ECS: https://aws.amazon.com/de/ecs/