# Netzwerbrücke Konfiguration

## [LXD-SERVER](HEIMNETZ--LXD--SERVER.md?fileId=18893096)

### Netzwerkbrücke erstellen

```
$ sudo nmcli con add ifname br0 type bridge con-name br0 
$ sudo nmcli con add type bridge-slave ifname eno1 master br0 
$ nmcli connection show
```

**STP deaktivieren:**

```
$ sudo nmcli con modify br0 bridge.stp no 
$ nmcli con show 
$ nmcli -f bridge con show br0
```

Das letzte Kommando sollte eine Ausgabe wie unten hervorrufen:

```
bridge.mac-address: -- 
bridge.stp: no 
bridge.priority: 32768 
bridge.forward-delay: 15 
bridge.hello-time: 2 
bridge.max-age: 20 
bridge.ageing-time: 300 
bridge.multicast-snooping: yes
```

Anschließend wird die Standard Kabelverbindung1 getrennt und die Netwerkbrücke aktiviert.

```
$ sudo nmcli con down Kabelverbindung1
$ sudo nmcli con up br0
```

HINWEIS: Bei einem Systemneustart wird die Kabelverbindung vor der Brücke wieder aufgebaut. Um dies zu vermeiden und die Brücke nach dem Bootvorgang zu aktivieren, bietet sich an die Kabelverbindung im Network Manager zu entfernen. Das geht über die GUI. Alternativ kann eine Text-GUI in der Commandozeile aufgerufen werden mit:

`$ sudo nmtui`

### Feste IP Netzwerkbrücke vergeben

```
$ sudo nmcli connection modify br0 ipv4.addresses '192.168.2.200/24'
$ sudo nmcli connection modify br0 ipv4.gateway '192.168.2.1'
$ sudo nmcli connection modify br0 ipv4.dns '192.168.2.1'
$ sudo nmcli connection modify br0 ipv4.dns-search '9.9.9.9'
$ sudo nmcli connection modify br0 ipv4.method manual
```