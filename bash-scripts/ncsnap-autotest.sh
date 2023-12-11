 #!/bin/bash
##############################################################
# Script description  -scubamuc- https://scubamuc.github.io/ #
##############################################################
# Setup Nextcloud snap testing environment for nextcloud-snap
# This script assumes running your test instance behind a 
# reverse proxy managing encryption
##############################################################
# backup working config.php
	sudo cp /var/snap/nextcloud/current/nextcloud/config/config.php /var/snap/nextcloud/current/nextcloud/config/config.php.bak ;
# set overwrite.cli.url
	sudo nextcloud.occ config:system:set overwrite.cli.url --value="https://cloud.yourdomain.com" ;
# set overwrite host protocol
	sudo nextcloud.occ config:system:set overwriteprotocol --value="https" ;
# set trusted proxy
	sudo nextcloud.occ config:system:set trusted_poxies 0 --value="your.proxy.ip" ;
# set default phone region
	sudo nextcloud.occ config:system:set default_phone_region --value="US" ;
# set http compression
	sudo snap set nextcloud http.compression=true ;
## Set email
	sudo nextcloud.occ config:system:set mail_from_address --value="cloud.admin" ;
	sudo nextcloud.occ config:system:set mail_smtpmode --value="smtp" ;
	sudo nextcloud.occ config:system:set mail_sendmailmode --value="smtp" ;
	sudo nextcloud.occ config:system:set mail_domain --value="your.domain.com" ;
	sudo nextcloud.occ config:system:set mail_smtpauth --value="1" ;
	sudo nextcloud.occ config:system:set mail_smtphost --value="your.smpt.host" ;
	sudo nextcloud.occ config:system:set mail_smtpport --value="port" ;
	sudo nextcloud.occ config:system:set mail_smtpname --value="smtpusername" ;
	sudo nextcloud.occ config:system:set mail_smtppassword --value="smtppassword" ;
	sudo nextcloud.occ config:system:set mail_smtpsecure --value="ssl" ;
## CODE & Office settings
# 1. Disable CODE
	sudo nextcloud.occ app:disable richdocumentscode ;
# 2. Disable Nextcloud office
	sudo nextcloud.occ app:disable richdocuments ;
# 3. Delete public_wopi configuration
	sudo nextcloud.occ config:app:delete richdocuments public_wopi_url ;
# 4. Delete wopi_url configuration
	sudo nextcloud.occ config:app:delete richdocuments wopi_url ;
# 5. Enable Nextcloud office
	sudo nextcloud.occ app:enable richdocuments ;
# 6. Enable CODE
	sudo nextcloud.occ app:enable richdocumentscode ;
exit
