#!/bin/bash
##############################################################
## Nextcloud-snap backup with Snap snapshot -- SCUBA --
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
LOG="$TARGET/snapbackup-nc.log"  ## logfile
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

## must be root, enter sudo password for manual snapshot
## sudo pwd

## start log  
 echo "********************************************************" >> "$LOG" ; ## log seperator
 echo "$(timestamp) -- Snapbackup "$SNAPNAME" Start" >> "$LOG" ; ## start log

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
