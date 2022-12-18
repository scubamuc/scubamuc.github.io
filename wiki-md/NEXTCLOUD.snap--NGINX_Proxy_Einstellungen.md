# NGINX Proxy Manager Settings for [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap)

### * [Setup NGINX Proxy Manager](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/LXD-LXC-NGINX_Proxy_Manager.md) on LXD/LXC
### * Get SSL Certificates from LetsEncrypt
### * Add Proxy Host
### * Add advanced settings


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
----
