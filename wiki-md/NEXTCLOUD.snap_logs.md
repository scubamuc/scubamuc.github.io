# Nextcloud-snap logs

Nextcloud-snap log locations:
```
Logs for Nextcloud: `/var/snap/nextcloud/common/nextcloud/data/nextcloud.log`
Logs for Apache2:   `/var/snap/nextcloud/current/apache/logs/`
Logs for Redis:     `/var/snap/nextcloud/current/redis/redis.log`
Logs for PHP-FPM:   `/var/snap/nextcloud/current/php/php-fpm.log`
Logs for Certbot:   `/var/snap/nextcloud/current/certs/certbot/logs/letsencrypt.log`
Logs for MySQL:     `/var/snap/nextcloud/current/mysql/localhost.sexy.domain`
```

View logs: `less` is `more`, from `head` to `tail` with `cat` or `bat` but `lnav` is the way to go!

```
sudo lnav /var/snap/nextcloud/common/nextcloud/data/nextcloud.log
```
