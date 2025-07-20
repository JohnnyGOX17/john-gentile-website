---
title: Distributed Computing
layout: default
kb: true
top-category: Software Engineering
comments: true
---

Architectures and design patterns for systems that are data intensive, as well as distributed computing systems. For a great overview, and impetus for AWS, see [Amazon's Distributed Computing Manifesto](https://www.allthingsdistributed.com/2022/11/amazon-1998-distributed-computing-manifesto.html).
![amazon distributed computing Manifesto diagram](https://www.allthingsdistributed.com/images/dcm-workflow-hi-res.jpg)

## Application Programming Interfaces (APIs)

* [public-apis/public-apis](https://github.com/public-apis/public-apis)
* [gRPC](https://grpc.io/)
* [ØMQ (ZeroMQ) - The Guide](https://zguide.zeromq.org/)

### Debug/Tools

`curl` can be used to debug REST APIs like:
* Displaying response and headers with `$ curl -v http://www.example.com/api/ping`
* PUT method with `$ curl -X PUT -d 'name=Sugar&category_id=3' http://www.example.com/api/products`
* Use authentication with a token like `$ curl -H "Authorization: Bearer b1094abc0-54a4-3eab-7213-877142c33fh3" http://example.com/api/resource`
* Show the HTTP response code with `$ curl -I http://www.example.com/`
* And much, much more like in [everything curl](https://everything.curl.dev/)


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


## High-Performance Network Programming

* [ ] [Data Plane Development Kit (DPDK)](https://www.dpdk.org/)
* [ ] [How to receive a million packets per second](https://blog.cloudflare.com/how-to-receive-a-million-packets/)
* [ ] [High Performance Browser Networking by Ilya Grigorik](https://hpbn.co/)
* [ ] [A Cloud-Optimized Transport Protocol for Elastic and Scalable HPC - Paper on AWS Scalable Reliable Datagram (SRD)](https://assets.amazon.science/a6/34/41496f64421faafa1cbe301c007c/a-cloud-optimized-transport-protocol-for-elastic-and-scalable-hpc.pdf)

### Packet FEC in lieu of Retransmission

When latency is key (can't wait/block for packet loss) in lossy networks (e.x. WAN, intermittent links, etc.), Forward Error Correction (FEC) techniques (similar to those used at the physical layer) can be applied at the network layer. For instance in [SD-WAN FEC](https://live.paloaltonetworks.com/t5/prisma-sd-wan-articles/prisma-sd-wan-forward-error-correction/ta-p/554608), lost packets can be recovered on a link by sending extra "parity" packets for every $N$ packets. See [more details on Information Theory](../math_and_signal_processing/info_theory.html).



## References

* [ ] [Designing Data-Intensive Applications](https://dataintensive.net/)
  + [ept/ddia-references](https://github.com/ept/ddia-references)
* [ ] [Fly.io Gossip Glomers](https://fly.io/dist-sys/): a series of distributed systems challenges
  + [Solving distributed systems challenges in Rust - YouTube](https://www.youtube.com/watch?v=gboGyccRVXI)
* [Readings in Database Systems, 5th Edition](http://www.redbook.io/)
* [Mastering Chaos - A Netflix Guide to Microservices - YouTube](https://www.youtube.com/watch?v=CZ3wIuvmHeM)
* [Google - Site Reliability Engineering](https://sre.google/books/)
* [The Amazon Builders Library](https://aws.amazon.com/builders-library/)
* [Time, Clocks and the Ordering of Events in a Distributed System - Microsoft Research](https://www.microsoft.com/en-us/research/publication/time-clocks-ordering-events-distributed-system/)
* [Foundational distributed systems papers](http://muratbuffalo.blogspot.com/2021/02/foundational-distributed-systems-papers.html)
* [MIT 6.824 Distributed Systems (Spring 2020) - YouTube](https://www.youtube.com/playlist?list=PLrw6a1wE39_tb2fErI4-WkMbsvGQk9_UB)
* [JohnCrickett/SystemDesign: Useful resources on distributed system design.](https://github.com/JohnCrickett/SystemDesign)
* [theanalyst/awesome-distributed-systems: A curated list to learn about distributed systems](https://github.com/theanalyst/awesome-distributed-systems)
* [onurakpolat/awesome-bigdata: A curated list of awesome big data frameworks, ressources and other awesomeness.](https://github.com/onurakpolat/awesome-bigdata)
* [Testing Distributed Systems- Curated list of resources on testing distributed systems](https://asatarin.github.io/testing-distributed-systems/)
* [Fallacies of distributed computing - Wikipedia](https://en.wikipedia.org/wiki/Fallacies_of_distributed_computing)
* [The Architecture of Open Source Applications](https://www.aosabook.org/en/index.html)
* [System Design Interview - YouTube](https://www.youtube.com/c/SystemDesignInterview)
* [You Want Modules, Not Microservices](http://blogs.newardassociates.com/blog/2023/you-want-modules-not-microservices.html)
* [Death By a Thousand Microservices](https://renegadeotter.com/2023/09/10/death-by-a-thousand-microservices.html)
* [Database Fundamentals](https://tontinton.com/posts/database-fundementals/)
* [15-445/645 Intro to Database Systems (Fall 2019) - YouTube](https://www.youtube.com/playlist?list=PLSE8ODhjZXjbohkNBWQs_otTrBTrjyohi)
