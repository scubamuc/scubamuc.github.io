# Managing Nextcloud-snap with Nextcloud management console

**OCC** (**O**wn **C**loud **C**onsole) is a commandline management interface requiring root privileges and is accessed from the Nextcloud-snap host shell
![grafik](https://user-images.githubusercontent.com/54933878/224549354-c5609668-1ad1-4572-ac9a-14c681e612ad.png)

## Nextcloud management console usage

```
$ sudo nextcloud.occ
```
> @kyrofa 
> Some systems don't add /snap/bin to the PATH. Try `sudo /snap/bin/nextcloud.occ`

### Nextcloud management console help

```
$ sudo nextcloud.occ --help
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
$ sudo nextcloud.occ app:list
```

### Enable / disable apps

```
$ sudo nextcloud.occ app:disable appname
$ sudo nextcloud.occ app:enable appname
```

### Update apps

```
$ sudo nextcloud.occ app:update appname
```

### Update all apps

```
$ sudo nextcloud.occ app:update --all
```

### Reset user password

```
$ nextcloud.occ user:resetpassword USERNAME
Enter a new password: 
Confirm the new password: 
Successfully reset password for USERNAME
```

### Reset Admin Password
```
$ sudo nextcloud.occ user:resetpassword admin
```

### Add user

```
$ sudo nextcloud.occ user:add USERNAME
```

### Repair Nextcloud

```
$ sudo nextcloud.occ maintenance:repair
```
