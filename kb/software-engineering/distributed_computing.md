---
title: Distributed Computing
layout: default
kb: true
top-category: Software Engineering
comments: true
---

Architectures and design patterns for systems that are data intensive, as well as distributed computing systems. For a great overview, and impetus for AWS, see [Amazon's Distributed Computing Manifesto](https://www.allthingsdistributed.com/2022/11/amazon-1998-distributed-computing-manifesto.html).
![amazon distributed computing Manifesto diagram](https://www.allthingsdistributed.com/images/dcm-workflow-hi-res.jpg)

## Virtualization and Containers

### Virtual Machines (VM)

* [Qemu](http://wiki.qemu-project.org/Main_Page)
* [VirtualBox](https://www.virtualbox.org/wiki/VirtualBox)

### Containers

* [Docker](https://www.docker.com/)
* [wsargent/docker-cheat-sheet](https://github.com/wsargent/docker-cheat-sheet)

#### Useful Docker Commands

* Restart last container created: `docker start $(docker ps -ql)`
  + Reattach terminal & stdin to last: `docker attach $(docker ps -ql)`
* List currently running Docker instances: `docker ps -a`
* Stop all containers: `docker kill $(docker ps -aq)`
* Delete all containers, including its volumes they use: `docker rm -vf $(docker ps -aq)`
* Delete all docker images: `docker rmi -f $(docker images -aq)`
  + **NOTE:** you should remove all containers before removing all the images from which the containers were created.
* Delete _everything_ (removing all unused containers, volumes, networks, images, etc.) and reclaim disk space (essentially remove everything!), use: `docker system prune -a --volumes`

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


## High-Performance Network Programming

* [ ] [Data Plane Development Kit (DPDK)](https://www.dpdk.org/)
* [ ] [How to receive a million packets per second](https://blog.cloudflare.com/how-to-receive-a-million-packets/)
* [ ] [High Performance Browser Networking by Ilya Grigorik](https://hpbn.co/)
* [ ] [A Cloud-Optimized Transport Protocol for Elastic and Scalable HPC - Paper on AWS Scalable Reliable Datagram (SRD)](https://assets.amazon.science/a6/34/41496f64421faafa1cbe301c007c/a-cloud-optimized-transport-protocol-for-elastic-and-scalable-hpc.pdf)

### Packet FEC in lieu of Retransmission

When latency is key (can't wait/block for packet loss) in lossy networks (e.x. WAN, intermittent links, etc.), Forward Error Correction (FEC) techniques (similar to those used at the physical layer) can be applied at the network layer. For instance in [SD-WAN FEC](https://live.paloaltonetworks.com/t5/prisma-sd-wan-articles/prisma-sd-wan-forward-error-correction/ta-p/554608), lost packets can be recovered on a link by sending extra "parity" packets for every $N$ packets. See [more details on Information Theory](../math_and_signal_processing/info_theory.html).


