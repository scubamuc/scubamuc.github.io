# Nextcloud-snap, cron

---

## Get cron configuration:

`sudo snap get nextcloud nextcloud.cron-interval`

## Set cron configuration:

Bsp. Standard-Wert =10 in Minuten

`sudo snap set nextcloud nextcloud.cron-interval=10`

## Restart cron:

`sudo snap restart nextcloud.nextcloud-cron`

## Cron fails after Update:

`sudo nextcloud.occ background:cron`