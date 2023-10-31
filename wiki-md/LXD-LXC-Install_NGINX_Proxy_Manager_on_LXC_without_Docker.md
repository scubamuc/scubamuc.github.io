# Install NGINX Proxy Manager in LXC container without Docker

Some folks prefer to install NGINX Proxy Manager in an LXC container on LXD or Proxmox without Docker. Although its possible to install and use Docker in LXC it requires configuration overhead, so its easier launching an Ubuntu container in LXC and installing NGINX Proxy Manager using an [install script](https://github.com/ej52/proxmox-scripts/blob/main/lxc/nginx-proxy-manager/README.md). There are some caveats though. NGINX Proxy Manager Updates are tedious and may require reediting the `nginx.conf`.

## Procedure

* Create/launch *Ubuntu* LXC container
* Ensure  (*IP from DHCP*) [Bridged network](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/LXD-LXC-bridged-network.md)
* Configure router to ensure static IP from DHCP, forward port 80 and port 443
* Access container as root using LXC-shell
* Update and upgrade 
* Add users 
* Launch setup script
* Configure NGINX
* Configure services
----

#### Update and upgrade
```
apt update && apt full-upgrade
```

#### Add **nginx** and **npm** *system* users

```
 useradd -s /bin/false nginx
 useradd -s /bin/false npm
```

#### Launch nginx-proxy-manager LXC setup script:

```
wget --no-cache -qO - https://raw.githubusercontent.com/ej52/proxmox/main/lxc/nginx-proxy-manager/setup.sh | sh
```

#### Configure NGINX

* Edit `/etc/nginx/nginx.conf`:
  ```
  nano /etc/nginx/nginx.conf
  ```

* Disable line containing:
  ```
  /var/run/nginx.pid
  ```

#### Enable services: 
```
systemctl enable openresty
systemctl enable npm
```  
#### Start services: 
  ```
systemctl start openresty
systemctl start npm
```
    
#### Access **Nginx Proxy Manager** admin panel (*IP.ADDRESS.OF.SERVER:**81***) using local browser

```
http://ip.address.of.server
User: admin@example.com 
Pass: changeme
```

#### Change user and password as requested.

[Settings for Nextcloud-snap](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--NGINX_Proxy_Settings.md)

----

### Updating Nginx Proxy Manager

 #### Update and upgrade you OS
```
apt update && apt full-upgrade
```

#### Run nginx-proxy-manager LXC setup script again to upgrade existing installation

```
wget --no-cache -qO - https://raw.githubusercontent.com/ej52/proxmox/main/lxc/nginx-proxy-manager/setup.sh | sh
```

#### Reconfigure NGINX 

* Edit `/etc/nginx/nginx.conf`:
  ```
  nano /etc/nginx/nginx.conf
  ```

* Disable line containing:
  ```
  /var/run/nginx.pid
  ```
  
#### Restart services: 
  ```
systemctl restart openresty
systemctl restart npm
```
