#!/bin/bash
# neuen Rechnernamen eintragen
# bestehender Rechnername ist $hostn
hostn=$(cat /etc/hostname)

# zeige den bestehenden Rechnernamen
echo "Der derzeitige Rechnername ist $hostn"

# Abfrage nach neuem Rechnernamen $neuerhost
echo "Gebe den neuen Rechnernamen ein: "
read neuerhost

# Rechnernamen eintragen in /etc/hosts & /etc/hostname
sudo sed -i "s/$hostn/$neuerhost/g" /etc/hosts
sudo sed -i "s/$hostn/$neuerhost/g" /etc/hostname

# zeige den veränderten Rechnenamen
echo "Der neue Rechnernamen ist $neuerhost"

# neuen Rechnernamen übernehmen
read -s -n 1 -p "Übernehmen mit beliebiger Taste"
sudo hostname -F /etc/hostname 

# mit beliebiger Taste neustarten
read -s -n 1 -p "Beliebige Taste zum Neustart"
sudo reboot
