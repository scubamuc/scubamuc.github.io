# Setup Nginx Proxy Manager in LXC

<https://github.com/ej52/proxmox-scripts/tree/main/lxc/nginx-proxy-manager>

Using NGINX Proxy Manager for configuring your reverse proxy has a couple of advantages:
 + Simple setup
 + Easy maintenance
 + Easy certificate management
 + GUI in Browser

## Requirements ##
This script should work on *Debian* and *Ubuntu* according to the [description](https://github.com/ej52/proxmox-scripts/tree/main/lxc/nginx-proxy-manager), but Alpine Linux works fine and has a very small footprint.

## Procedure ##
1. create *Alpine Linux 3.xx.0* container
2. ensure  (_IP from DHCP_) [Bridged network](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/LXD-LXC-bridged-network.md)
3. configure router to ensure static IP from DHCP, forward port 80 and port 443
4. access container using LXC-shell
5. update and upgrade *Alpine Linux 3.xx.0*
6. run installation script:

   ```
   wget --no-cache -qO - https://raw.githubusercontent.com/ej52/proxmox/main/lxc/nginx-proxy-manager/setup.sh | sh
   
   ```
7. access **Nginx Proxy Manager** admin panel (*IP.OF.SERVER:**81***) using local browser

   ```
   User: admin@example.com 
   Pass: changeme
   
   ```
8. Change user and password as requested.

----

## NGINX Proxy Manager configuration for [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap)

1. Get your certificates in the tab *SSL Certificates*

![grafik](https://user-images.githubusercontent.com/54933878/203948256-a7d0a63d-a5a8-4317-bc0d-a352237cbd20.png)

2. Add a new *Proxy Host* for your machine

![grafik](https://user-images.githubusercontent.com/54933878/203948648-ce03c4a9-22d5-498c-8a05-82ea62778156.png)

3. *Advanced* settings for *Proxy Host* may be necessary

![grafik](https://user-images.githubusercontent.com/54933878/208299781-930c748e-d411-42a4-811e-f2ccc4fa41b6.png)

For [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap) the following settings will work (copy & past & save)

```
location = /.well-known/carddav {return 301 $scheme://$host:$server_port/remote.php/dav;}
location = /.well-known/caldav {return 301 $scheme://$host:$server_port/remote.php/dav;}
```
----

## * Edit Nextcloud-snap config.php

edit the config.php by hand:

```
sudo nano /var/snap/nextcloud/current/nextcloud/config/config.php. 
```
add the following lines:

```
  'trusted_proxies' => 
  array (
    0 => '192.168.2.xxx',
    1 => '192.168.2.xxx',
  ),
  
```

