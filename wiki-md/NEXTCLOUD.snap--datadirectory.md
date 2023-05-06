# Nextcloud-snap, data directory

## [Removable media](https://github.com/nextcloud-snap/nextcloud-snap/blob/master/README.md#removable-media)

This can be any device (e.g. external-disk-partition, NFS-network mount, SSHFS-network mount etc.). 
The device should be available at system boot and mounted by `/etc/fstab`.

>**Tipp**: Ensure USB-boot is disabled in BIOS or use the `--nofail` option in `/etc/fstab` for headless boot, especially when connecting an external USB-device.

### Connect removable media

[Removable media](https://github.com/nextcloud-snap/nextcloud-snap/blob/master/README.md#removable-media) **must** be mounted to either `/media` or `/mnt` as **root** with **root** permissions and correctly connected to Snap, also see [Snap confinement](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--snap-confinement.md#snap-confinement-in-nextcloud-snap)

```
$ sudo snap connect nextcloud:removable-media

```
**common error message**
```
Internal Server Error

The server encountered an internal error and was unable to complete your request.
Please contact the server administrator if this error reappears multiple times, please include the technical details below in your report.
More details can be found in the server log.
```

## Change Data directory

[Official Documentation](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Change-data-directory-to-use-another-disk-partition)

The procedure to [**Move**](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Change-data-directory-to-use-another-disk-partition#if-you-have-already-created-an-admin-user) or [**Define**](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Change-data-directory-to-use-another-disk-partition#if-you-just-installed-the-snap-and-havent-created-an-admin-user-yet) the data directory in Nextcloud-snap is different when an **admin-user** exists or an **admin-user** still needs to be created:

a) [**Move**](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Change-data-directory-to-use-another-disk-partition#if-you-have-already-created-an-admin-user) data directory after installation (**admin-user** exists) in `/var/snap/nextcloud/current/nextcloud/config/config.php`

Example: `/var/snap/nextcloud/current/nextcloud/config/config.php`
```
 // ...
 'datadirectory' => '/media/nextcloud/data',
 // ...
 ```

**OR** 

b) [**Define**](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Change-data-directory-to-use-another-disk-partition#if-you-just-installed-the-snap-and-havent-created-an-admin-user-yet) data directory before installation (**admin-user** needs to be created) in `/var/snap/nextcloud/current/nextcloud/config/autoconfig.php`

Example: `/var/snap/nextcloud/current/nextcloud/config/autoconfig.php`
 ```
  // ...
 'directory' => '/media/nextcloud/data',
 // ...
 ```
 >**Tipp**: Ensure installation is completed and **admin-user** is created before rebooting

### Path to data directory

By default, the data directory Nextcloud-snap is `'datadirectory' => '/var/snap/nextcloud/common/nextcloud/data'`. So regardless which procedure is used, the path to the data directory must include the complete path including `.../data` because this is where the required `.ocdata` file will is located.

**common error message**
```
Error
Your data directory is invalid.

Ensure there is a file called ".ocdata" in the root of the data directory.
```
