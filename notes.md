# Notes

# How to prepare your Zuehlke Notebook
#### Best 
* Docker for Desktop
* Login for Docker Registry
* Binaries im system path: kubectl, docker-compose
* Best case WSL for  Windows
* Git

#### Medium
* Docker for Desktop
* Login for Docker Registry
* kubectl binary
* Windows command prompt

#### Super Basic
https://labs.play-with-k8s.com/ => Login with GitHab or Docker Account


## Procedure
* Explain, Demo, hands-on (continue to do it.)

## General Ideas
* Nice to have: Prepare a server with exercises. Students can ssh and need to figure out how many containers are running,
* Volunteers can present their solution. 
* Trainers present solutions after exercise  

## Overall technology
* Zoom with breakout session or Teams
* Zuehlke Miro Board

## We provide
* Handout
* Handout exercises
* Git URL?

### Possible videos to show
* Explaining Container (and Kubernetes)  by Kelsey Hightower 7:50 - 10:00 https://www.youtube.com/watch?v=BE77h7dmoQU
* https://thenewstack.io/kubernetes-gets-childrens-book/ and thy YouTube video. Great but 8 minutes. https://www.youtube.com/watch?v=4ht22ReBjno
* CNCF End User: With Kubernetes, the U.S. Department of Defense Is Enabling DevSecOps on F-16s: https://www.youtube.com/watch?v=junocIMbc9U

### Miscellaneous
* Some emoji: https://osxdaily.com/2013/04/08/add-emoji-command-line-bash-prompt/
https://loige.co/random-emoji-in-your-prompt-how-and-why/
* OR ASCII Art: https://askubuntu.com/questions/234678/how-to-show-ascii-art-at-the-top-of-the-terminal-when-its-opened


## Discussed structure form Power Point
Docker Part 1
Why Docker & use cases (local development, in a cluster, etc.), understanding
default commands: docker run (attach & detach mode), docker ps -a, docker stop, docker rm, docker images, docker pull, docker exec, volumes
Run (tag), network, Image (build, Dockerfile),
Docker Part 2:
Compose (e.g. Milan Kafka Example), Docker CMD vs. Entrypoint, Troubleshooting very Important. Scenario with wrong configs and port mismatch, etc.

Kubernetes Part 1
40K feet view: cluster, orchestrator, etc.  declarative model and desired state, yaml, why pods, namespaces & dns (/etc/host für DNS => Jonathan rdp example), network basics, deployments, services (cluterIP, NodePort, LoadBalancer)

Kubernetes Part 2

Crio-, explain persistence, explain secrets (meaning of key vault), config maps, labels selectors & annotations, rolling updates (Explain zero down time deployment  and corresponding business case). Ingress, Explain DB Schema Change. Liveness vs. readiness probe. Examples Jonathan CLI. Connect with kubeconfig

Logging & Monitoring
Docker & Kubernetes Logs, explain difference between metric & logs, (e.g. ingress dashboard), UC from project: email for end customer
HELM 
