<h1 align="center">SCUBA's self-hosted Nextcloud-snap server</h1>

<p align="center" width="100%">
    <img width="33%" src="https://www.scubamuc.de/bilder/scubuntu-logo-nogradient-400x400.png" alt="scubamuc">
</p>

For self-hosted [Nextcloud](https://nextcloud.com/) I turned to [Ubuntu Server](https://ubuntu.com/download/server) and [LXD](https://linuxcontainers.org/lxd/getting-started-cli/#installing-a-package) to create an [LXC-container](https://ubuntu.com/server/docs/containers-lxc) for [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap). There's a great community behind Nesxtcloud-snap and support is fantastic. The greatness of Linux together with good hardware enables anyone to run a 24/7 nextcloud server. 

I'm neither a Linux crack nor an admin... so my goal is a simple setup with ample ressources for 5 family users, low cost, low energy footprint and low maintenence. My day job is software support for a leading WMS. I'm an avid scuba diver and enjoy Linux and FOSS.

---
# 1. System specs

## 1.1 Hardware
**Requirements:**
* small, quiet, good ressources, low energy footprint
* install and forget, uptime 24/7
* redundancy, failover and backup
* up to 5 users
* multiple services (Nextcloud, Pihole, NAS, VPN)

>**2x Lenovo ThinkCentre M92p Tiny**
>  * Formfactor: SFF
>  * CPU: Intel Core i5-3470T
>  * PW: 16 Watt TDP
>  * RAM: 16GB
>  * SSD: 500GB

* stackable redundant 1xServer & 1xBackup

<img src="https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc-wiki/m92p-stacked%230.png" width="400">

## 1.2 OS & Software
**Requirements:**
* [Ubuntu Server LTS](https://ubuntu.com/download/server) (_easy setup, easy administration, automated updates & updgrades, automated backup_)
* [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap) (_great community, great support_)
* [LXD-Server manager](https://linuxcontainers.org/lxd/getting-started-cli/#installing-a-package) (_multiple LXC containers_)
* Installed Packages:
 `htop, lnav, mc, openssh-server, sysstat, cockpit`
* Installed Snaps: 
 `lxd, lxdmosaic,`

### LXD-Server setup
* Bridged network (_IP from DHCP_)
* Multiple LXC-Containers (Nextcloud, Pihole, NAS, VPN)
* Scripted automatic rotating snapshots (daily) **0 downtime 24/7**
* Scripted automatic rotating backup to LXD-Backup-Server (weekly) **0 downtime 24/7**

### LXD-Backup-Server setup
* WOL `ctr-wake` (weekly) LXD-Server backup `rsync` & lxdmosaic
* WOL *manual* failover
* Bridged network (_IP from DHCP_)
* Multiple *synchronized* LXC-Containers (Nextcloud, Pihole, NAS, VPN)
* Scripted automatic rotating Backup to NAS (monthly)

----
# 2. Procedure

## 2.1 Install Nextcloud-snap container on LXD-Server

* prepare LXD-Server with bridged Networking
* prepare LXC-Container with Ubuntu-Server 22.04
* install (optional) packages in LXC-Container:

 1. `sudo apt uptade && sudo apt upgrade` 
 2. `sudo snap install nextcloud`
 3.  (optional) `sudo apt install htop lnav mc openssh-server openssh-sftp-server rclone sshfs sysstat`
 4.  follow instructions: https://github.com/nextcloud-snap/nextcloud-snap

* set FQDN in `/etc/hosts` in container
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
----
# 3. Backup, Restore & Export, Import

## 3.1 Nextcloud-snap Export

### Backup Nextcloud-snap with nextcloud.export
* nextcloud.export
* compress backup
* move compressed backup
* remove old backups from directory

This works fine as weekly automatic (cronjob as root) job and for random backups. Compressed backup may be moved wherever.

Nextcloud-snap Export may be scripted, see example below:

**Rotating nextcloud.export script:**

1. create mount directory for media in `/media` or `/mnt`
2. mount media using `/etc/fstab` with option `nofail`
3. snapshots are kept for `30` days
4. save script in `$USER/bin` as `snapbackup.sh` and make executable
5. set preference variables
6. create root-cronjob for weekly execution ( ``` 0 1 * * 0 su $USER /home/$USER/bin/snapbackup.sh ``` )

```
#!/bin/bash
##############################################################
## Nextcloud-snap backup with nextcloud.export -- SCUBA --
##############################################################
## backup directory: '/var/snap/nextcloud/common/backups'
## restore directory: '/var/snap/nextcloud/common'
## backup rotation 30 days
## create crontab as root for automation`
##############################################################
# VARIABLES #
##############################################################
SNAPNAME="nextcloud"
BACKUPNAME="mybackup"
TARGET="/media/SNAPBACKUP" ## target directory
SOURCE="/var/snap/nextcloud/common/backups" ## source directory
RETENTION="30" ## file retention in days
##############################################################
# SCRIPT #
##############################################################
## create backup with nextcloud.export ##
sudo nextcloud.export ; ## nextcloud.export, see options

## find and compress backup directory ##
list=`ls $SOURCE`
for i in $list
do
    if [ ! "$i" == "." ]; then
      sudo tar -czf ${i}-$BACKUPNAME.tar.gz ${i}
    fi
done

## find and move compressed backup file to $TARGET
sudo find $SOURCE/ -name "*.tar.gz" -exec mv '{}' $TARGET/ \;

## find and rotate/delete old backups
sudo find $TARGET/ -name "*.tar.gz" -mtime +$RETENTION -exec rm -f {} \; 

exit

```

#### Restore Nextcloud-snap with nextcloud.import

* when moving to new device, be sure to install Nextcloud-snap first
* nextcloud.import replaces previous installation incl. DB and data

1. copy/move compressed backup file to `/var/snap/nextcloud/common`
2. uncompress backup file in `/var/snap/nextcloud/common`
3. issue command `sudo nextcloud.import "PATH/TO/DIRECTORY `

----
## 3.2 Nextcloud-snap Snapshot

### Backup Nextcloud-snap with Snap snapshot

[snapshot documentation](https://snapcraft.io/docs/snapshots)
* snap stop nextcloud
* snap save nextcloud
* snap start nextcloud
* find snapshot in `/var/lib/snapd/snapshots` and move to wherever

This works fine as weekly automatic (cronjob as root) job and has the added convenience of easy snap transfer to different server when needed. thus always 4 weeks of snap-snapshots on backup media.

Nextcloud-snap Snap snapshot may be scripted, see example below:

**Rotating Nextcloud-snap Snap snapshot script to media incl. logging:**

1. create mount directory for media in `/media` or `/mnt`
2. mount media using `/etc/fstab` with option `nofail`
3. snapshots are kept for `30` days
4. save script in `$USER/bin` as `snapbackup.sh` and make executable
5. set preference variables
6. create root-cronjob for weekly execution  ( ``` 0 1 * * 0 su $USER /home/$USER/bin/snapbackup.sh ``` )

```` 
#!/bin/bash
##############################################################
## Nextcloud-snap backup with Snap snapshot -- SCUBA --
##############################################################
## create target directory "sudo mkdir /media/SNAPBACKUP"
## snapshot rotation 30 days 
## create crontab as root for automation
##############################################################
# VARIABLES #
##############################################################
SNAPNAME="nextcloud"
TARGET="/media/SNAPBACKUP"  ## target directory
LOG="/media/SNAPBACKUP/snapbackup-nc.log"  ## log file
SOURCE="/var/lib/snapd/snapshots" ## source directory
RETENTION="30" ## file retention in days
##############################################################
# FUNCTIONS #
##############################################################
## Timestamp for Log ##
timestamp()
{
 date +"%Y-%m-%d %T"
}
##############################################################
# SCRIPT #
##############################################################
## start log  
echo "********************************************************" >> "$LOG" ; ## log seperator
echo "$(timestamp) -- Snapbackup $SNAPNAME Start" >> "$LOG" ; ## start log

## stop snap for snapshot  
sudo snap stop $SNAPNAME ;
## create snap snapshot 
sudo snap save --abs-time $SNAPNAME ;
## restart snap after snapshot 
sudo snap start $SNAPNAME ;

## find and move snapshot to $TARGET  
sudo find $SOURCE/ -name "*.zip" -exec mv '{}' $TARGET/ \; # find and move
## find old snapshots and delete snapshots older than $RETENTION days
sudo find $TARGET/ -name "*.zip" -mtime +$RETENTION -exec rm -f {} \; # find and delete

## end log 
echo "$(timestamp) -- Snapbackup $SNAPNAME Ende " >> "$LOG" ; ## end log 
echo "" >> "$LOG" ;  ## log linefeed 

exit
````
#### Restore Nextcloud-snap Snap snapshot with snap.restore

* when moving to new device, be sure to install nextcloud-snap first
* snap restore replaces previous installation incl. certs, DB and data
* see documentation in `man snap` and [Snapcraft](https://snapcraft.io/docs/snapshots#heading--restoring)

1. copy *.zip from backup media to `/var/lib/snapd/snapshots`
2. discover snapshot-ID using `snap saved`
3. issue command `sudo snap restore "snapshot-ID" `

