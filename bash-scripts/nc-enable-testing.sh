  #!/bin/bash
##############################################################
##############################################################
# backup working config.php
	sudo cp /var/snap/nextcloud/current/nextcloud/config/config.php /var/snap/nextcloud/current/nextcloud/config/config.php.bak ;
# set default phone region
	sudo nextcloud.occ config:system:set default_phone_region --value="DE" ;
# set http compression
	sudo snap set nextcloud http.compression=true ;
# set trusted proxies
	sudo nextcloud.occ config:system:set trusted_proxies 0 --value="192.168.2.10"


exit
