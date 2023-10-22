  #!/bin/bash
##############################################################
# Script description  -scubamuc- https://scubamuc.github.io/ #
# Re-enable Nextcloud office & CODE on Nextcloud snap        #
# This script re-enables Nextcloud office and CODE on        #
# Nextcloud snap installation, where Nextcloud office        #
# loses or changes its wonrking configuration after an       #
# app-update or app-upgrade                                  #
##############################################################
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
