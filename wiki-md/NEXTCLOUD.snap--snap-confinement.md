# Snap confinement

<https://snapcraft.io/docs/snap-confinement>

Snap confinement is a **security feature** which only works on Ubuntu OS. If you're using any non-Ubuntu OS with **snapd** installed this **feature** is entirely broken.

This is the reason [Nextcloud-snap](https://github.com/nextcloud-snap/nextcloud-snap) is officially not supported on non-Ubuntu OS.

Generally snap confinement prevents the Linux kernel from allowing the Snap to touch your home directory or any other directory outside of the confined snap.

So unless you allow the [Nextcloud snap to **access removable media**](https://github.com/nextcloud-snap/nextcloud-snap#removable-media) in `/mnt` or `/media` you will not be able to access any other directory.

So what can you do to access youre home directory from within the snap?

::: info
This has nothing to do with permissions. It's not a permissions issue, it's a *confinement* issue. The Linux kernel won't allow the snap to touch your home directory.

:::

## Bypass Snap confinement with SSH

::: success
**sftp to the rescue**

:::

In a Linux environment you will be able to bypass Snap confinement by using SSH/SFTP in Nextcloud-snap. 

[Enable external storage support](https://docs.nextcloud.com/server/25/admin_manual/configuration_files/external_storage_configuration_gui.html#enabling-external-storage-support) and happily connect to any local SSH server or directory using SFTP:

![grafik.png](.attachments.20447712/grafik.png)

Consider a self-hosting environment, where SSH ports is closed for external access (firewall/router) locally however SSH is available. 

Thus connecting to local servers from a locally hosted Nextcloud-snap is simple and even looping back to the home directory using SFTP is possible.
