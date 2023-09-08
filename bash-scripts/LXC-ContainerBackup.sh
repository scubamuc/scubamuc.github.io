  #!/bin/bash
##############################################################
## -- SCUBA --
## LXC container incremental backup image to target directory
## Script -scubamuc- https://scubamuc.github.io/ 
##############################################################
## create target directory
## create crontab for automation
## crontab execution hourly/daily/weekly
## retention in days
##############################################################
# VARIABLES #
##############################################################

CONTAINERNAME="NEXTCLOUD" ## LXC Containername
DATE="`date +"%Y%m%d"`"
IMAGENAME="$CONTAINERNAME-$DATE"
TARGET="/media/EXT-HDD/LXC-BACKUP"  ## Target directory
LOG="$TARGET/$CONTAINERNAME--LXC-BACKUP.log"  ## Log file
RETENTION="30" ## Retention in days

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
  echo "***********************************************************" >> "$LOG" ; ## log seperator
  echo "$(timestamp) -- LXC-Backup $IMAGENAME Start" >> "$LOG" ; ## start log

## Container snapshot
  lxc snapshot $CONTAINERNAME/$CONTAINERNAME --reuse ;
## publish Container with Alias
  lxc publish $CONTAINERNAME/$CONTAINERNAME --alias $CONTAINERNAME ;
## create image from snapshot
  lxc image export $CONTAINERNAME $TARGET/$IMAGENAME ;
## delete Image on Host
  lxc image delete $CONTAINERNAME ;

## find old Images and delete older than $RETENTION days
  find $TARGET/ -name "*.tar.gz" -mtime +$RETENTION -exec rm -f {} \; # find and delete

## end log
  echo "$(timestamp) -- LXC-Backup $IMAGENAME End  " >> "$LOG" ; ## end log
  echo "" >> "$LOG" ;  ## log linefeed

## Restore Image
## To restore and create a container from it, you can then do:
## lxc image import $TARGET/$IMAGENAME.tar.gz --alias $IMAGENAME
## lxc launch $IMAGENAME $CONTAINERNAME
## lxc image delete $IMAGENAME

exit
