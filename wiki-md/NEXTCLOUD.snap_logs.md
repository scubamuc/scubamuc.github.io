# Nextcloud-snap Logs

Nextcloud-snap Logs befinden sich in folgenden Verzeichnissen:

```
Logs für Nextcloud:/var/snap/nextcloud/common/nextcloud/data/nextcloud.log
Logs für Apache2: /var/snap/nextcloud/current/apache/logs/
Logs für Redis: /var/snap/nextcloud/current/redis/redis.log
Logs für PHP-FPM: /var/snap/nextcloud/current/php/php-fpm.log
Logs für Certbot:/var/snap/nextcloud/current/certs/certbot/logs/letsencrypt.log
Logs für MySQL:/var/snap/nextcloud/current/mysql/localhost.sexy.domain
```

Logs ansehen mit folgendem Befehl, Bsp. \`nextcloud.log\`:

```
sudo tail -n1 /var/snap/nextcloud/common/nextcloud/data/nextcloud.log
```