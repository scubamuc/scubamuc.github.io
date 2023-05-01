<h1 align="center">SCUBA's self-hosted Nextcloud-snap server</h1>

<p align="center" width="100%">
    <img width="33%" src="https://avatars.githubusercontent.com/u/54933878?s=400&u=31132eb8a567528f005143a0d339174848a06df8&v=4" alt="scubamuc">
</p>

for a self-hosted [Nextcloud](https://nextcloud.com/) I turned to [Ubuntu Server](https://ubuntu.com/download/server) and [LXD](https://linuxcontainers.org/lxd/) to create an [LXC-container](https://linuxcontainers.org/lxc/) for [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap). There is a great community behind Nextcloud-snap and support is fantastic. The greatness of Linux together with supported hardware enables anyone to run a 24/7 Nextcloud server. 

My goal is a simple safe and reliable setup with ample resources for 5+ family users, affordable, efficient and low maintenence. My day job is software support for a leading WMS. I'm an avid scuba diver and enjoy Linux and FOSS. I'm a dad and husband thus I'm not keen on spending much of my free time doing server-maintenence.

---
# 1. System specs

## 1.1 Hardware
**Requirements:**
* Affordable, efficient, small 
* Low [energy footprint](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/SYSTEM--calculate_power_consumption.md)
* Linux compatible
* Ample resources  - (_5+ users_)
* Install and forget - (_uptime 24/7_)
* Redundancy - (_failover, cold-standby & backup_)
* Multiple services - (_Nextcloud, Webserver, FW, VPN, DNS, Proxy_)

----
>**2x Lenovo ThinkCentre M92p Tiny (_refurbished_) - stackable 1xServer & 1xBackup** 
>  * CPU: Intel Core i5-3470T
>  * PSU: 16W/12W load/idle
>  * RAM: 16GB
>  * SSD: 500GB
> <img src="https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/images/m92p-stacked%230.png" width="400">
----

## 1.2 OS & Software
**Requirements:**
* [Ubuntu Server](https://ubuntu.com/download/server) (_easy setup & administration, unattended updates & updgrades_)
* [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap) (_easy setup & automated updates_)
* [LXD-server manager](https://linuxcontainers.org/lxd/getting-started-cli/#installing-a-package) (_multiple LXC-containers_)
   * [LXDMosaic](https://github.com/turtle0x1/LxdMosaic#-lxdmosaic) LXD-server management GUI
* Packages:
 `cockpit, htop, lnav, mc, openssh-server, sysstat`
* Snaps: 
 `nextcloud, lxd, lxdmosaic,`

### LXD-server setup
* [Bridged network](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/LXD-LXC-bridged-network.md) (_IP from DHCP_)
* Multiple LXC-containers (_Nextcloud, Webserver, FW, VPN, DNS, Proxy_)
* [Scripted](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/Readme.md#backup-nextcloud-snap-with-snap-snapshot) automatic rotating snapshots (_daily_) **0 downtime 24/7**
* [Scripted](https://github.com/scubamuc/scubamuc.github.io#33-lxc-container-snapshot--backup--restore) automatic synchronisation to LXD-backup-server (_weekly_)
* [Scripted](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/Readme.md#backup-nextcloud-snap-with-nextcloudexport) automatic rotating backup to NAS (_monthly_)

### LXD-backup-server setup
* Identical setup to LXD-server -- cold-standby
* [Bridged network](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/LXD-LXC-bridged-network.md) (_IP from DHCP_)
* Multiple *synchronized* LXC-containers (_Nextcloud, Webserver, FW, VPN, DNS, Proxy_)
* WOL `ctr-wake` (_weekly_) synchronisation
* WOL (_manual_) failover

----
# 2. Procedure

## 2.1 Install Nextcloud-snap in LXC-container on LXD-server

* Prepare [LXD-server](https://linuxcontainers.org/lxd/getting-started-cli/#installing-a-package) with [Ubuntu Server](https://ubuntu.com/download/server)  and [bridged network](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/LXD-LXC-bridged-network.md)
* Prepare [LXC-container](https://ubuntu.com/server/docs/containers-lxc) with [Ubuntu Server](https://ubuntu.com/download/server)
* Install [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap) in LXC-container
* Set [FQDN](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--set_FQDN.md) in `/etc/hosts` in LXC-container
* Nextcloud-snap handles [Lets-Encrypt certificate](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--LetsEncrypt_wiki.md#enable-letsencrypt-in-nextcloud-snap) automatically with `nextcloud.enable-https lets-encrypt` 
    * *optionally* handle certificates with [reverse Proxy](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Putting-the-snap-behind-a-reverse-proxy) or [NGINX-Proxy-Manager](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--NGINX_Proxy_Settings.md#nginx-proxy-manager)
* Configure Nextcloud and regain control over your data

----
# 3. Export, Import -- Backup, Restore

## 3.1 Nextcloud-snap export & import

### Export Nextcloud-snap with nextcloud.export
* nextcloud.export
* compress export
* move/copy compressed export from backup directory: `/var/snap/nextcloud/common/backups` to wherever
* remove old exports from directory

This works fine as weekly automatic cronjob (as root) and for random backups. Compressed backup may be moved wherever. 0 downtime.

[rotating Nextcloud-snap export script](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--backup_nextcloud-export.md)

## Restore export using nextcloud.import

* when moving to new device, be sure to install nextcloud-snap first
* nextcloud.import replaces previous installation incl. DB and data

1\. copy/move compressed export file to restore directory: `/var/snap/nextcloud/common`

2\. uncompress export file in restore directory: `/var/snap/nextcloud/common`

3\. issue command `$ sudo nextcloud.import /var/snap/nextcloud/common/...`

----
## 3.2 Nextcloud-snap snapshot & restore

### Backup Nextcloud-snap with Snap snapshot

[snapshot documentation](https://snapcraft.io/docs/snapshots)
* snap stop nextcloud 
* snap save nextcloud 
* snap start nextcloud 
* find snapshot in `/var/lib/snapd/snapshots` and copy/move to wherever

This works fine as weekly automatic cronjob (as root) and has the added convenience of easy snap transfer to different server when needed. Thus always 4 weeks of snap-snapshots on backup media. Downtime depends on resources and data.

[rotating Nextcloud-snap Snap snapshot script](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--backup_snap-snapshot.md)

## Restore Snap snapshot using Snap restore 

* when moving to new device, be sure to install nextcloud-snap first
* snap restore replaces previous installation incl. certs, DB and data
* see documentation in `man snap` and [snapcraft](https://snapcraft.io/docs/snapshots#heading--restoring)

1\. copy compressed file (\*.zip) from backup media to `/var/lib/snapd/snapshots`

2\. discover snapshot-ID using `snap saved`

3\. issue command `sudo snap restore "snapshot-ID"` 

----
## 3.3 LXC container snapshot / backup & restore

#### Backup LXC container with snapshot/image & restore in shell [scripted](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/bash-scripts/LXC-ContainerBackup.sh) or GUI [LXDMosaic](https://github.com/turtle0x1/LxdMosaic#-lxdmosaic)

![grafik](https://user-images.githubusercontent.com/54933878/216815478-9a58192c-b769-487d-b781-09593a4ec2c9.png)

* LXC container snapshot [scripted](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/bash-scripts/LXC-ContainerBackup.sh) or GUI [LXDMosaic](https://github.com/turtle0x1/LxdMosaic#-lxdmosaic)
* LXC container image from snapshot [scripted](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/bash-scripts/LXC-ContainerBackup.sh) or GUI [LXDMosaic](https://github.com/turtle0x1/LxdMosaic#-lxdmosaic)
* LXC image copy/move to wherever
* LXC image rotate [scripted](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/bash-scripts/LXC-ContainerBackup.sh) or GUI [LXDMosaic](https://github.com/turtle0x1/LxdMosaic#-lxdmosaic)

This works fine as [scripted](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/bash-scripts/LXC-ContainerBackup.sh) cronjob or [LXDMosaic](https://github.com/turtle0x1/LxdMosaic#-lxdmosaic) schedule. 0 downtime.

[rotating LXC container snapshot script](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/bash-scripts/LXC-ContainerBackup.sh)

#### Restore LXC container in shell or GUI [LXDMosaic](https://github.com/turtle0x1/LxdMosaic#-lxdmosaic)

* `lxc image import $PATH/to/$IMAGENAME.tar.gz --alias $IMAGENAME`
* `lxc launch $IMAGENAME $CONTAINERNAME`

----
