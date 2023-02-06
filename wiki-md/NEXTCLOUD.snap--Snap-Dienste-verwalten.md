# Snap Dienste verwalten

<https://snapcraft.io/docs/service-management>

---

##### Eine Übersicht über bestehende Snap Dienste erhalten:

`sudo snap services $SNAPNAME`

Bsp. *nextcloud*

`sudo snap services nextcloud`

##### Eine Übersicht über Dienste-Logs erhalten:

`sudo snap logs $SNAPNAME`

Bsp. *nextcloud-cron*

`sudo snap logs nextcloud.nextcloud-cron`

##### Snap Dienste mit get und set konfigurieren

**Dienst Konfiguration anzeigen mit "get":**

`sudo snap get nextcloud $DIENST $EINSTELLUNG`

Bsp. *nextcloud-cron*

`sudo snap get nextcloud.nextcloud.cron-interval`

**Dienst Konfigurieren mit "set":**

`sudo snap set nextcloud $DIENST $EINSTELLUNG=xxx`

Bsp. *nextcloud-cron*

`sudo snap set nextcloud.nextcloud.cron-interval=10`

## disable renew-certs

```
sudo snap stop --disable certbot.renew
```