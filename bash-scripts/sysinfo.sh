
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
LAN=$(ls /sys/class/net | grep -oP 'br0') ## Eternet Interface
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

## Apt Update und Apt Upgrade ##
AptUpdate()
	{
	echo '#############################################################'
	echo '#                 APT Update durchführen                    #'
	echo '#############################################################'
		sudo apt update &&
		sudo apt full-upgrade -y &&
	echo '#############################################################'
	echo '#                 APT Bereinigung.....                      #'
	echo '#############################################################'
		sudo apt-get autoremove --purge &&
		sudo apt-get -y autoclean &&
		sudo apt-get -y clean &&
	echo '#############################################################'
	echo '#               System ist aktuell!                         #'
	echo '#          Alle Caches wurden gelöscht.....                 #'
	echo '#############################################################'
	}
##############################################################
# Script Beginn
##############################################################
	clear
	sudo pwd #einmalige Passworteingabe
	clear
echo '   Hallo '$USER', wllkommen auf '$HOSTNAME'!   '
echo '   =========================================   '
echo ''
	hostnamectl; ## Systemdienst übersicht
echo ''
echo '       ----------------------------------   '
echo '       System Information!                       '
echo ''
##	echo	"	   Host: "$HOSTNAME; ## Hostname des Systems
	echo	"	  Datum: "$DATUM; ## aktuelles Systemdatum
	echo	"	   Zeit: "$ZEIT ; ## aktuelle Systemzeit
	echo -ne "	 LAN-IP: "; hostname -I ; ## LAN-IP
##	echo -ne "	 LAN-IP: "; ip -4 addr show "$LAN" | grep -oP '(?<=inet\s)\d+(\.\d+){3}' ; ## LAN-IP
##	echo -ne "	WLAN-IP: "; ip -4 addr show "$WLAN" | grep -oP '(?<=inet\s)\d+(\.\d+){3}' ; ## WLAN-IP
	echo -ne "	 EXT-IP: "; "$EXTIP" ## externe IP
echo ''
echo '       ----------------------------------   '
echo '       System Dienste und Meldungen!             '
echo ''
        echo -ne "	    X11VNC Server: "; ps -C x11vnc >/dev/null && echo "läuft!" || echo "gestoppt!"
	echo -ne "	System Läuft seit: "; uptime -p ; #check wie lange läuft System schon
	echo -ne "	 Letzter Neustart: "; last reboot -F | head -1 | awk '{print $5,$6,$7,$8,$9}' ; #check letzter neustart
	echo -ne "	  System Neustart? "; pro system reboot-required | grep 'no' >/dev/null && echo "nicht erforderlich!" || echo "ist erforderlich!" ; #prüfe nach ob reboot erforderlich ist
echo ''
echo ''
echo '   =========================================   '
echo ''
## read -p "  weiter mit Enter... Strg+c für Ende..."
##         clear
## echo ''
echo '       ----------------------------------   '
echo '       LXC Container Status!                '
echo ''
lxc list status=running
echo ''
echo '       ----------------------------------   '
echo '       Aktuelle Systemauslastung!           '
echo ''
sar -u 1 2
echo ''
echo '       ----------------------------------   '
echo '       Aktuelle Speicherauslastung!         '
echo ''
        sudo lsblk -e7 -o NAME,SIZE,FSUSED,FSUSE%,FSAVAIL | grep -v "ram" # Liste alle laufwerke ohne (-e7 = loop) und ram
echo ''
	sudo free -m
echo ''
echo ''
