<h1 align="center">SCUBA's self-hosted Nextcloud-snap server</h1>

<p align="center" width="100%">
    <img width="33%" src="https://avatars.githubusercontent.com/u/54933878?s=400&u=31132eb8a567528f005143a0d339174848a06df8&v=4" alt="scubamuc">
</p>

for a self-hosted [Nextcloud](https://nextcloud.com/) I turned to [Ubuntu Server](https://ubuntu.com/download/server) and [LXD](https://linuxcontainers.org/lxd/getting-started-cli/#installing-a-package) to create an [LXC-container](https://ubuntu.com/server/docs/containers-lxc) for [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap). There is a great community behind Nesxtcloud-snap and support is fantastic. The greatness of Linux together with supported hardware enables anyone to run a 24/7 nextcloud server. 

I'm neither a Linux crack nor an admin... so my goal is a simple safe and reliable setup with ample ressources for 5 family users, low cost, low energy footprint and low maintenence. My day job is software support for a leading WMS. I'm an avid scuba diver and enjoy Linux and FOSS. I'm a dad and husband thus I'm not keen on spending my free time doing server-maintenance.

---
# 1. System specs

## 1.1 Hardware
**Requirements:**
* affordable (refurbished)
* good ressources, [low energy footprint](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/SYSTEM--calculate_power_consumption.md)
* install and forget, uptime 24/7
* redundancy, failover and backup
* up to 5 users
* multiple services (Nextcloud, FW, VPN, DNS, Proxy)

>**2x Lenovo ThinkCentre M92p Tiny**
>  * CPU: Intel Core i5-3470T
>  * PSU: [16W/12W load/idle](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/SYSTEM--calculate_power_consumption.md)
>  * RAM: 16GB
>  * SSD: 500GB

* stackable redundant 1xServer & 1xBackup

<img src="https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/images/m92p-stacked%230.png" width="400">

## 1.2 OS & Software
**Requirements:**
* [Ubuntu Server](https://ubuntu.com/download/server) (_easy setup & administration, automated updates & updgrades_)
* [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap) (_easy setup & automated updates_)
* [LXD-Server manager](https://linuxcontainers.org/lxd/getting-started-cli/#installing-a-package) (_multiple LXC containers_)
* Installed Packages:
 `htop, lnav, mc, openssh-server, sysstat, cockpit`
* Installed Snaps: 
 `lxd, lxdmosaic,`

### LXD-Server setup
* Bridged network (_IP from DHCP_)
* Multiple LXC-Containers (Nextcloud, FW, VPN, DNS, Proxy)
* [Scripted](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/Readme.md#backup-nextcloud-snap-with-snap-snapshot) automatic rotating snapshots (daily) **0 downtime 24/7**
* Scripted automatic synchronisation to LXD-Backup-Server (weekly)
* [Scripted](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/Readme.md#backup-nextcloud-snap-with-nextcloudexport) automatic rotating Backup to NAS (monthly)

### LXD-Backup-Server setup
* Identical setup to LXD-Server -- cold standby
* Bridged network (_IP from DHCP_)
* Multiple *synchronized* LXC-Containers (Nextcloud, FW, VPN, DNS, Proxy)
* WOL `ctr-wake` (weekly) synchronisation
* WOL *manual* failover

----
# 2. Procedure

## 2.1 Install Nextcloud-snap container on LXD-Server

* prepare [LXD-Server](https://linuxcontainers.org/lxd/getting-started-cli/#installing-a-package) with bridged Networking
* prepare [LXC-Container](https://ubuntu.com/server/docs/containers-lxc) with [Ubuntu-Server](https://ubuntu.com/download/server)
* install [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap) in LXC-Container
* install (optional) packages in LXC-Container

 1. `sudo apt uptade && sudo apt upgrade` 
 2. `sudo snap install nextcloud`
 3.  follow instructions: [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap)
 4.  (optional) `sudo apt install htop lnav mc openssh-server openssh-sftp-server rclone sshfs sysstat`

* set FQDN in `/etc/hosts` in Nextcloud-snap container
```
127.0.0.1       localhost
127.0.1.1       your.domain.xyz SERVERNAME

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```
* See helpful notes in my [personal wiki](https://github.com/scubamuc/scubamuc.github.io/tree/scubamuc/wiki-md)
* See helpful bash-scripts in my [script repo](https://github.com/scubamuc/scubamuc.github.io/tree/scubamuc/bash-scripts)

----
# 3. Export, Import -- Backup, Restore

## 3.1 Nextcloud-snap export & import

### Backup Nextcloud-snap with nextcloud.export
* nextcloud.export
* compress backup
* move compressed backup
* remove old backups from directory

This works fine as weekly automatic (cronjob as root) job and for random backups. Compressed backup may be moved wherever.

[Nextcloud-snap Export](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--backup_nextcloud-export.md) may be scripted

## Restore export using nextcloud.import

* when moving to new device, be sure to install nextcloud-snap first
* nextcloud.import replaces previous installation incl. DB and data

1\. copy/move compressed backup file to `/var/snap/nextcloud/common`

2\. uncompress backup file in `/var/snap/nextcloud/common`

3\. issue command ` $ sudo nextcloud.import PATH TO DIRECTORY`

----
## 3.2 Nextcloud-snap snapshot & restore

### Backup Nextcloud-snap with Snap snapshot

[snapshot documentation](https://snapcraft.io/docs/snapshots)
* snap stop nextcloud
* snap save nextcloud
* snap start nextcloud
* find snapshot in `/var/lib/snapd/snapshots` and move to wherever

This works fine as weekly automatic (cronjob as root) job and has the added convenience of easy snap transfer to different server when needed. thus always 4 weeks of snap-snapshots on backup media.

[Nextcloud-snap Snap snapshot](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--backup_snap-snapshot.md) may be scripted

## Restore Snap snapshot using Snap restore 

* when moving to new device, be sure to install nextcloud-snap first
* snap restore replaces previous installation incl. certs, DB and data
* see documentation in `man snap` and [snapcraft](https://snapcraft.io/docs/snapshots#heading--restoring)

1\. copy \*.zip from backup media to `/var/lib/snapd/snapshots`

2\. discover snapshot-ID using `snap saved`

3\. issue command `sudo snap restore "snapshot-ID"`

----
