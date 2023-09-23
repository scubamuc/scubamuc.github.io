
  #!/bin/bash

##############################################################
# Script description  -scubamuc- https://scubamuc.github.io/ #
##############################################################
# Script to display a quick overview of system information and
# system status. 
# Required packages:
# Sysstat: `sudo apt install sysstat`
##############################################################
# VARIABLES #
##############################################################
LOG="/home/$USER/script.log"  ## Log file
DATUM=`date +"%F"` ## Date format
ZEIT=`date +"%T"`  ## Time format
ZIEL="/home/$USER/Pfad"  ## Targe path
QUELLE="/home/$USER/Pfad" ## Source path
LAN=$(ls /sys/class/net | grep en) ## Eternet Interface
WLAN=$(ls /sys/class/net | grep wl) ## Wireless Interface
EXTIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
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

## Upgrade and clean APT ##
AptUpdate()
	{
	echo '#############################################################'
	echo '#                 APT Update 	                          #'
	echo '#############################################################'
		sudo apt update &&
		sudo apt full-upgrade -y &&
	echo '#############################################################'
	echo '#                 APT clean up	                          #'
	echo '#############################################################'
		sudo apt-get autoremove --purge &&
		sudo apt-get -y autoclean &&
		sudo apt-get -y clean &&
	echo '#############################################################'
	echo '#               System updated!	                          #'
	echo '#############################################################'
	}
##############################################################
# Script
##############################################################
	clear
	sudo pwd # needs root privileges, enter "sudo" credentials
	clear
echo '   Hallo '$USER', welcome to '$HOSTNAME'!     '
echo ''
        hostnamectl; ## System overview
echo ''
echo '=========================================   '
echo '       System information!                       '
echo ''
	echo     "      |     Host:   ""$HOSTNAME"; ## Hostname des Systems
	echo     "      |     Date:   ""$DATUM"; ## aktuelles Systemdatum
	echo     "      |     Time:   ""$ZEIT" ; ## aktuelle Systemzeit
	echo -ne "      |   LAN-IP:   "; hostname -I ; ## LAN IP
	echo -ne "      |  WLAN-IP:   "; ip -4 addr show $WLAN | grep -oP '(?<=inet\s)\d+(\.\d+){3}' ; ## WLAN-IP
	echo -ne "      |   EXT-IP:   "; "$EXTIP" ## external IP
echo ''
echo '-------------------------------------------------'
echo '       System services and messages!             '
echo ''
	echo -ne "      |   System up since:	"; uptime -p ; #check uptime
        echo -ne "      |         Last boot:	"; last reboot -F | head -1 | awk '{print $5,$6,$7,$8,$9}' ; # Check last reboot
        echo     "      |    System updates?	" $CheckUpdates ; # check for system upgrades
        echo -ne "      |   Reboot required?	" pro system reboot-requided ; # check if system reboot is required
echo ''
echo ''
echo '       ==================================   '
echo '       Memory and disk usage overview!            '
echo ''
        sudo lsblk -e7 -o NAME,SIZE,FSUSED,FSUSE%,FSAVAIL | grep -v "ram" # List drives excluding loop (-e7 = loop) and ram
echo ''
read -p "  Enter to continue... Crtl+c to close..."
	clear
echo ''
	AptUpdate # start system update and upgrade and clean up
exit
