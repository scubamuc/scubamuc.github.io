# **SYSTEM--Unattended Upgrades**

## Automatic updates

How to set up automatic updates on Ubuntu Server 20.04.x

Automatic Updates in Ubuntu Server

## Step 1: package installation

Install the unattended-upgrades package:

```
sudo apt install unattended-upgrades
```

This package may already be installed on your server.

## Step 2: configure automatic updates

Edit the configuration file (here with nano – replace with any other text editor):

```
sudo nano /etc/apt/apt.conf.d/50unattended-upgrades
```

The beginning of the configuration file should look like this:

Install unattended upgrades on Ubuntu Server

Anything after a double slash “//” is a comments and has no effect. To “enable” a line, remove the double slash at the beginning of the line (replace with nothing or with spaces to keep alignment).

The most important: uncomment the “updates” line by deleting the two slashes at the beginning of it:

```
"${distro_id}:${distro_codename}-updates";
```

Optional: You should uncomment and adapt the following lines to ensure you’ll be notified if an error happens:

```
Unattended-Upgrade::Mail "user@example.com";
Unattended-Upgrade::MailOnlyOnError "true";
```

Recommended: remove unused kernel packages and dependencies and make sure the system automatically reboots if needed by uncommenting and adapting the following lines: Unattended-Upgrade::Remove-Unused-Kernel-Packages "true"; ↑ You may have to add a semicolon at the end of this line. ↑

```
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
//APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Unattended-Upgrade "1";
```

The time interval are specified in days, feel free to change the values. Save changes and exit.

## Step 4: check if it works

You can see if the auto-upgrades work by launching a dry run:

```
sudo unattended-upgrades --dry-run --debug
```

The dry run should output something like this:

Unattended upgrades on Ubuntu Server 18.04 Bionic Beaver

Another way to check if automatic updates work is waiting a few days and checking the unattended upgrades logs:

cat /var/log/unattended-upgrades/unattended-upgrades.log

## Step 5: Log skript

create file in $USER/bin/ called `autoupdatelog.sh`

Copy and paste the following into the file:

```
  #!/bin/bash
### Logdatei für unattended Upgrades ###
echo
echo
echo "   ################################################################"
echo "   Hallo $USER die Logdatei für Unattended Upgrades wird angezeigt"
echo "   ****************************************************************"
echo
cat /var/log/unattended-upgrades/unattended-upgrades.log
```

make the file executable `chmod +x autoupdatelog.sh`
