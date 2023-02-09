# Nextcloud.snap administration

## Nextcloud.occ commands/functions

Nextcloud.occ management console requires root or sudo privileges

```
$ sudo nextcloud.occ
```

### View status
```
$ sudo nextcloud.occ status
```

### View list of functions 
```
$ sudo nextcloud.occ list
```

### View apps in Nexcloud / view status of apps

```
$ nextcloud.occ app:list
Enabled:
  - accessibility: 1.1.0
  - activity: 2.8.2
  - calendar: 1.6.4
  - cloud_federation_api: 0.1.0
  - comments: 1.5.0
  - dav: 1.8.1
  - federatedfilesharing: 1.5.0
  - federation: 1.5.0
[..]
```

### Enable / disable apps

```
$ nextcloud.occ app:disable appname
$ nextcloud.occ app:enable appname
```

### Update apps

```
$ nextcloud.occ app:update appname
```

#### update all apps

```
$ nextcloud.occ app:update --all
spreed new version available: 5.0.3
spreed updated
```

### Reset user password

```
$ nextcloud.occ user:resetpassword USERNAME
Enter a new password: 
Confirm the new password: 
Successfully reset password for USERNAME
```

### Add user

```
$ nextcloud.occ user:add USERNAME
```

### Repair Nextcloud

```
sudo nextcloud.occ maintenance:repair
```
----
## Backup/Export

Export Nextcloud-snap incl. database, apps and configuration:

`$ sudo nextcloud.export` see `--help` for options

INFO: Backup path `/var/snap/nextcloud/common/backups/yyymmdd-hhmmss`.

## Restore/Import

`$ sudo nextcloud.import full/path/to/export/yyymmdd-hhmmss` see `--help` for options

- include full path `/var/snap/nextcloud/common/backups/yyymmdd-hhmmss` required for restore

----
