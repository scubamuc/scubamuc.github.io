#!/bin/bash
# change host name
# current host name is $hostn
hostn=$(cat /etc/hostname)

# display curren host name
echo "Your current hostname is: $hostn"

# request new hostname $neuerhost
echo "Enter your new hostname: "
read neuerhost

# add new host name in /etc/hosts & /etc/hostname
sudo sed -i "s/$hostn/$neuerhost/g" /etc/hosts
sudo sed -i "s/$hostn/$neuerhost/g" /etc/hostname

# display new host name
echo "Your ne host name is $neuerhost"

# confirm new host name
read -s -n 1 -p "Press any key to confirm new host name"
sudo hostname -F /etc/hostname 

# restart system if required
read -s -n 1 -p "Press any key to reboot system"
sudo reboot
