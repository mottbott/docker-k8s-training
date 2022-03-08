# Kubernetes Exercises
[⬅️ Back to Kubernetes overview](kubernetes.md)

This is a list of exercises to practice the gained knowledge

## Implement Blue/Green Deployment 

Goals
* Implement blue/green deployment using Kubernetes native tools only

Inputs
* What is a blue/green deployment: https://martinfowler.com/bliki/BlueGreenDeployment.html
* Use two `Deployment`s and a single `Service` with an appropriate label selector to route either `Deployment`.
* Use the [paulbouwer/hello-kubernetes](https://hub.docker.com/r/paulbouwer/hello-kubernetes/) and the `MESSAGE` env to see which deployment is active

Topics covered
* Services
* Deployment
* Pods

## Implement Canary Deployment

Goals
* Implement canary deployment using Kubernetes native tools only

Inputs
* What is a canary deployment: https://martinfowler.com/bliki/CanaryRelease.html
* Use two `Deployment`s and a single `Service` with an appropriate label selector to route certain ratios of traffic to either `Deployment`.
* Use the [paulbouwer/hello-kubernetes](https://hub.docker.com/r/paulbouwer/hello-kubernetes/) image and the `MESSAGE` env to see which deployment is active

Topics covered
* Services
* Deployment
* Pods

## Game of Pods on KodeKloud

Goals
* Complete the `Game of Pods`

Inputs
* All you need to know: https://kodekloud.com/courses/game-of-pods/

Topics covered
* A lot

## Deploy .NET Microservices Sample Reference Application

Goals
* Learn about complex deployments

https://github.com/dotnet-architecture/eShopOnContainers/
https://github.com/dotnet-architecture/eShopOnContainers/tree/dev/deploy/k8s/helm
