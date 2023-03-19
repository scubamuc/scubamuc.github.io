# Nextcloud-snap -- config.php Settings

Some Nextcloud-snap settings are best done directly in the `config.php` configuration file. Whilst the default configurations are mostly fine, it may be necessary to fine tune Nextcloud-snap.
[Nextcloud configuration parameters](https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/config_sample_php_parameters.html#configuration-parameters)

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

Default documents, files and folders for new users may be placed in a "skeleton" directory. Thus new users will find documents files an folders in their Nextcloud upon first login.
Create a skeleton directory ` /var/snap/nextcloud/common/skeleton `
```
sudo mkdir /var/snap/nextcloud/common/skeleton
```
Add skeleton directory path in `config.php`
```
'skeletondirectory' => '/var/snap/nextcloud/common/skeleton',
```

### Setting **default_phone_region**
[country codes](https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/config_sample_php_parameters.html#user-experience)
```
'default_phone_region' => 'DE',
```

### Setting default language for all/new users
[country codes](https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/config_sample_php_parameters.html#user-experience)
```
'default_language' => 'de',
```

### Setting default kocale
[country codes](https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/config_sample_php_parameters.html#user-experience)
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
