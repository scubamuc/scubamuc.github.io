 #!/bin/bash
#################################################################################
         # Script description  -scubamuc- https://scubamuc.github.io/ #
#################################################################################
# Setup Nextcloud snap testing environment for nextcloud-snap
# This script assumes you are running your test instance behind a reverse proxy  
# managing encryption
#################################################################################
## Setup admin account
##        sudo nextcloud.manual-install adminuser yousecretpassword
#################################################################################
# backup working config.php
        sudo cp /var/snap/nextcloud/current/nextcloud/config/config.php /var/snap/nextcloud/current/ ;
# set default phone region
        sudo nextcloud.occ config:system:set default_phone_region --value="US" ;
# set http compression (optional)
        sudo snap set nextcloud http.compression=true ;
# set trusted proxies (if reverse proxy is present)
        sudo nextcloud.occ config:system:set trusted_proxies 0 --value="reverse.proxy.ip" ;
# set trusted domains
        sudo nextcloud.occ config:system:set trusted_domains 0 --value="cloud.my.domain.xyz" ;
# set overwritehostprotocol (optional)
        sudo nextcloud.occ config:system:set overwriteprotocol --value="https" ;
# set email for admin user (optional)
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
