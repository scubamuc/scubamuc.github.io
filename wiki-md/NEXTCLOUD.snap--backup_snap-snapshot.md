# Nextcloud snap snapshot

## Backup Nextcloud snap using Snap snapshots

[documentation](https://snapcraft.io/docs/snapshots)

* snap stop 'nextcloud'
* snap save 'nextcloud'
* snap start 'nextcloud'
* find snapshot in `/var/lib/snapd/snapshots` and move to wherever

This works fine as weekly automatic cronjob as root and has the added convenience of easy Snap transfer to different server when needed. thus always 4 weeks of Snap snapshots on backup media.

Snap snapshots may be scripted, see example below

---

### Rotating Nextcloud-snap snapshots script to media incl. logging:

1\. create mount directory for media in `/media` or `/mnt`

2\. mount media using `/etc/fstab` with option `nofail`

3\. snapshots are kept for 30 days

4\. save script in `$USER/bin` as `snapsnapshot.sh`

5\. set preference variables

6\. create root-cronjob for weekly execution ( ``` 0 1 * * 0 su $USER /home/$USER/bin/snapsnapshot.sh ``` )

```
#!/bin/bash
##############################################################
## Nextcloud-snap backup with snap snapshots -- SCUBA --
## -scubamuc- https://scubamuc.github.io/ 
##############################################################
## create target directory "sudo mkdir /media/SNAPBACKUP"
## snapshot rotation 30 days 
## create crontab as root for automation
## 0 1 * * 0 su $USER /home/$USER/bin/snapsnapshot.sh
##############################################################
# VARIABLES #
##############################################################

SNAPNAME="nextcloud"
TARGET="/media/SNAPBACKUP"  ## target directory
LOG="/media/SNAPBACKUP/snapbackup-nc.log"  ## logfile
SOURCE="/var/lib/snapd/snapshots" ## source directory
RETENTION="30" ## retention in days

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
 sudo snap stop "$SNAPNAME" ;
## create snap snapshot 
 sudo snap save --abs-time "$SNAPNAME" ;
## restart snap after snapshot 
 sudo snap start "$SNAPNAME" ;

## find and move snapshot to $TARGET  
 sudo find "$SOURCE"/ -name "*.zip" -exec mv '{}' "$TARGET"/ \; # find and move
## find old snapshots and delete snapshots older than $RETENTION days
 sudo find "$TARGET"/ -name "*.zip" -mtime +"$RETENTION" -exec rm -f {} \; # find and delete

## end log 
 echo "$(timestamp) -- Snapbackup "$SNAPNAME" End " >> "$LOG" ; ## end log 
 echo "" >> "$LOG" ;  ## log linefeed 

exit

```

---

## Restore snapshot using Snap restore 

* when moving to new device, be sure to install Nextcloud-snap first
* snap restore replaces previous installation incl. certs, DB and data
* see documentation in `man snap` and [snapcraft](https://snapcraft.io/docs/snapshots#heading--restoring)

1\. copy \*.zip from backup media to `/var/lib/snapd/snapshots`

2\. discover snapshot-ID using `snap saved`

3\. issue command `sudo snap restore "snapshot-ID"`

---
