# Nextcloud-snap, managing cron

---

## Get cron configuration:

`sudo snap get nextcloud nextcloud.cron-interval`

## Set cron configuration:

value =10 in minutes

`sudo snap set nextcloud nextcloud.cron-interval=10`

## Restart cron:

`sudo snap restart nextcloud.nextcloud-cron`

## Cron fails after update:

`sudo nextcloud.occ background:cron`

## Disable cron

`sudo snap set nextcloud nextcloud.cron-interval=-1`

## Enable cron

value =10 in minutes

`sudo snap set nextcloud nextcloud.cron-interval=10`
