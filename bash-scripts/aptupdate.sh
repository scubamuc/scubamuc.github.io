  #!/bin/bash
##############################################################
## -- SCUBA --
## Script -scubamuc- https://scubamuc.github.io/ 
##############################################################
echo '#############################################################'
echo '#            Hallo '$USER'! Update & Upgrade                #'
echo '#        Das System wird aktualisiert und bereinigt         #' 
echo '#############################################################'
#############################################################
#                 APT Update durchführen                    #
#############################################################
# der Schalter -y ist für YES, keine Eingabe mehr nötig
	sudo apt update; 
	sudo apt full-upgrade -y;
	notify-send 'Systemaktualisierung beendet!' #ausschalten für cronjob!
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
	notify-send 'System ist aktuell!' #ausschalten für cronjob!
	exit
