# NGINX Proxy Manager

[Install NGINX Proxy Manager in LXD/LXC container](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/LXD-LXC-install-NGINX_Proxy_Manager.md)

![grafik](https://user-images.githubusercontent.com/54933878/203948648-ce03c4a9-22d5-498c-8a05-82ea62778156.png)


## NGINX Proxy Manager configuration for Nextcloud-snap

#### 1. Add a new *Proxy Host* 

![grafik](https://user-images.githubusercontent.com/54933878/219947858-9756dc45-1c29-4145-b8c4-cc080b4147d1.png)

----
#### 2. Get your *SSL Certificate*

![grafik](https://user-images.githubusercontent.com/54933878/219947921-f4373ba0-3e3b-4f35-92e5-d894da396a1e.png)

----
#### 3. *Advanced* settings for Nextcloud-snap

![grafik](https://user-images.githubusercontent.com/54933878/219947752-5886d1a8-c7e0-4a82-9e31-7b72ba865b3f.png)

copy & paste in advanced settings
```
location = /.well-known/carddav {return 301 $scheme://$host:$server_port/remote.php/dav;}
location = /.well-known/caldav {return 301 $scheme://$host:$server_port/remote.php/dav;}
```
----
### Configure Nextcloud-snap

edit the config.php by hand:

```
sudo nano /var/snap/nextcloud/current/nextcloud/config/config.php. 
```
add the following lines:

```
  'trusted_proxies' => 
  array (
    0 => 'your.nginx.proxy.ip',
   ),
  
```
----
