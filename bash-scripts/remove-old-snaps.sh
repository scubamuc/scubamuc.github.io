#!/bin/bash
##############################################################
## -- SCUBA --
## Script -scubamuc- https://scubamuc.github.io/ 
##############################################################
# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu

LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
      sudo snap remove "$snapname" --revision="$revision"
    done
