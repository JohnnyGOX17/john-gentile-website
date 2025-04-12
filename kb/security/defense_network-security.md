---
title: Defense and Network Security
layout: default
kb: true
top-category: Cyber and Security
comments: true
---

## Network Protections

### SSH

* Use [Key-based auth for SSH](https://www.redhat.com/en/blog/key-based-authentication-ssh) to aid in passwordless SSH login/commands- usually as simple as `$ ssh-copy-id <user>@<hostname/IP>`.
  + [How to Configure SSH Key-based authentication on a Linux Server](https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server)
* [How to Protect SSH with `fail2ban` on Ubuntu 22.04](https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-fail2ban-on-ubuntu-22-04)
  * [Configure Fail2Ban for permanent and persistent bans](https://arno0x0x.wordpress.com/2015/12/30/fail2ban-permanent-persistent-bans/)

#### SSH Tunneling

[SSH Tunneling](https://www.ssh.com/academy/ssh/tunneling) can be used to forward certain ports or services over a secure SSH connection. It's also useful if a local system wants to expose non-SSH services but only has an SSH port open externally through a router. For example, to tunnel Remote Desktop (RDP) to a remote server `<remote>`:
```sh 
$ ssh -L 8888:localhost:3389 <username>@<remote>
```

You can then connect to the RDP session with `localhost:8888`.

Also you can forward multiple ports in one connection, for example:
```sh 
$ ssh -L 8888:localhost:8888 -L 8889:localhost:8889 <username>@<remote>
```

## Tools

- [Wireshark](https://www.wireshark.org/): prolific network protocol analyzer, packet capture and traffic visualization tool.

## References

* [Computer Systems Security - MIT OCW](https://www.youtube.com/watch?v=GqmQg-cszw4&list=PLUl4u3cNGP62K2DjQLRxDNRi0z2IRWnNh)
* [Computer Systems Security Group - MIT CSAIL](https://css.csail.mit.edu/)
* [Paged Out! Magazine](https://pagedout.institute/)

