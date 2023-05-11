# Manage Nextcloud-snap services

<https://snapcraft.io/docs/service-management>

[Nextcloud-snap logs](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--logs.md)

---

## View Nextcloud-snap processes in htop

`htop -F nextcloud`

## View Snap services for Nextcloud-snap

`sudo snap services $SNAPNAME`

Example:

`sudo snap services nextcloud`

## View service-logs for Nextcloud-snap

`sudo snap logs $SNAPNAME`

Example:

`sudo snap logs nextcloud.nextcloud-cron`

## Journalctl service logs

example of sevice logs:
```
Logs for Apache service: 'journalctl -u snap.nextcloud.apache.service'
Logs for Mysql service:  'journalctl -u snap.nextcloud.mysql.service'
```

## Manage Nextcloud-snap service using "get" und "set" 

**View configuration with "get":**

`sudo snap get nextcloud $SERVICE $SETTING`

Example:

`sudo snap get nextcloud.nextcloud.cron-interval`

**Configure service with "set":**

`sudo snap set nextcloud $SERVICE $SETTING=xxx`

Example:

`sudo snap set nextcloud.nextcloud.cron-interval=10`

----

## Start Nextcloud-snap service

`sudo snap start $SERVICE`

Example:

`sudo snap start nextcloud.nextcloud-cron`

## Restart Nextcloud-snap service

`sudo snap start $SERVICE`

Example:

`sudo snap restart nextcloud.nextcloud-cron`

## Stop Nextcloud-snap service

`sudo snap stop $SERVICE`

Example:

`sudo snap stop nextcloud.nextcloud-cron`

## Disable Nextcloud-snap service

`sudo snap stop --disable $SERVICE`

Example:

`sudo snap stop --disable nextcloud.renew-certs`

## Enable Nextcloud-snap service

`sudo snap start --enable $SERVICE`

Example:

`sudo snap start --enable nextcloud.renew-certs
`

