#!/bin/bash
##############################################################
## -- SCUBA --
## Script -scubamuc- https://scubamuc.github.io/ 
##############################################################
# change host name
# current host name is $hostn
hostn=$(cat /etc/hostname)

# display current host name
echo "Your current hostname is: $hostn"

# request new hostname $newhost
echo "Enter your new hostname: "
echo ""
read newhost

# add new host name in /etc/hosts & /etc/hostname
sudo sed -i "s/$hostn/$newhost/g" /etc/hosts
sudo sed -i "s/$hostn/$newhost/g" /etc/hostname

# display new host name
echo "Your new host name is $newhost"

# confirm new host name
read -s -n 1 -p "Press any key to confirm new host name"
sudo hostname -F /etc/hostname 

# restart system if required
read -p "  Enter to reboot... Crtl+c to return --> relogin to confirm changes."
##read -s -n 1 -p "Press any key to reboot system"
sudo reboot
