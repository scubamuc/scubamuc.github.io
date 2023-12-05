# **SYSTEM--Unattended Upgrades**
https://ubuntu.com/server/docs/package-management

## Automatic security updates

How to set up automatic security updates on Ubuntu Server

[Automatic Security Updates in Ubuntu Server](https://help.ubuntu.com/community/AutomaticSecurityUpdates)

## Step 1: package installation


This package may already be installed on your server.

Install the unattended-upgrades package:

```
sudo apt install unattended-upgrades
```

## Step 2: configure automatic updates

Edit the configuration file:

```
sudo nano /etc/apt/apt.conf.d/50unattended-upgrades
```

Anything after a double slash “//” is a comments and has no effect. To “enable” a line, remove the double slash at the beginning of the line (replace with nothing or with spaces to keep alignment).

The most important: uncomment the “updates” line by deleting the two slashes at the beginning of it:

```
        "${distro_id}ESMApps:${distro_codename}-apps-security";
        "${distro_id}ESM:${distro_codename}-infra-security";
        "${distro_id}:${distro_codename}-updates";
```

Recommended: remove unused kernel packages and dependencies and make sure the system automatically reboots if needed by uncommenting and adapting the following lines: `Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";` ↑ You may have to add a semicolon at the end of this line. ↑

```
Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";
Unattended-Upgrade::Remove-Unused-Dependencies "true";
Unattended-Upgrade::Automatic-Reboot "true";
Unattended-Upgrade::Automatic-Reboot-Time "02:00";
```

To save your changes in nano, use Ctrl + O followed by Enter. To quit, use Ctrl + X.

## Step 3: enable automatic updates

Enable automatic updates and set up update intervals by running:

```
sudo nano /etc/apt/apt.conf.d/20auto-upgrades
```

In most cases, the file will be empty. Copy and paste the following lines:

```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "7";
APT::Periodic::AutocleanInterval "7";
```

The time interval are specified in days, feel free to change the values. Save changes and exit.

## Step 4: check if it works

You can see if the auto-upgrades work by launching a dry run:

```
sudo unattended-upgrades --dry-run --debug
```

Another way to check if automatic updates work is waiting a few days and checking the unattended upgrades logs:

`cat /var/log/unattended-upgrades/unattended-upgrades.log`

----
