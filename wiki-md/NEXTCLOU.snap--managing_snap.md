# Managing Nextcloud-snap with Snap

#### [Introduction to snaps](https://ubuntu.com/core/services/guide/snaps-intro)

#### [Snap Documentation](https://snapcraft.io/docs)

#### [Nextcloud-snap on Ubuntu](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Why-Ubuntu-is-the-only-supported-distro)

#### [Nextcloud-snap confinement](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--snap-confinement.md#snap-confinement-in-nextcloud-snap)

## view installed active Snaps on Host
```
sudo snap list
```

### view all installed Snaps on Host
```
sudo snap list --all
```

## start Nextcloud-snap
```
sudo snap start nextcloud
```

## stop Nextcloud-snap
```
sudo snap stop nextcloud
```

## restart Nextcloud-snap
```
sudo snap restart nextcloud
```

## update Nextcloud-snap manually

```
sudo snap refresh nextcloud
```

## revert Nextcloud-snap 

```
sudo snap revert nextcloud
```

### revert Nextcloud-snap revision

```
sudo snap revert nextcloud --revision=xxxxx
```

## backup Nextcloud-snap using snap snapshot

[documentation](https://snapcraft.io/docs/snapshots)

* snap stop 'nextcloud'
* snap save 'nextcloud'
* snap start 'nextcloud'
* find snapshot in `/var/lib/snapd/snapshots` and move to wherever

this works fine as weekly automatic (cronjob as root) job and has the added convenience of easy snap transfer to different server when needed. thus always 4 weeks of snap-snapshots on backup media.

## restoreNextcloud-snap snapshot using snap restore 

* when moving to new device, be sure to install nextcloud-snap first
* snap restore replaces previous installation incl. certs, DB and data
* see documentation in `man snap` and [snapcraft](https://snapcraft.io/docs/snapshots#heading--restoring)

1\. copy \*.zip from backup media to `/var/lib/snapd/snapshots`

2\. discover snapshot-ID using `snap saved`

3\. issue command `sudo snap restore "snapshot-ID"`

##### [Snap snapshot skript](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--backup_snap-snapshot.md#nextcloud-snap-snapshot)

----

### remove Nextcloud-snap from host
```
sudo snap remove nextcloud
```

### remove Nextcloud-snap completely
```
suco snap remove --purge nextcloud
```

### [remove old unused Snaps from host](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/SYSTEM--remove_old_snaps.md#remove-old-snasps)
