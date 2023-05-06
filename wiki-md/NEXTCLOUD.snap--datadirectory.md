# Nextcloud-snap, change data directory

## 1. Removable media

[Official Documentation](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Change-data-directory-to-use-another-disk-partition)

This can be any device (e.g. external-disk-partition, NFS-network mount, SSHFS-network mount etc.). 
The device should be available at system boot and mounted by `/etc/fstab`.

Ensure USB-boot is disabled in BIOS or use the `--nofail` option in `/etc/fstab` to ensure headless reboot, especially when connecting an external USB-device


### Connect removable media
[Removable media](https://github.com/nextcloud-snap/nextcloud-snap/blob/master/README.md#removable-media) **must** be mounted to either `/media` or `/mnt` as **root** with **root** permissions, also see [Snap confinement](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--snap-confinement.md#snap-confinement-in-nextcloud-snap)

```
$ sudo snap connect nextcloud:removable-media

```
