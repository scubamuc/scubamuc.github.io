# Nextcloud.occ management console 

Nextcloud.occ management console requires root privileges and is accessed in the server shell

## Nextcloud management console usage

```
$ sudo nextcloud.occ
```

### Nextcloud management console help

```
$ sudo nextcloud.occ
```

### View status
```
$ sudo nextcloud.occ status
```

### List console functions 
```
$ sudo nextcloud.occ list
```

### View apps in Nexcloud

```
$ nextcloud.occ app:list
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

### Update all apps

```
$ nextcloud.occ app:update --all
```

### Reset user password

```
$ nextcloud.occ user:resetpassword USERNAME
Enter a new password: 
Confirm the new password: 
Successfully reset password for USERNAME


```
### Reset Amin Password
```
$ sudo nextcloud.occ user:resetpassword admin
```

### Add user

```
$ nextcloud.occ user:add USERNAME
```

### Repair Nextcloud

```
$ sudo nextcloud.occ maintenance:repair
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
