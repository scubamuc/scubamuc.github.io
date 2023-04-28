# Managing Nextcloud-snap with Snap

#### [Snap Documentation](https://snapcraft.io/docs)

#### [Nextcloud-snap & Ubuntu](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Why-Ubuntu-is-the-only-supported-distro)

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

## [Snap snapshot](https://github.com/scubamuc/scubamuc.github.io/blob/scubamuc/wiki-md/NEXTCLOUD.snap--backup_snap-snapshot.md#nextcloud-snap-snapshot)
