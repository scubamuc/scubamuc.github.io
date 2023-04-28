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

## [Snap snapshots](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--backup_snap-snapshot.md#nextcloud-snap-snapshot)

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
