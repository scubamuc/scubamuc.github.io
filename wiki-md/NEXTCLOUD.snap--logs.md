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

Viewing logs: `less` is `more`, from `head` to `tail` with `cat` or `bat` but `lnav` is the way to go!

```
sudo lnav /var/snap/nextcloud/common/nextcloud/data/nextcloud.log
```

### Nextcloud-snap error logs

example mysql errors:
```
/var/snap/nextcloud/current/logs/mysql_errors.log
```

### Apache logs

watch Apache logs:
```
sudo snap logs -f nextcloud.apache
```
Apache service logs:
```
journalctl -u snap.nextcloud.apache.service
```

----

# Nextcloud-snap services

list Nextcloud-snap services:
```
sudo snap services nextcloud
````

Nextcloud-snap services
```
nextcloud.apache           
nextcloud.logrotate        
nextcloud.mdns-publisher   
nextcloud.mysql            
nextcloud.nextcloud-cron   
nextcloud.nextcloud-fixer  
nextcloud.php-fpm          
nextcloud.redis-server     
nextcloud.renew-certs
```
### Service logs

example of sevice logs:
```
Logs for Apache service: 'journalctl -u snap.nextcloud.apache.service'
Logs for Mysql service:  'journalctl -u snap.nextcloud.mysql.service'
```
