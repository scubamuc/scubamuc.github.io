# FQDN for Nextcloud snap on internet facing instance

Setting FQDN (fully qualified domain name) is **best practice** and is **optional** on self-hosted internet facing Nextcloud snap instance and may improve site response. 

* Discover hostname: 
  - issue command `$ hostnamectl` or `$ hostname`

* Set or change hostname: 
  - issue command `$ hostnamectl set-hostname NEW-HOSTNAME`

* Set FQDN on internet facing device: 
  - edit `/etc/hosts` on internet facing host using your favourite editor as root `$ sudo nano /etc/hosts` and add second line replacing `<your.domain.xyz>` and `<hostname>` with your own **domain name** and **hostname**:
```
127.0.0.1       localhost
127.0.1.1       your.domain.xyz hostname

## The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```

or per command:
```
$ sudo sed -i '2i\127.0.1.1       your.domain.xyz SERVERNAME\' /etc/hosts
```

# FQDN for Nextcloud snap instance, vm or container behind reverse proxy with termination

Setting FQDN (fully qualified domain name) is **best practice** and is **optional** on self-hosted Nextcloud snap instances running on vm or container behind reverse proxy **with termination** and may improve site response. 

* Discover hostname: 
  - issue command `$ hostnamectl` or `$ hostname`

* Set or change hostname: 
  - issue command `$ hostnamectl set-hostname NEW-HOSTNAME`

* Set FQDN on instance behind reverse proxy **with** termination: 
  - edit `/etc/hosts` in vm or container using your favourite editor as root `$ sudo nano /etc/hosts` and add second line
 replacing `<your.reverse.proxy.ip> <your.domain.xyz>` and `<hostname>` with your own **domain name** and **hostname**:

```
127.0.0.1       localhost
your.reverse.proxy.ip       your.domain.xyz hostname

## The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```
