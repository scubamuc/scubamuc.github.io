# Snap confinement in Nextcloud-snap 

[Snap confinement](https://snapcraft.io/docs/snap-confinement) is an **Ubuntu security feature**. This is the reason [Nextcloud-snap is not supported on non-**Ubuntu** distributions](https://github.com/nextcloud-snap/nextcloud-snap/wiki/Why-Ubuntu-is-the-only-supported-distro). So unless you allow the Nextcloud snap to **access** [**removable media**](https://github.com/nextcloud-snap/nextcloud-snap#removable-media) in `/mnt` or `/media` you will not be able to access any other directory outside of the confinement on **Ubuntu**. 

> @kyrofa
> INFO: 
> 
>This has nothing to do with permissions. It's not a permissions issue, it's a *confinement* issue. The Linux kernel won't allow the snap to touch your home directory or any other directory outside of the confinement
>
Snap confinement is a great security feature on **Ubuntu**, but what can you do to access your home directory from within your self-hosted [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap) instance?

## Bypass Snap confinement with SSH

### SFTP to the rescue

In a self-hosted environment on **Ubuntu** where SSH is available on the local network, yet blocked externally (firewall/router), you can bypass Snap confinement in [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap) by connecting to local servers via SFTP using [external storage app](https://docs.nextcloud.com/server/25/admin_manual/configuration_files/external_storage_configuration_gui.html#enabling-external-storage-support) to access any **local non-root** directory, such as your home directory.

![grafik](https://user-images.githubusercontent.com/54933878/218519969-ff6ae69f-1f29-4f2a-b1c7-a5429cebdac1.png)
