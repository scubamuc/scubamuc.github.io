# Nextcloud.snap -- config.php Settings

Some Nextcloud-snap settings are best done directly in the `config.php` configuration file. Whilst the default configurations are mostly fine, it may be necessary to fine tune Nextcloud-snap.

## Nextcloud.snap -- edit config.php

The configuration file may be edited by hand. Take good care to destinguish special characters, as a misplaced character can render your Nextcloud unusable. So be sure to bachkup the original `config.php` file before editing.

backup `config.php`:
```
sudo cp /var/snap/nextcloud/current/nextcloud/config/config.php config.php.bak
``` 
edit `config.php`: 
```
sudo nano /var/snap/nextcloud/current/nextcloud/config/config.php. 
```

### Skeleton for default dokuments, files and folders etc.

```
'skeletondirectory' => '/var/snap/nextcloud/common/skeleton',
```

### Setting **default_phone_region**

```
'default_phone_region' => 'DE',
```

### Setting default language for all/new users

```
'default_language' => 'de',
```

### Setting default kocale

```
'default_locale' => 'de_DE',
```

### Setting default folder for shares

```
'share_folder' => '/SHARE_with_others',
```

### Setting default folder for shared with me

```
'share_folder' => '/SHARED_with_me',
```
