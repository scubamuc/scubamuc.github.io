# JellyFin Mediaserver snap

<https://github.com/IsaacJT/jellyfin-snap>

## Install JellyFin Mediaserver as a snap

Due to [Snap confinement](https://snapcraft.io/docs/snap-confinement), [removable media](https://github.com/nextcloud-snap/nextcloud-snap#removable-media) must be mounted in `/mnt` or `/media` directory. 

### Install JellyFin snap:

```
sudo snap install itrue-jellyfin
```

### Connect snap interfaces:

1. Connect Home directory:

   ```
   sudo snap connect itrue-jellyfin:home
   ```
2. Connect removable media:

   ```
   sudo snap connect itrue-jellyfin:removable-media
   ```
3. Connect mount-observe (file watcher):

   ```
   sudo snap connect itrue-jellyfin:mount-observe
   ```
4. Connect (optional) firewall control:

   ```
   sudo snap connect itrue-jellyfin:firewall-control
   ```

## Connect to JellyFin media server via browser in your local Network:

 * http://localhost:8096
 * http://your.server.ip.address:8096
 * http://servername.local:8096

## Connect to JellyFin media server via client:

https://jellyfin.org/downloads/clients/


