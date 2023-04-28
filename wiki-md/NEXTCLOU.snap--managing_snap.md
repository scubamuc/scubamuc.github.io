# Managing Nextcloud-snap with Snap

#### [Introduction to snaps](https://ubuntu.com/core/services/guide/snaps-intro)

#### [Snap Documentation](https://snapcraft.io/docs)

#### [Nextcloud-snap on Ubuntu](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Why-Ubuntu-is-the-only-supported-distro)

#### [Nextcloud-snap confinement](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--snap-confinement.md#snap-confinement-in-nextcloud-snap)

## View installed active Snaps on Host
```
sudo snap list
```

### View all installed Snaps on Host
```
sudo snap list --all
```

## Start Nextcloud-snap
```
sudo snap start nextcloud
```

## Stop Nextcloud-snap
```
sudo snap stop nextcloud
```

## Restart Nextcloud-snap
```
sudo snap restart nextcloud
```

## Update Nextcloud-snap manually

```
sudo snap refresh nextcloud
```

## Revert Nextcloud-snap 

```
sudo snap revert nextcloud
```

### Revert Nextcloud-snap revision

```
sudo snap revert nextcloud --revision=xxxxx
```

## [Nextcloud-snap logs](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap_logs.md)

----

## Backup Nextcloud-snap using snap snapshot

[Snap snapshot documentation](https://snapcraft.io/docs/snapshots)

* `sudo snap stop nextcloud`
* `sudo snap save nextcloud`
* `sudo snap start nextcloud`
* find snapshot in `/var/lib/snapd/snapshots` and move to wherever

## Restore Nextcloud-snap snapshot using snap restore 

* when moving to new device, be sure to install nextcloud-snap first
* snap restore replaces previous installation incl. certs, DB and data
* see documentation in `man snap` and [snapcraft](https://snapcraft.io/docs/snapshots#heading--restoring)

1\. copy \*.zip from backup media to `/var/lib/snapd/snapshots`

2\. discover snapshot-ID using `snap saved`

3\. issue command `sudo snap restore "snapshot-ID"`

##### [Rotating Snap snapshot skript](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--backup_snap-snapshot.md#nextcloud-snap-snapshot)

----

### Remove Nextcloud-snap from host
```
sudo snap remove nextcloud
```

### Remove Nextcloud-snap completely
```
suco snap remove --purge nextcloud
```

##### [Remove old Snap-revisions from host](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/SYSTEM--remove_old_snaps.md#remove-old-snasps)
