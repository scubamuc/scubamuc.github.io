## Add samba-shares, local shares as external-storage to nextcloud-snap

----

When using nextcloud-snap there are a couple of things to consider in order to add samba-shares and other network-shares as well as local-shares and USB-devices and HDD-devices as external-storage into your cloud instance.

### External-storage app

Ensure that the external-storage app is installed in your nextcloud instance. Refer to your nextcloud manual for installing apps in your nextcloud instance.

### Removable media

Also note that the interface providing the ability to access removable media is not automatically connected upon install, so if you'd like to use external storage (or otherwise use a device in `/media` for data), you need to give the snap permission to access removable media by connecting that interface:

```
sudo snap connect nextcloud:removable-media
```

### Configure samba on your host

Samba should be correctly installed and configured on the host running nextcloud-snap. Both SMB and CIFS file sharing protocol should be installed on the host. Refer to your distribution documentation for information. Similarly sharing protocolls such as sshfs, davfs etc. may be required.

----

Requirements;

### Create Mount-directory

```
sudo mkdir /media/devicename
```

or

```
sudo mkdir /media/mountpoint
```

### Mount device or share in FSTAB

Refer to your distribution documentation for mounting devices or shares using **fstab** into the /media/ directory.

You can mount a device or network-share using the **UUID** or the device name **/dev/sdb** etc.   
NOTE: The mount point should be in **/media/** or **/mnt/** in order to be available for nextcloud-snap.

Mount points added in `/etc/fstab` pointing to `/media/mountpoint` or `media/devicename` . Refer to your distribution documentation for editing important files with root privileges.

Examples for **fstab** mounts:

* **SMB/CIFS** (samba network share)

```
//network.local/SHARE /media/mountpoint cifs vers=3.0,username=username,password=password,iocharset=utf8,filemode=0770,dirmode=0770 0 0
```

* **/dev/sdbx** (NTFS USB-Device or HDD)

```
/dev/sdbx /media/mountpoint ntfs defaults,nls=utf8,umask=007,gid=46 0 0
```

* **UUID** (EXT4 USB-Device or HDD)

```
UUID=device-xxx-xxx-xxx-id /media/DEVICENAME ext4 defaults, 0 0
```

**Other shares:**

**sshfs** -- please ensure that **sshfs** FUSE-Module is correctly installed on the machine and refer to the distribution documentation for mounting in `/etc/fstab`.  
**davfs** -- please ensure that **davfs** and/or davfs2 is correctly installed on the machine and refer to the distribution documentation for mounting in `/etc/fstab`.  
**sftp/ftps** -- please ensure that **FTP**/s and/or **SSH** is correctly installed on the machine and refer to the distribution documentation for mounting in `/etc/fstab`.

**Softlinks:**

Note that you can also link a local directory or share into the /media/ or /mnt/ directory using a softlink. Please refer to your distribution documentation for information on creating softlinks.

Example of a softlink of a local directory:

```
 sudo ln -s /home/USER/Documents /media/LINKNAME
```

----

### Configure nextcloud external-storage-app

In order to make the above devices or shares available to nextcloud users or groups the external-device or network-share must be added in **Settings --> External Storage**. Please also refer to your nextcloud manual.

1. Enter a name in the field **Folder-name** or path to folder in nextcloud e.g. */Documents/Foldername*.
2. For storage type select **Local**.
3. For authentication select **none** or enter user or network authentication. Note: authentication is not necessary for **fstab** mounts as root (please refer to **fstab** documentation)
4. For configuration enter the path to mount point e.g. **/media/DEVICENAME** or **/media/LINKNAME** etc. Please see above.
5. User and group permissions as well as read/write permissions may be configured in the options menu in external-storage app.
6. Mount options may be configured in the options menu in external-storage app.

----
