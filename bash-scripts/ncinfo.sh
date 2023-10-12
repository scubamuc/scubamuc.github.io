  #!/bin/bash

##############################################################
# Script Beschreibung -scubamuc- https://scubamuc.github.io/ #
##############################################################
# Dieses Skript dient zur Übersicht über die Platzverhältnisse
# auf dem Nextcloud Server. Es werden zusätzliche Systemwerte
# angezeigt!
##############################################################
# VARIABLEN #
##############################################################
LOG="/home/$USER/script.log"  ## Lagdatei
DATUM=`date +"%F"` ## Datumvariable
ZEIT=`date +"%T"`  ## Zeitvariable
ZIEL="/home/$USER/Pfad"  ## Zieldatei
QUELLE="/home/$USER/Pfad" ## Quelldatei
LAN=$(ls /sys/class/net | grep 'br0') ## Eternet Interface
WLAN=$(ls /sys/class/net | grep 'wlx') ## Wireless Interface
EXTIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
IPEXT=curl ifconfig.me ## zeigt externe IP
IPLAN=hostname -I ## zeigt lokale LAN IP
##############################################################
# FUNKTION #
##############################################################
## Check ob neustart notwendig ##
CheckReboot()
	{
	sudo /usr/lib/update-notifier/update-motd-reboot-required 
	}


## Check ob Updates verfügbar ##
CheckUpdates()
	{
	sudo /usr/lib/update-notifier/update-motd-updates-available
	}

## Check snap Dienste ##
CheckSnapDienste()
        {
        snap services nextcloud
        }

##############################################################
# Script Beginn
##############################################################
	clear
	sudo pwd #einmalige Passworteingabe
	clear
echo '   Hallo '$USER', wllkommen auf '$HOSTNAME'!     '
echo '   ncinfo.sh wird ausgeführt...                  '
echo '=========================================   '
echo '       System Information!                       '
echo ''
	echo     "	      Host: "$HOSTNAME ;
	echo     "	     Datum: "$DATUM ;
	echo     "	      Zeit: "$ZEIT ;
  	echo -ne "	    LAN-IP: "; hostname -I ;
##	echo -ne "	   WLAN-IP: "; ip -4 addr show $WLAN | grep -oP '(?<=inet\s)\d+(\.\d+){3}' ;
	echo -ne "	    EXT-IP: "$EXTIP ;
echo ''
	hostnamectl;
echo ''
echo '-------------------------------------------------'
echo '       System Dienste und Meldungen!             '
echo ''
##	echo -ne "	 Nextcloud Dienst:	"; snap services nextcloud.apache | grep 'nextcloud' >/dev/null && echo "läuft!" || echo "gestoppt!"
##	echo -ne "	   Nextcloud Cron:	"; snap services nextcloud.nextcloud-cron | grep -oPw 'aktiv' >/dev/null && echo "läuft!" || echo "gestoppt!"
##	echo -ne "	    Coturn Server:	"; ps -C turnserver >/dev/null && echo "läuft!" || echo "gestoppt!"
	echo -ne "	    X11VNC Server:	"; ps -C x11vnc >/dev/null && echo "läuft!" || echo "gestoppt!"
	echo -ne "	System Läuft seit:	"; uptime -p ; #check wie lange läuft System schon
	echo -ne "	 Letzter Neustart:	"; last reboot -F | head -1 | awk '{print $5,$6,$7,$8,$9}' ; #check letzter neustart
	echo -ne "	  System Neustart?	"; pro system reboot-required ; #prüfe nach ob reboot erforderlich ist
echo ''
echo ''
sar -u 1 2
echo ''
echo '-------------------------------------------------'
echo '-------------------------------------------------'
echo '       Snap Version auf dem System!              '
echo ''
	echo	"	-- Aktuelle Snap Version: "
	snap version # Listet Snap Info's
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
        sudo lsblk -e7 -o NAME,SIZE,FSUSED,FSUSE%,FSAVAIL | grep -v "ram" # Liste alle laufwerke ohne (-e7 = loop) und ram
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
##	sudo du -hs /var/snap/nextcloud/current/logs/nextcloud.log
##echo ''
##echo '-------------------------------------------------'
##echo '       Letzter Eintrag der Nextcloud-Log         '
##echo ''
##	sudo tail -n5 /var/snap/nextcloud/current/logs/nextcloud.log
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
