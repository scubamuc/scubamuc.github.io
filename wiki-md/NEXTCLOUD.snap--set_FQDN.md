# Set FQDN for Nextcloud-snap

* set FQDN in `/etc/hosts` in Nextcloud-snap container

edit `/etc/hosts` with your favorite editor as root `$ sudo nano /etc/hosts` and add second line:
```
127.0.0.1       localhost
127.0.1.1       your.domain.xyz SERVERNAME

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
