# Managing Nextcloud-snap with Snap

#### [Introduction to snaps](https://ubuntu.com/core/services/guide/snaps-intro)

#### [Snap Documentation](https://snapcraft.io/docs)

#### [Nextcloud-snap on Ubuntu](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Why-Ubuntu-is-the-only-supported-distro)

#### [Nextcloud-snap confinement](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--snap-confinement.md#snap-confinement-in-nextcloud-snap)

## Using Snap

## Snap manual pages
```
man snap
```

## Getting help
```
snap --help
```
![grafik](https://user-images.githubusercontent.com/54933878/235139733-f2cc0b60-eebc-491a-8265-999506ffd75c.png)

### Contextual help
```
snap [OPTION] --help
```
Example:
```
snap info --help
```
![grafik](https://user-images.githubusercontent.com/54933878/235140263-b354a6fa-8d28-434b-9012-a5bdb0c09772.png)

----

## View installed active Snaps on Host
List all active snaps installed on host
```
sudo snap list
```
![grafik](https://user-images.githubusercontent.com/54933878/235135007-1a0b8e50-1718-4c71-a243-f7994bff86f4.png)

### View all installed active/inactive (revisions) Snaps on Host
List all active snaps and revisions installed on host
```
sudo snap list --all
```
![grafik](https://user-images.githubusercontent.com/54933878/235135305-75853fd3-dc2c-4439-bb74-81cd01dfa1ae.png)

## Start Nextcloud-snap
Start Nextcloud-snap manually
```
sudo snap start nextcloud
```

## Stop Nextcloud-snap
Stop Nextcloud-snap manually
```
sudo snap stop nextcloud
```

## Restart Nextcloud-snap
Restart Nextcloud-snap manually
```
sudo snap restart nextcloud
```

## Update Nextcloud-snap
Update Nextcloud-snap manually
```
sudo snap refresh nextcloud
```

## Revert Nextcloud-snap 
Revert Nextcloud-snap to last retained revision
```
sudo snap revert nextcloud
```

### Revert Nextcloud-snap revision
Revert Nextcloud-snap to retained revision
```
sudo snap revert nextcloud --revision=xxxxx
```
![grafik](https://user-images.githubusercontent.com/54933878/235136149-6d90b10c-cbfd-45c2-9470-aff8b13ef904.png)

## [Nextcloud-snap logging](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap_logs.md)

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

##### [SCUBA's Rotating Snap snapshot skript](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--backup_snap-snapshot.md#nextcloud-snap-snapshot)

----
## Remove Snap from host
This will completely remove `snapd` including all installed active/inactive snaps from your system 
```
sudo apt remove snapd
```

### Remove Nextcloud-snap from host
This will completely remove Nextcloud-snap from your system but creates a revision 
```
sudo snap remove nextcloud
```

### Remove Nextcloud-snap completely
This will completely remove Nextcloud-snap from your system
```
sudo snap remove --purge nextcloud
```

### Snap retention

Use Snap-option *refresh.retain* to set the maximum number of a Snap revisions stored by the system *after* the next refresh:

Value = Number of revesions retained
```
sudo snap set system refresh.retain=2
```

##### [Remove old Snap-revisions from host](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/SYSTEM--remove_old_snaps.md#remove-old-snasps)
