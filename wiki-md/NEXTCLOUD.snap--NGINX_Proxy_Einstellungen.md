# NGINX Proxy Manager Settings for Nextcloud-snap

## 1. Setup NGINX Proxy Manager
## 2. Get SSL Certificates from LetsEncrypt
## 3. Add Proxy Host
## 4. Add advanced settings

**Proxy Host "advanced" settings:**

copy the following lines and paste in advanced settings

```
location = /.well-known/carddav {
      return 301 $scheme://$host:$server_port/remote.php/dav;
}
location = /.well-known/caldav {
      return 301 $scheme://$host:$server_port/remote.php/dav;
}
```
## 5. Edit Nextcloud-snap config.php

edit the config.php by hand:

```
sudo nano /var/snap/nextcloud/current/nextcloud/config/config.php. 
```
add the following lines:

```
  'trusted_proxies' => 
  array (
    0 => '192.168.2.200',
    1 => '192.168.2.10',
  ),
  
```
----
