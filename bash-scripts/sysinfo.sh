
  #!/bin/bash

##############################################################
# Script Beschreibung #
##############################################################
# Mit SysInfo wird ein Systemüberblick ausgegeben. 
# Es werden zusätzliche Systemwerte angezeigt und abschließend
# eine Option zum Systemupdate abgefragt.
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
##	echo -ne "	 LAN-IP: "; ip -4 addr show $LAN | grep -oP '(?<=inet\s)\d+(\.\d+){3}' ; ## LAN-IP
##	echo -ne "	WLAN-IP: "; ip -4 addr show $WLAN | grep -oP '(?<=inet\s)\d+(\.\d+){3}' ; ## WLAN-IP
	echo -ne "	 EXT-IP: "; dig +short myip.opendns.com @resolver1.opendns.com ## externe IP
echo ''
echo '       ----------------------------------   '
echo '       System Dienste und Meldungen!             '
echo ''
	echo -ne "	System Läuft seit: "; uptime -p ; #check wie lange läuft System schon
	echo -ne "	 Letzter Neustart: "; last reboot -F | head -1 | awk '{print $5,$6,$7,$8,$9}' ; #check letzter neustart
	echo     "	   System Updates? " $CheckUpdates ; #prüfe nach ob Updates verfügbar sind
	echo     "	  System Neustart? " $CheckReboot ; #prüfe nach ob reboot erforderlich ist
echo ''
echo '       ==================================   '
echo '       Gesamtspeicher auf dem System!       '
echo ''
        sudo lsblk -e7 -o NAME,SIZE,FSUSED,FSUSE%,FSAVAIL
echo ''
	free -m
echo ''
echo ''
read -p "  System Upgrade mit Enter... Strg+c für Ende..."
        clear
echo ''
        AptUpdate
exit
