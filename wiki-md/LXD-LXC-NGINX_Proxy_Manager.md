# Install NGINX Proxy Manager in LXC container

## Procedure

- create *Ubuntu 22.04* LXC container
- ensure  (*IP from DHCP*) [Bridged network](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/LXD-LXC-bridged-network.md)
- configure router to ensure static IP from DHCP, forward port 80 and port 443
- access container using LXC-shell
- update and upgrade 

```
apt update && apt full-upgrade
```

- add users

```
 useradd -s /bin/false nginx
 useradd -s /bin/false npm
```

- run installation script:

```
wget --no-cache -qO - https://raw.githubusercontent.com/ej52/proxmox/main/lxc/nginx-proxy-manager/setup.sh | sh
```

- edit `/etc/nginx/nginx.conf` file and disable line with `/var/run/nginx.pid`
- enable services: 
  - `systemctl enable openresty`
  - `systemctl enable npm`
- start services: 
  - `systemctl start openresty`
  - `systemctl start npm`
- access **Nginx Proxy Manager** admin panel (*IP.ADDRESS.OF.SERVER:**81***) using local browser

```
http://ip.address.of.server
User: admin@example.com 
Pass: changeme
```

- change user and password as requested.

[Settings for Nextcloud-snap](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--NGINX_Proxy_Settings.md)
