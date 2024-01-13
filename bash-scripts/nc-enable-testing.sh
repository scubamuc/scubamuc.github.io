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
# set trusted domains
	sudo nextcloud.occ config:system:set trusted_domains 0 --value="xcloud.scubamuc.dedyn.io"
	sudo nextcloud.occ config:system:set trusted_domains 1 --value="xcloud.scuba.dedyn.io"
	sudo nextcloud.occ config:system:set trusted_domains 2 --value="xcloud.ikhaya.dedyn.io"
# set overwritehostprotocol
	sudo nextcloud.occ config:system:set overwriteprotocol --value="https" ;
## Set Email
	sudo nextcloud.occ config:system:set mail_from_address --value="cloud.admin" ;
	sudo nextcloud.occ config:system:set mail_smtpmode --value="smtp" ;
	sudo nextcloud.occ config:system:set mail_sendmailmode --value="smtp" ;
	sudo nextcloud.occ config:system:set mail_domain --value="scubamuc.de" ;
	sudo nextcloud.occ config:system:set mail_smtpauth --value="1" ;
	sudo nextcloud.occ config:system:set mail_smtphost --value="mail.manitu.de" ;
	sudo nextcloud.occ config:system:set mail_smtpport --value="465" ;
	sudo nextcloud.occ config:system:set mail_smtpname --value="mailmaster@scubamuc.de" ;
	sudo nextcloud.occ config:system:set mail_smtppassword --value="#Ra|khayalami1994" ;
	sudo nextcloud.occ config:system:set mail_smtpsecure --value="ssl" ;

exit
