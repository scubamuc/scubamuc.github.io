# Snap confinement

<https://snapcraft.io/docs/snap-confinement>

Snap confinement is a **security feature** which only works on Ubuntu OS. If you're using any non-Ubuntu OS with **snapd** installed this **feature** is entirely broken.

This is the reason [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap) is officially not supported on non-Ubuntu OS.

Generally snap confinement prevents the Linux kernel from allowing the Snap to touch your home directory or any other directory outside of the confined snap.

So unless you allow the [Nextcloud snap to **access removable media**](https://github.com/nextcloud-snap/nextcloud-snap#removable-media) in `/mnt` or `/media` you will not be able to access any other directory.

So what can you do to access youre home directory from within the snap?

> INFO: 
> 
>This has nothing to do with permissions. It's not a permissions issue, it's a *confinement* issue. The Linux kernel won't allow the snap to touch your home >directory.
>

## Bypass Snap confinement with SSH

**sftp to the rescue**

In a Linux environment you will be able to bypass Snap confinement by using SSH/SFTP in Nextcloud-snap. 

[Enable external storage support](https://docs.nextcloud.com/server/25/admin_manual/configuration_files/external_storage_configuration_gui.html#enabling-external-storage-support) and happily connect to any local SSH server or directory using SFTP:

![grafik](https://user-images.githubusercontent.com/54933878/218519969-ff6ae69f-1f29-4f2a-b1c7-a5429cebdac1.png)

In a [self-hosted](https://scubamuc.github.io/) environment, where SSH is not available for external access (firewall/router) locally however SSH is available. 

Thus connecting to local servers from a locally hosted Nextcloud-snap is simple and even looping back to the home directory is possible using SFTP.
