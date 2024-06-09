---
title: Networking & Administration
layout: default
kb: true
top-category: Computer Architecture and Systems
comments: true
---

## Common Network Admin Tasks

### Routing

* Manually map an alias/hostname to an IP address by adding to `/etc/hosts` file, like:
```
192.168.56.4    mylinuxbox
```

### SSH

* [How to Configure SSH Key-based authentication on a Linux Server](https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server)
* [How to Protect SSH with `fail2ban` on Ubuntu 22.04](https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-fail2ban-on-ubuntu-22-04)
  * [Configure Fail2Ban for permanent and persistent bans](https://arno0x0x.wordpress.com/2015/12/30/fail2ban-permanent-persistent-bans/)

#### SSH Tunneling

[SSH Tunneling](https://www.ssh.com/academy/ssh/tunneling) can be used to forward certain ports or services over a secure SSH connection. It's also useful if a local system wants to expose non-SSH services but only has an SSH port open externally through a router. For example, to tunnel Remote Desktop (RDP) to a remote server `<remote>`:
```sh 
$ ssh -L 8888:localhost:3389 <username>@<remote>
```

You can then connect to the RDP session with `localhost:8888`.

### Basic Python Web Server

If you have some static web resources (e.g. HTML pages, etc.), you can quickly spin-up a web server in that directory to display them using Python(3):

`$ python -m http.server <port_number>`


## Virtualization and Distributed Systems

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


## References

* [Red Hat Enterprise Linux 7 System Administrator's Guide](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/System_Administrators_Guide/index.html)
* [Apache Performance Tuning](http://httpd.apache.org/docs/2.4/misc/perf-tuning.html)
* [List of PHP Accelerators](https://en.wikipedia.org/wiki/List_of_PHP_accelerators)
* [public-apis/public-apis](https://github.com/public-apis/public-apis)

