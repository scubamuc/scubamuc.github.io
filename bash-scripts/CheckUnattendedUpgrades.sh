#!/bin/bash
##############################################################
## -- SCUBA --
## Script -scubamuc- https://scubamuc.github.io/ 
##############################################################
# Check and enable unattended upgrades

# Check if user is root
if [ "$(id -u)" != "0" ]; then
   echo "You must be root to run this script." 1>&2
   exit 1
fi

# Check if unattended upgrades is installed
if ! dpkg-query -W unattended-upgrades &>/dev/null; then
   echo "Unattended upgrades will need to be installed. Issue command 'apt install unattended-upgrades'"
   exit 1
fi

# Initialise unattended upgrade using config file /etc/apt/apt.conf.d/50unattended-upgrades
sed -i 's/^//' /etc/apt/apt.conf.d/50unattended-upgrades

# Configure update and upgrade in configuration file /etc/apt/apt.conf.d/20auto-upgrades
echo 'APT::Periodic::Update-Package-Lists "1";' > /etc/apt/apt.conf.d/20auto-upgrades
echo 'APT::Periodic::Unattended-Upgrade "1";' >> /etc/apt/apt.conf.d/20auto-upgrades

echo "Unattended Upgrades is enabled."
