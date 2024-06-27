---
title: Data Intensive Software Architecture
layout: default
kb: true
top-category: Software Engineering
comments: true
---

Architectures and design patterns for systems that are data intensive, as well as distributed computing systems.

## Software Architecture Models for High-Performance Computing (HPC)

Also see [Software Design for Performance](./sw_for_performance.md).

- [ ] [Staged Event-Driven Architecture - Wikipedia](https://en.wikipedia.org/wiki/Staged_event-driven_architecture)
  * [Directed Acyclic Graph (DAG)](https://en.wikipedia.org/wiki/Directed_acyclic_graph)
- [ ] [The LMAX Architecture - Martin Fowler](https://martinfowler.com/articles/lmax.html): ring buffer/queue model to allow concurrency without needing locks


## Virtualization and Containers

### Virtual Machines (VM)

* [Qemu](http://wiki.qemu-project.org/Main_Page)
* [VirtualBox](https://www.virtualbox.org/wiki/VirtualBox)

### Containers

* [Docker](https://www.docker.com/)
* [wsargent/docker-cheat-sheet](https://github.com/wsargent/docker-cheat-sheet)

#### Other Docker commands

* Restart last container created: `docker start $(docker ps -q -l)`
  + Reattach terminal & stdin to last: `docker attach $(docker ps -q -l)`
* List currently running Docker instances: `docker ps -a`
* Stop all containers: `docker kill $(docker ps -q)`
* Remove all containers: `docker rm $(docker ps -a -q)`
* Remove all docker images: `docker rmi $(docker images -q)`

### References

* [Cloud Native Patterns](https://www.manning.com/books/cloud-native-patterns)
* [Docker in Practice](https://www.manning.com/books/docker-in-practice)
* [Kubernetes in Action](https://www.manning.com/books/kubernetes-in-action)


## Cloud

### Amazon Web Services (AWS)

- [ ] [open-guides/og-aws](https://github.com/open-guides/og-aws)
- [ ] [AWS Samples & Projects - GitHub](https://github.com/aws-samples)
    + [Build a Serverless Web Application - Getting Started with AWS](https://aws.amazon.com/getting-started/hands-on/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/)
    + [Build a WordPress Website - Getting Started with AWS](https://aws.amazon.com/getting-started/hands-on/build-wordpress-website/)

## References

* [Designing Data-Intensive Applications](https://dataintensive.net/)
  + [ept/ddia-references](https://github.com/ept/ddia-references)
* [Code Complete: A Practical Handbook of Software Construction, 2nd Edition](https://www.amazon.com/code-complete-practical-handbook-construction/dp/0735619670)
* [public-apis/public-apis](https://github.com/public-apis/public-apis)

