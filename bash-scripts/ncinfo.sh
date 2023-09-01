
  #!/bin/bash

##############################################################
# Script description #
##############################################################
# Script to display a quick overview of Nextcloud snap status 
# Required:
# Nextcloud snap:  `sudo snap install nextcloud`
# Sysstat: `sudo apt install sysstat`
##############################################################
# VARIABLES #
##############################################################
LOG="/home/$USER/script.log"  ## Log file
DATUM=`date +"%F"` ## Date format
ZEIT=`date +"%T"`  ## Time format
TARGET="/home/$USER/Pfad"  ## Target path
SOURCE="/home/$USER/Pfad" ## Source path
LAN=$(ls /sys/class/net | grep 'br0') ## Eternet interface
WLAN=$(ls /sys/class/net | grep 'wlx') ## Wireless interface
EXTIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
IPEXT=curl ifconfig.me ## external ip
IPLAN=hostname -I ## internal ip
##############################################################
# FUNCTIONS #
##############################################################
## Reboot required? ##
CheckReboot()
	{
	sudo /usr/lib/update-notifier/update-motd-reboot-required 
	}


## Updates available? ##
CheckUpdates()
	{
	sudo /usr/lib/update-notifier/update-motd-updates-available
	}

## Snap Services ##
CheckSnapDienste()
        {
        snap services nextcloud
        }

##############################################################
# Script
##############################################################
	clear
	sudo pwd #enter `sudo` password
	clear
echo '   Hallo '$USER', welcome to '$HOSTNAME'!     '
echo '   ncinfo.sh will proceed...                  '
echo '=========================================   '
echo '       System imformation!                       '
echo ''
	echo     "	      Host: "$HOSTNAME ;
	echo     "	      Date: "$DATUM ;
	echo     "	      Time: "$ZEIT ;
  	echo -ne "	    LAN-IP: "; hostname -I ;
	echo -ne "	    EXT-IP: "$EXTIP ;
echo ''
	hostnamectl;
echo ''
echo '-------------------------------------------------'
echo '       System services and messages!             '
echo ''
	echo -ne "	Nextcloud Service:	"; snap services nextcloud.apache | grep 'nextcloud' >/dev/null && echo "läuft!" || echo "gestoppt!"
	echo -ne "	   Nextcloud Cron:	"; snap services nextcloud.nextcloud-cron | grep -oPw 'aktiv' >/dev/null && echo "läuft!" || echo "gestoppt!"
	echo -ne "	  System up since:	"; uptime -p ; #uptime
	echo -ne "	      Last reboot:	"; last reboot -F | head -1 | awk '{print $5,$6,$7,$8,$9}' ; #las reboot
	echo	 "	Updates available?	"$CheckUpdate ; #updates available?
	echo	 "	  Reboot required?	"$CheckReboot ; #reboot required?
echo ''
sar -u 1 2
echo ''
echo '-------------------------------------------------'
echo '-------------------------------------------------'
echo '       Snap version being used!              '
echo ''
	echo	"	-- Current Snap Version: "
	snap version # current snap version infos
echo ''
	echo 	"	-- Current Nextcloud snap: "
	snap list nextcloud --all # List Nextcloud snap info's
echo ''
 	echo	"	-- Nextcloud snap services:"
 	echo	"				"; sudo snap services nextcloud #List Nextcloud snap services
echo ''
echo '       ==================================   '
read -p "  Enter to continue... Crtl+c to close..."
echo ''
	clear
echo ''
echo '       Directory sizes!   '
echo ''
echo '       ==================================   '
echo '       Memory usage!            '
echo ''
	sudo free -tmh
echo ''
        sudo lsblk -e7 -o NAME,SIZE,FSUSED,FSUSE%,FSAVAIL,MOUNTPOINT
echo ''
echo '  discovering sizes, please wait...          '
echo ''
	cd / && sudo du -hsx --exclude=proc * | sort -rh | head -5
echo ''
echo '-------------------------------------------------'
echo '       Nextcloud Data directory!         '
echo ''
	sudo du -hs /var/snap/nextcloud/common/nextcloud/data
echo ''
echo '-------------------------------------------------'
echo '       Largest files in Nextcloud directory!    '
echo ''
	sudo find /var/snap/nextcloud/common/nextcloud/data -type f -printf "%s\t%p\n" | sort -n | tail -1 &&
echo ''
echo '-------------------------------------------------'
echo '       Nextcloud log size!                  '
echo ''
	sudo du -hs /var/snap/nextcloud/common/nextcloud/data/nextcloud.log
echo ''
echo '-------------------------------------------------'
echo '       Last entry in Nextcloud log         '
echo ''
	sudo tail -n1 /var/snap/nextcloud/common/nextcloud/data/nextcloud.log
echo ''
echo " NOTE: delete Nextcloud 'sudo rm /var/snap/nextcloud/common/nextcloud/data/nextcloud.log' "
echo ''
read -p "  Enter to continue... Crtl+c to close..."
echo ''
	clear
echo ''
echo '       Last logins on the system!   '
echo ''
echo '       ==================================   '
echo ''
echo '-------------------------------------------------'
echo '       Logins & System tasks           '
echo ''
	sudo last -aFixn 5  ; ## last 5 successfull logins
echo ''
echo ''
echo '-------------------------------------------------'
echo '       Last unsuccessfull logins    '
echo ''
	sudo lastb -aFin 5 ; ## last 5 bad logins
echo ''
