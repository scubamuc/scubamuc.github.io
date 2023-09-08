  #!/bin/bash
##############################################################
# Script -scubamuc- https://scubamuc.github.io/ 
# Beschreibung -- Quick Ping & Speed Test --
# - Voraussetzung 'sudo apt install speedtest-cli'
# - Siehe Variablen
# - 'notify-send' nur für Desktop Systeme, bei CLI-Nutzung
#    deaktivieren! 
##############################################################

##############################################################
## VARIABLEN
##############################################################
## Hier werden die IP-Adressen oder Hostnamen der lokalen od.
## externen Hosts eingetragen. Öffentliche DNS sind Beispiele

COUNT=1			# Anzahl Pings 
ROUTER=xxx.xxx.xxx.xxx	# IP-Adresse des Routers
HOST1=xxx.xxx.xxx.xxx	# IP oder NS vom Host
HOST2=xxx.xxx.xxx.xxx	# IP oder NS vom Host
HOST3=9.9.9.9		# IP oder NS vom Quadnine
HOST4=1.1.1.1		# IP oder NS vom Cloudflare
HOST5=8.8.8.8		# IP oder NS von Google

##############################################################
## Funktion
##############################################################

pingtest(){
	ping -c 1 $ROUTER > /dev/null
	   if [ $? -eq 0 ]; 
	   then 
	echo "Verbindung ist OK"
	   else
	echo "Keine Verbindung, Quick Ping wird abgebrochen!" ; notify-send -i dialog-error "Quick Ping abgebrochen!"
	   exit	# Programm beenden wenn keine Verbindung besteht
	fi
   }

speedtest(){
	speedtest-cli --secure --no-upload	#Download Bandbreite
   }
##############################################################
## Skript
##############################################################
echo ""
	echo "      Verbindung wird geprüft und Bandbreite ermittelt  "
	echo "      ================================================  "
echo ""
        echo -ne "--- Verbindung wird gestetet...   " ; # Ausgabe V-Test
	sleep 2
	pingtest ;	# Funktion 'pingtest'
        echo -ne "--- Bandbreite wird ermittelt...  " ; # Ausgabe B-Test
	speedtest | grep 'Download:' ;	# Funktion 'speedtest'
echo ""
	echo "--- Quick-ping $HOST1 lokales Netzwerk" ;
	ping -c $COUNT $HOST1 | head -n-3 ;

	echo "--- Quick-Ping $HOST2" ;
	ping -c $COUNT $HOST2 | head -n-3 ;

	echo "--- Quick-Ping Quadnine" ;
	ping -c $COUNT $HOST3 | head -n-3 ;

	echo "--- Quck-Ping Cloudfare ..." ;
	ping -c $COUNT $HOST4 | head -n-3 ;
echo ""
	notify-send -i dialog-ok "Quick Ping beendet!" ; echo "      Quick Ping erfolgreich beendet!"
echo ""
