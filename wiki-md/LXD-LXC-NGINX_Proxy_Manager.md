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
9. [Settings for Nextcloud-snap](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--NGINX_Proxy_Settings.md)
