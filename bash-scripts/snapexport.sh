#!/bin/bash
##############################################################
# -scubamuc- https://scubamuc.github.io/                     #
# Nextcloud-snap backup with nextcloud.export -- SCUBA --    #
##############################################################

## backup directory: '/var/snap/nextcloud/common/backups'
## restore directory: '/var/snap/nextcloud/common'
## backup rotation 30 days
## create crontab as root for automation

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

## must be root, enter sudo password
sudo pwd

## create backup with nextcloud.export ##
sudo nextcloud.export ; ## nextcloud.export, see options

## find and compress backup directory ##
list=`ls $SOURCE`
for i in $list
do
    if [ ! "$i" == "." ]; then
      sudo tar czf ${i}-$BACKUPNAME.tar.gz ${i}
    fi
done

## find and move compressed backup file to $TARGET
sudo find $SOURCE/ -name "*.tar.gz" -exec mv '{}' $TARGET/ \;

## find and rotate/delete old backups
sudo find $TARGET/ -name "*.tar.gz" -mtime +$RETENTION -exec rm -f {} \; 

exit
