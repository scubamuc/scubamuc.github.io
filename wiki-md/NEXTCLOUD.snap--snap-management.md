# Using Snap

## Snap manual pages
```
man snap
```

## Snap help
```
snap --help
```
![grafik](https://user-images.githubusercontent.com/54933878/235139733-f2cc0b60-eebc-491a-8265-999506ffd75c.png)

### Contextual help
```
snap <command> --help
```
also
```
snap <command> <option> --help
```

----
# Managing Nextcloud-snap with Snap

**Documentation and further reading:**

+ #### [Introduction to snaps](https://ubuntu.com/core/services/guide/snaps-intro)

+ #### [Snap Documentation](https://snapcraft.io/docs)

+ #### [Nextcloud-snap on Ubuntu](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Why-Ubuntu-is-the-only-supported-distro)

+ #### [Nextcloud-snap confinement](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--snap-confinement.md#snap-confinement-in-nextcloud-snap)

## View installed enabled Snaps on host
List enabled snaps on host
```
sudo snap list
```
![grafik](https://user-images.githubusercontent.com/54933878/235135007-1a0b8e50-1718-4c71-a243-f7994bff86f4.png)

### View all installed enabled/disabled (revisions) Snaps on host
List **all** snaps and revisions on host
```
sudo snap list --all
```
![grafik](https://user-images.githubusercontent.com/54933878/235135305-75853fd3-dc2c-4439-bb74-81cd01dfa1ae.png)

## Enable Nextcloud-snap
Enable Nextcloud-snap to start automatically
```
sudo snap enable nextcloud
```

## Disable Nextcloud-snap
Disable Nextcloud-snap from starting automatically
```
sudo snap disable nextcloud
```

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
Revert Nextcloud-snap to **last** retained revision
```
sudo snap revert nextcloud
```

### Revert Nextcloud-snap revision
Revert Nextcloud-snap to **defined** revision
```
sudo snap revert nextcloud --revision=xxxxx
```
![grafik](https://user-images.githubusercontent.com/54933878/235136149-6d90b10c-cbfd-45c2-9470-aff8b13ef904.png)

## Revert to stable channel 
[Release strategy](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Release-strategy)

Revert to stable channel

`sudo snap refresh nextcloud --stable`

or defined [channel](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Release-strategy)

`sudo snap refresh --channel=25/stable nextcloud`

----

# Nextcloud-snap logs
View Nextcloud snap logs

[Nextcloud-snap logging](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap_logs.md)

----

# Snap snapshots
[Snap snapshots documentation](https://snapcraft.io/docs/snapshots)

## Functions

![grafik](https://user-images.githubusercontent.com/54933878/235142637-6aecf2d1-52eb-44b8-a934-797f59a1231e.png)


## Backup Nextcloud-snap using Snap snapshots

* `sudo snap stop nextcloud`
* `sudo snap save nextcloud`
* find snapshot (`*.zip`) in `/var/lib/snapd/snapshots` and copy/move to backup media

## Restore Nextcloud-snap using Snap snapshots 

* when moving to new device, be sure to install nextcloud-snap first
* snap restore replaces previous installation incl. certs, DB and data
* see documentation in `snap restore --help` and [snapcraft](https://snapcraft.io/docs/snapshots#heading--restoring)

1\. copy snapshot (`*.zip`) from backup media to `/var/lib/snapd/snapshots`

2\. discover snapshot-ID using `snap saved`

3\. issue command `sudo snap restore "snapshot-ID"`

##### [SCUBA's rotating Snap snapshots skript](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--backup_snap-snapshot.md#nextcloud-snap-snapshot)

## Remove Snap snapshot
Remove Snap snapshot
```
sudo snap forget "snapshot-ID"
```

----
## Remove Snap from host

**WARNING!!** 

Be sure you want to remove Snap

*This is final! All snaps, revisions, backups and settings will be removed* 

This will completely remove Snap including all installed enabled/disabled snaps and all revisions from your system 
```
sudo apt remove snapd
```

### Remove Nextcloud-snap from host
This will remove Nextcloud-snap from your system but creates a revision 
```
sudo snap remove nextcloud
```

### Remove Nextcloud-snap completely from host
This will completely remove Nextcloud-snap and all revisions from your system
```
sudo snap remove --purge nextcloud
```

## Snap retention

Use Snap-option `refresh.retain` to set the maximum number of a Snap revisions stored by the system **after** the next refresh:

Value = Number of revesions retained
```
sudo snap set system refresh.retain=2
```

##### [Skript to Remove old Snap-revisions from host](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/SYSTEM--remove_old_snaps.md#remove-old-snasps)
