### HowTo add LOCAL-FILES or SAMBA-Shares using CIFS or SSHFS in Nextcloud-snap

You are using nextcloud-snap on a local machine in your network. Your nextcloud-snap is configured and secured correctly and is available from the internet.

---

#### Removable media has been enabled:

```
$ sudo snap connect nextcloud:removable-media
```

Once removable media has been enabled, any directory in $/media/ can be made available in your nextcloud-snap instance. This includes:

* any USB-Device or external HDD mounted into the $/media/ directory
* any SMB, SSHFS directory mounted into the $/media/ directory
* any symlink from the local Machine ponting into the $/media/ directory

This HowTo describes two options for mounting Devices/Shares into the $/media/ directory on the local nextcloud-snap machine;

* using manual mount
* using automatic mount via FSTAB

---

##### 1. Prepare the nextcloud-snap machine

In order to mount external devices/shares into the $/media/ directory you will need to create the MOUNT directory first:

```
$ sudo mkdir /media/DEVICENAME
```

##### 2. USB-Device or external HDD

###### Mount the DEVICE manually:

```
sudo mount -t ntfs -o umask=007,gid=046,uid=0,nls=utf8 /dev/sda1 /media/DEVICENAME
```

###### Mount the DEVICE automatically via **fstab**

Edit the $/etc/fstab file using your preferred editor e.g.

```
$ sudo nano /etc/fstab
```

add the DEVICE at the end of the FSTAB File (*please refer to fstab instuctions*):

```
# DEVICENAME
/dev/sda1 /media/DEVICENAME ext4 noauto,user,noatime 0 2
```

Reboot the system or mount via commandline:

```
$ sudo mount DEVICENAME
```