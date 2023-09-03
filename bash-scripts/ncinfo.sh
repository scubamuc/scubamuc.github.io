  #!/bin/bash

##############################################################
# Script description  -scubamuc- https://scubamuc.github.io/ #
##############################################################
# Script to display system information and status of Nextcloud
# snap server. 
# Required packages:
# Sysstat: `sudo apt install sysstat`
# Snapd: `sudo apt install snapd`
# Nextcloud snap: `sudo snap install nextcloud`
##############################################################
# VARIABLES #
##############################################################
LOG="/home/$USER/script.log"  ## Log file
DATUM=`date +"%F"` ## Date format
ZEIT=`date +"%T"`  ## Time format
ZIEL="/home/$USER/Pfad"  ## Target path
QUELLE="/home/$USER/Pfad" ## Source path
LAN=$(ls /sys/class/net | grep 'br0') ## Eternet Interface
WLAN=$(ls /sys/class/net | grep 'wlx') ## Wireless Interface
EXTIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
IPEXT=curl ifconfig.me ## external IP
IPLAN=hostname -I ## local IP
##############################################################
# FUNCTIONS #
##############################################################
## Check if reboot is required ##
CheckReboot()
	{
	sudo /usr/lib/update-notifier/update-motd-reboot-required 
	}

## Check if updates are available ##
CheckUpdates()
	{
	sudo /usr/lib/update-notifier/update-motd-updates-available
	}

## Check snap services ##
CheckSnapDienste()
        {
        snap services nextcloud
        }

##############################################################
# Script
##############################################################
	clear
	sudo pwd # needs root privileges, enter "sudo" credentials
	clear
echo '   Hallo '$USER', welcome to '$HOSTNAME'!   ' 
echo ''
echo '=========================================   '
echo '       System information!                       '
echo ''
	echo     "	      Host: "$HOSTNAME" " ;
	echo     "	      Date: "$DATUM" " ;
	echo     "	      Time: "$ZEIT" " ;
  	echo -ne "	    LAN-IP: "$IPLAN" " ;
	echo -ne "	    EXT-IP: "$EXTIP" " ;
echo ''
	hostnamectl;
echo ''
echo '-------------------------------------------------'
echo '        System services and messages!            '
echo ''
##	echo -ne "	Nextcloud service:	"; snap services nextcloud.apache | grep 'nextcloud' >/dev/null && echo "running!" || echo "stopped!"
##	echo -ne "	   Nextcloud cron:	"; snap services nextcloud.nextcloud-cron | grep -oPw 'aktiv' >/dev/null && echo "running!" || echo "stopped!"
##	echo -ne "	   Coturn service:	"; ps -C turnserver >/dev/null && echo "running!" || echo "stopped!"
##	echo -ne "	   X11VNC service:	"; ps -C x11vnc >/dev/null && echo "running!" || echo "stopped!"
	echo -ne "	  System up since:	"; uptime -p ; #check uptime
	echo -ne "	 	Last boot:	"; last reboot -F | head -1 | awk '{print $5,$6,$7,$8,$9}' ; #check last boot
	echo -ne "	  Reboot required?	"; sudo /usr/lib/update-notifier/update-motd-reboot-required ; #check reboot required
echo ''
echo ''
sar -u 1 2
echo ''
echo '-------------------------------------------------'
echo '-------------------------------------------------'
echo '       Snap version installed!                   '
echo ''
	echo	"	-- Current Snap version: "
	snap version # list Snap information
echo ''
##	echo 	"	-- Aktuelle Nextcloud Snap: "
##	snap list nextcloud --all # Listet Nextcloud Info's
## echo ''
## 	echo	"	-- Nextcloud Snap Dienste:"
## 	echo	"				"; sudo snap services nextcloud #Listet Nextcloud Dienste
## echo ''
echo '       ==================================   '
read -p "  weiter mit Enter... Strg+c für Ende..."
echo ''
	clear
echo ''
echo '       Verzeichnis-Größen auf dem System!   '
echo ''
echo '       ==================================   '
echo '       Gesamtspeicher auf dem System!            '
echo ''
	sudo free -tmh
echo ''
        sudo lsblk -e7 -o NAME,SIZE,FSUSED,FSUSE%,FSAVAIL,MOUNTPOINT
# echo ''
#       sudo df -ah /dev/sda1 &&
#       sudo df -ah /dev/sda2 &&
#       sudo df -ah /media/DATAHOME &&
echo ''
echo '  Größen werden ermittelt, bitte warten...          '
echo ''
	cd / && sudo du -hsx --exclude=proc * | sort -rh | head -5
echo ''
##echo '-------------------------------------------------'
##echo '       Größe Nextcloud Data-Verzeichnis!         '
##echo ''
##	sudo du -hs /var/snap/nextcloud/common/nextcloud/data
##echo ''
##echo '-------------------------------------------------'
##echo '       Größte Datei im Nextcloud-Verzeichnis!    '
##echo ''
##	sudo find /var/snap/nextcloud/common/nextcloud/data -type f -printf "%s\t%p\n" | sort -n | tail -1 &&
##echo ''
##echo '-------------------------------------------------'
##echo '       Größe der Nextcloud-Log!                  '
##echo ''
##	sudo du -hs /var/snap/nextcloud/common/nextcloud/data/nextcloud.log
##echo ''
##echo '-------------------------------------------------'
##echo '       Letzter Eintrag der Nextcloud-Log         '
##echo ''
##	sudo tail -n1 /var/snap/nextcloud/common/nextcloud/data/nextcloud.log
echo ''
##echo " HINWEIS: Nextcloud-Log löschen mit 'sudo rm /var/snap/nextcloud/common/nextcloud/data/nextcloud.log'"
echo ''
read -p "  weiter mit Enter... Strg+c für Ende..."
echo ''
	clear
echo ''
echo '       Die letzten Logins auf dem System!   '
echo ''
echo '       ==================================   '
echo ''
echo '-------------------------------------------------'
echo '       Letzten Logins & Systemtasks           '
echo ''
	last -aFixn 5  ;
echo ''
echo ''
echo '-------------------------------------------------'
echo '       Letzten fehlgeschlagenen Loginversuche    '
echo ''
		sudo lastb -aFin 5 ;
##	  sudo egrep "Failed|Failure" /var/log/auth.log ;
##	sudo cat /var/log/auth.log | grep "Failed password"
echo ''
