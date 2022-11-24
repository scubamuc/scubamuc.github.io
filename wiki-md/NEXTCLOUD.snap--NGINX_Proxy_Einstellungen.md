# NGINX Proxy Manager Settings

## For Nextcloud-snap

[config.ph](http://config.ph)p\`

1.  Setup NGINX Proxy Manager
2. Get SSL Certificates from LetsEncrypt
3. Add Proxy Host
4. Add advanced settings
5. Edit Nextcloud-snap `config.php`

![grafik (3).png](.attachments.20252923/grafik%20%283%29.png)  
![grafik (4).png](.attachments.20252923/grafik%20%284%29.png)  
![grafik (5).png](.attachments.20252923/grafik%20%285%29.png)**Proxy Host "advanced" settings:**

```
nano /etc/nginx/sites-enabled/vhost.conf

location = /.well-known/carddav {
      return 301 $scheme://$host:$server_port/remote.php/dav;
}
location = /.well-known/caldav {
      return 301 $scheme://$host:$server_port/remote.php/dav;
}
```

# Nextcloud.snap -- edit config.php

edit the config.php by hand:

```
sudo nano /var/snap/nextcloud/current/nextcloud/config/config.php. 
```

## trusted proxy hinzufügen

```
'trusted_proxies' => 
  array (
    0 => '192.168.2.xxx',
    1 => '192.168.2.xxx',
```

---

# Weiterleitung von CalDAV und CardDAV über Reverse Proxy Server an Nextcloud

30\. September 2020 / [Nextcloud](https://www.schreiners-it.de/category/nextcloud/) / Von [Lucas Schreiner](https://www.schreiners-it.de/author/lucas/ "Alle Beiträge von Lucas Schreiner ansehen")

## ![](https://www.schreiners-it.de/wp-content/uploads/2020/09/Unbenannt.jpg)