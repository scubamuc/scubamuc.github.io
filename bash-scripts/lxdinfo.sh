
  #!/bin/bash

##############################################################
# Script Beschreibung #
##############################################################
# Dieses Skript dient zur Übersicht über die Platzverhältnisse
# auf dem LXD Server. Es werden zusätzliche Systemwerte
# angezeigt!
##############################################################
# VARIABLEN #
##############################################################
LOG="/home/$USER/script.log"  ## Lagdatei
DATUM=`date +"%F"` ## Datumvariable
ZEIT=`date +"%T"`  ## Zeitvariable
ZIEL="/home/$USER/Pfad"  ## Zieldatei
QUELLE="/home/$USER/Pfad" ## Quelldatei
LAN=$(ls /sys/class/net | grep br0) ## Eternet Interface
WLAN=$(ls /sys/class/net | grep wl) ## Wireless Interface
EXTIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
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
        snap services lxd
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
        echo -ne "	    LAN-IP: "; hostname -I ; ## LAN-IP
	echo -ne "	    EXT-IP: "$EXTIP ;
echo ''
	hostnamectl;
echo ''
echo '-------------------------------------------------'
echo '       System Dienste und Meldungen!             '
echo ''
	echo -ne "	    X11VNC Server:	"; ps -C x11vnc >/dev/null && echo "läuft!" || echo "gestoppt!"
	echo -ne "	System Läuft seit:	"; uptime -p ; #check wie lange läuft System schon
	echo -ne "	 Letzter Neustart:	"; last reboot -F | head -1 | awk '{print $5,$6,$7,$8,$9}' ; #check letzter neustart
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
	echo 	"	-- Aktuelle LXD Snap: "
	snap list lxd --all # Listet LXD Info's
echo ''
 	echo	"	-- LXD Snap Dienste:"
 	echo	"				"; sudo snap services lxd #Listet Nextcloud Dienste
echo ''
echo '-------------------------------------------------'
echo '       LXC Container Status!                             '
echo ''
lxc list status=running
echo ''
echo ''
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
        sudo lsblk -e7 -o NAME,SIZE,FSUSED,FSUSE%,FSAVAIL,MOUNTPOINT
# echo ''
#       sudo df -ah /dev/sda1 &&
#       sudo df -ah /dev/sda2 &&
#       sudo df -ah /var &&
echo ''
echo '  Größen werden ermittelt, bitte warten...          '
echo ''
	cd / && sudo du -hsx --exclude=proc * | sort -rh | head -5
echo ''
echo '-------------------------------------------------'
echo '       Größe LXD-Verzeichnis!         '
echo ''
	sudo du -hs /var/snap/lxd
echo ''
echo '-------------------------------------------------'
echo '       Größte Datei im LXD-Verzeichnis!    '
echo ''
	sudo find /var/snap/lxd -type f -printf "%s\t%p\n" | sort -n | tail -1 &&
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
echo ''
