# Snap confinement in [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap) 

<https://snapcraft.io/docs/snap-confinement>

https://github.com/nextcloud-snap/nextcloud-snap/wiki/Why-Ubuntu-is-the-only-supported-distro

Snap confinement is a **security feature** which only works on Ubuntu OS. If you're using any non-Ubuntu OS with **snapd** installed this **feature** does not work. This is the reason [Nextcloud-snap is not supported on non-Ubuntu OS](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Why-Ubuntu-is-the-only-supported-distro). So unless you allow the [Nextcloud snap to **access removable media**](https://github.com/nextcloud-snap/nextcloud-snap#removable-media) in `/mnt` or `/media` you will not be able to access any other directory outside of the confinement. Snap confinement is a great security feature, but what can you do to access your home directory from within your self-hosted [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap)  instance?

> INFO: 
> 
>This has nothing to do with permissions. It's not a permissions issue, it's a *confinement* issue. The Linux kernel won't allow the snap to touch your home directory or any other directory outside of the confinement
>

## Bypass Snap confinement with SSH

### SFTP to the rescue

In a Linux environment you can bypass Snap confinement in [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap) by using the [external storage app](https://docs.nextcloud.com/server/25/admin_manual/configuration_files/external_storage_configuration_gui.html#enabling-external-storage-support) to access any **local non-root** directory using SFTP. 

![grafik](https://user-images.githubusercontent.com/54933878/218519969-ff6ae69f-1f29-4f2a-b1c7-a5429cebdac1.png)

In a self-hosted environment where SSH is available locally, yet blocked externally (firewall/router), connecting to local servers from your self-hosted [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap) instance is simple. Even looping back to the your home directory is possible using SFTP.
