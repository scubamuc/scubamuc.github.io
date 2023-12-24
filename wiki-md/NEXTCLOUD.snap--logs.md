# Nextcloud-snap logs

Nextcloud-snap log locations:
```
Logs for Nextcloud: `/var/snap/nextcloud/current/logs/nextcloud.log`
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
### [@Kyrofa's blog](https://kyrofa.com/posts/monitoring-a-nextcloud-snap-upgrade/)

The Nextcloud-snap has several services contained within it. There are four that are most important for upgrade purposes:

  +  MySQL (nextcloud.mysql)
  +  PHP (nextcloud.php-fpm)
  +  Apache (nextcloud.apache)
  +  Nextcloud Fixer (nextcloud.nextcloud-fixer)

#### MySQL
```
$ snap logs -f nextcloud.mysql
```

#### PHP
```
$ snap logs -f nextcloud.php-fpm
```

#### Apache
```
$ snap logs -f nextcloud.apache
```

#### Nextcloud Fixer
```
$ snap logs -f nextcloud.nextcloud-fixer
```

----

# Nextcloud-snap services

See [Nextcloud-snap services](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--services.md)

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

