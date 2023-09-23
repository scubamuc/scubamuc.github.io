  #!/bin/bash
echo '#############################################################'
echo '#            Hallo '$USER'! Update & Upgrade                #'
echo '#        Das System wird aktualisiert und bereinigt         #' 
echo '#############################################################'
##############################################################
# FUNKTION #
##############################################################
## Check ob neustart notwendig ##
	function neustart {
	  if [ -f /var/run/reboot-required ]; then
	    read -p "Restart needed. Reboot? (y/N) " answer;
	    if [ "$answer" = "y" -o "$answer" = "Y" ]; then
	      reboot;
	    fi
	  else
	    echo "No restart";
	  fi
	}
#############################################################
#                 APT Update durchführen                    #
#############################################################
# der Schalter -y ist für YES, keine Eingabe mehr nötig
	sudo apt update; 
	sudo apt full-upgrade -y;
	notify-send 'Systemaktualisierung beendet!' ## HINWEIS, ausschalten für cronjob!
#############################################################
#                 APT Bereinigung.....                      #
#############################################################
# autoremove löscht alle alten Kernels 
	sudo apt-get -y autoremove --purge;
	sudo apt-get -y autoclean;
	sudo apt-get -y clean;
#	rm -rf ~/.cache/chromium/* ; # bereigige Chromium caches
#	rm -rf ~/.mozilla/firefox/*/Cache ; # bereigige Firefox caches
#	rm -rf ~/.mozilla/firefox/'Crash Reports'/* ; # bereigige Firefox caches
#	rm -rf ~/.cache/mozilla/firefox/* ; # bereigige Firefox caches
echo '#############################################################'
echo '#               System ist aktuell!                         #'
echo '#############################################################'
	notify-send 'System ist aktuell!' ## HINWEIS, ausschalten für cronjob!
	exit
