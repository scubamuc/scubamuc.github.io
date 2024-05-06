# LXD - LXC Wiki

<https://documentation.ubuntu.com/lxd/en/latest/#>

## LXD Grundlagen

1. <https://linuxcontainers.org/lxd/getting-started-cli/>
2. <https://blog.jrehkemper.de/index.php/lxd-linux-container/#SnapInstallation>
3. <https://discourse.world/h/2020/04/09/Basic-LXD-Features-Linux-Container-Systems#vybor-faylovoy-sistemy-dlya-storage-pool-navigaciya>
4. https://gist.github.com/berndbausch/a6835150c7a26c88048763c0bd739be6
5. <https://stgraber.org/2016/03/19/lxd-2-0-your-first-lxd-container-312/>

LXD kann sehr einfach als "snap" installiert werden. LXD ist eine Management-Software zur Verwaltung von LXC (Linux-Containers). Mit der Installation von LXD werden alle notwendigen Programmteile für LXC installiert.

* **Netzwerkbrücke br0 konfiguration.** Siehe [LXD-LXC-Netzwerkbrücke.](LXD-LXC-Netzwerkbr%C3%BCcke.md?fileId=18893922)

Damit LXC-Container eine IP-Adresse des Heimnetzwerks erhalten bietet sich eine [Netzwerkbrücke ](LXD-LXC-Netzwerkbr%C3%BCcke.md?fileId=18893922)an. Anschließend erhalten alle Container eine IP von DHCP (FritzBox) und können über die Fritzbox fest zugeteilt werden.

* **Netzwerk macvlan konfiguration**: siehe [LXD-LXC-MACVLAN](LXD-LXC-MACVLAN.md?fileId=18934405)

Alternativ können LXC-Container mittels "[**macvlan**](SYSTEM--LXD-LXC-MACVLAN.md?fileId=18934405)" direkt eine IP-Adresse vom DHCP (FritzBox) erhalten. Hierbei bleibt die Netzwerkkarte des Hostsystems erhalten und wird nicht wie bei der Netzwerkbrücke ersetzt. **ACHTUNG**: *keine Verbindung zwischen Host und Container möglich!*

1. **LXD installation:** `$ sudo snap install lxd`
2. **LXD initialisieren:** `$ sudo lxd init` es folgt eine Initialisierungs Abfrage dies ist für die Erstinitialisierung notwendeig. Hierdurch wird das "default" Profil angelegt. Das "default" Profil kann *nicht* gelöscht werden.

---

## LXD Initialisierung

Die LXD Initialisierung erzeugt die Erstkonfiguration mit einem **default** Projekt und einem **default** Profil. Das Initialisierungsprogramm wird mittels `sudo lxd init` gestartet. Das Programm **lxd init** unterstützt dabei eine erste Auswahl an Standardeinstellungen vorzunehmen. Die folgenden Initialisierungsfragen können wie folgt übernommen werden:

`sudo lxc init`

**Initialisierungsabfragen für das "default" Profil**:
```text
- Would you like to use LXD clustering? (yes/no) [default=no]: --> no
- Do you want to configure a new storage pool? (yes/no) [default=yes]: --> yes
- Name of the new storage pool [default=default]: --> POOLNAME
- Name of the storage backend to use (dir, lvm, zfs) [default=zfs]: --> zfs
- Would you like to create a new local network bridge? (yes/no) [default=yes]: --> no
- Would you like LXD to be available over the network? (yes/no) [default=no]: --> no
- Would you like stale cached images to be updated automatically? (yes/no) [default=yes]: --> yes
- Would you like a YAML "lxd init" preseed to be printed? (yes/no) [default=no]: --> no
```
---

### **LXD Benutzer hinzufügen**

Damit ohne "sudo" LXC verwendet werden kann, muss der Benutzer zur Gruppe **lxd** hinzugefügt werden.

`$ sudo adduser $USER lxd`

### **Containerauswahl auflisten**

`$ lxc image list ubuntu:`

### **Ersten Container installieren**

`` `$ lxc launch ubuntu:22.04 CONTAINERNAME ``

---

## LXC Profile

Jeder Container kann ein oder mehrere Profile erhalten. Der Wert des Profils, welches zuletzt dem Container zugewiesen wird, **sticht**. Die Profilauswahl kann beim erstellen des Containers ausgewählt werden mit:

`lxc create 'IMAGENAME' 'CONTAINERNAME' -p 'PROFILNAME'`

**HINWEIS**: Das **default** Profil kann nicht *gelöscht* oder *umbenannt* werden.

Standardmäßig wird das **default** Profil zugewiesen wenn ein Container erstellt wird. Das **default** Profil kann jedoch beliebig kopiert werden und anschließend angepasst werden:

* **Profile auflisten**

  `lxc profile list`
* **Profil erstellen**

  `lxc profile create 'PROFILNAME'`
* **Profil umbenennen**

  `lxc profile rename 'PROFILNAME' 'NEUER-PROFILNAME'`
* **Profil kopieren**

  `lxc profile copy 'PROFILNAME' 'NEUER-PROFILNAME'`
* **Profil Konfiguration anzeigen**

  `lxc profile show 'PROFILNAME'`
* **Profil editieren**

  `lxc profile edit 'PROFILNAME'`
* **Profil entfernen**

  `lxc profile remove 'PROFILNAME'`
* **Profil Wert holen**

  `lxc profile get 'PROFILNAME' 'WERT'`
* **Profil Wert setzen**

  `lxc profile set 'PROFILNAME' 'WERT'`
* **Profil für Container zuordnen**

  `lxc profile assign 'PROFILNAME' 'CONTAINERNAME'`
* **Profil zum Container hinzufügen**

  `lxc profile add 'PROFILNAME' 'CONTAINERNAME'`

Weitere Kommandos und Optionen siehe `lxc profile --help`

---

### **LXC Projekte**

Eine weiter Unterteilung verschiedener Container mit verschiedenen Profilen in **Projekte** ist ebenfalls möglich. Siehe `lxc project --help`

---

## LXC Bedienung

* **LXC verfügbare Images:**

  `$ lxc image list images:`
* **LXC verfügbare Images im ubuntu Repository:** mit Namen "ubuntu"

  `$ lxc image list images: ubuntu`

  oder "ubuntu focal"

  `$ lxc image list images: ubuntu focal`
* **LXC verfügbare Container:**

  `$ lxc remote list`
* **LXC container holen und ausführen:**

  `$ lxc launch images:ubuntu/focal CONTAINERNAME`
* **LXC container Übersicht:**

  `$ lxc list`
* **LXC-container Befehl ausführen:**

  `$ lxc exec CONTAINERNAME -- BEFEHL`
* **LXC-container in die Container shell wechseln:**

  `$ lxc shell CONTAINERNAME`
* **LXC-container erstellen:**

  `$ lxc create`
* **LXC-container starten:**

  `$ lxc start CONTAINERNAME`
* **LXC-container stoppen:**

  `$ lxc stop CONTAINERNAME`
* **LXC-container info:**

  `$ lxc info CONTAINERNAME`
* **LXC-container löschen:**

  `$ lxc delete CONTAINERNAME`
* **LXC-container kopieren:**

  `$ lxc copy CONTAINERNAME NEUCONTAINERNAME`
* **LXC-container klonen:**

  `$ lxc clone CONTAINERNAME NEUCONTAINERNAME`
* **LXC-container umbenennen:**

  `$ lxc move CONTAINERNAME NEUCONTAINERNAME`
* **LXC-container portweiterleitung Port 80:**

```
lxc config device add mycontainer myport80 proxy listen=tcp:0.0.0.0:80 connect=tcp:127.0.0.1:80
```

**LXC-container portweiterleitung Port 443:**

```
lxc config device add mycontainer myport443 proxy listen=tcp:0.0.0.0:443 connect=tcp:127.0.0.1:443
```

* **LXC-container autostart bei boot:**

  `$ lxc config set CONTAINERNAME boot.autostart "1"`

  `$ lxc config set CONTAINERNAME boot.autostart false`
* **LXC-container autostart bei boot 30 Sekunden warten:**

  `$ lxc config set CONTAINERNAME boot.autostart.delay 30`
* **LXC-container autostart bei boot reihenfolge:**

  `$ lxc config set CONTAINERNAME boot.autostart.docker-compose up -dorder 0...1-9`

---

## LXC Snapshots erstellen

* **LXC-container Snapshot erstellen:**

  `$ lxc snapshot CONTAINERNAME/SNAPSHOTNAME`
* **LXC-container bestehenden Snapshot überschreiben**

  `§ lxc snapshot CONTAINERNAME/SNAPSHOTNAME --reuse`

LXD bietet außerdem die Möglichkeit automatische Snapshots erstellen zu lassen. Zusätzlich lässt sich ein Löschdatum setzen, sodass zum Beispiel täglich ein Snapshot gemacht wird und nach 4 Wochen wieder automatisch gelöscht wird um Speicherplatz freizugeben.

```
lxc config set <CONTAINERNAME> snapshots.expiry "4w" #Löscht in 4 Wochen
lxc config set <CONTAINERNAME> snapshots.schedule "0 0 * * *"
#Zeitmuster wie bei Cron (Minute, Stunde, Tag, Monat, Wochentag
#"0 0 * * *" -> jeden Tag um 00:00
lxc config set <CONTAINERNAME> snapshots.schedule.stopped false
lxc config set <CONTAINERNAME> snapshots.pattern "snapshot-%d" #name
```

* **LXC-container snapshot auflisten:**

  `$ lxc info CONTAINERNAME`
* **LXC-container snapshot löschen:**

  `$ lxc delete CONTAINERNAME/SNAPSHOTNAME`
* **LXC-container snapshot wiederherstellen:**

  `$ lxc restore CONTAINERNAME SNAPSHOTNAME`
* **LXC-container snapshot importieren:**

  `$ lxc copy CONTAINERNAME/SNAPSHOTNAME NEUCONTAINERNAME`

---

## LXC Image erstellen

<https://techgoat.net/index.php?id=60>

Ein LXC- Container kann als Image exportiert und importiert werden. Dies ist sinnvoll um eine Dauerhafte Version seines Containers auf ein anderes Laufwerk weg zu sichern. Ein Image kann auch als VM importiert werden und so als Bsp. KVM-Image bereitgestellt werden.

Zuerst muss ein Snapshot des LXC-Containers erstellt werden. Anschließend wird der Snapshot des Containers zu einem Image umgewandelt.

1. **LXC-Container beenden:**

   `$ lxc stop CONTAINERNAME`
2. **LXC-Container Snapshot erstellen:**

   `$ lxc snapshot CONTAINERNAME/SNAPSHOTNAME`
3. **LXC-Conainer-Snapshot als Image konvertieren:**

   `$ lxc publish CONTAINERNAME/SNAPSHOTNAME --alias IMAGENAME`
4. **Image exportieren:**

   `$ lxc image export IMAGENAME /home/$USER/BACKUPPFAD/`

## Image als neuen Container verwenden

Das so erstellte Image kann nun als Vorlage für neue Container oder VM's verwendet werden.

* **Image als neuen LXC-Container verwenden:**

  `$ lxc launch IMAGENAME CONTAINERNAME`
* **Image als VM ausführen:**

  `$ lxc launch IMAGENAME VMNAME --vm`
* **Image in KVM oder QEMU importieren:**

  `Siehe Anleitung von KVM oder QEMU`

---

## LXC-Container Ressourcen definieren

#### LXC-Container -- Speicher definieren:

```
lxc config set CONTAINERNAME limits.memory 100MB
```

Verwende GB statt MB um den Wert fest zu legen.

#### LXC-Container -- CPU Anzahl definieren:

```
lxc config set CONTAINERNAME limits.cpu 2
```

#### LXC-Container -- CPU Kerne definieren:

```
lxc config set CONTAINERNAME limits.cpu 0-0
```
```text
* CPU1 = 0-0
* CPU2 = 1-1
* CPU1+CPU2 = 0-1
* CPU3 + CPU4 = 2-3
* Alle Kerne = 0-3
```
#### LXC-Container -- CPU Zeit definieren:

Die CPU-Zeit ist ein Prozentsatz der erlaubten CPU Nutzung. Demnach kann ein Container auf Bsp. 10% CPU-Leistung begrenzt werden oder zusammen mit der Anzahl an Kernen, die erlaubte CPU-Leistung pro definierten Kernen. Bsp. CPU1 und CPU2 jeweils nur 10% CPU-Leistung.

```
lxc config set CONTAINERNAME limits.cpu.allowance 10ms/100ms
```

---

# Bestehenden Container in einen neuen ZFS Storage Pool umziehen

### Neuen ZFS Pool Erstellen:

`lxc storage create POOLNAME zfs size=50GiB`

- Einfach erklärt: <https://discuss.linuxcontainers.org/t/noob-question-how-to-create-additional-storage-loop-file-based-dir-etc/5820/7>
- Offizielle Doku: <https://linuxcontainers.org/lxd/docs/master/storage/#zfs>

### Container in den neuen Storage Pool umziehen:

Option1:

```
lxc move container_name -s new_storage_pool
```

Option2:

```
lxc stop container_name
lxc move container_name temp_container_name -s new_storage_pool
lxc move temp_container_name container_name
lxc start container_name
```

1. lxc stop *container_name*
2. lxc move *container_name* *tempcontainername* -s *newstoragepool*
3. lxc move *tempcontainername* *container_name*
4. lxc start *container_name*

HINWEIS!! Erst nach einem Neustart des Containers ist der neue Pool im Profil enthalten!

```
lxc profile show <profilename>
```

## Storage Pool vergrößern

**Resize a storage pool**

wenn ein Storage Pool zu klein wird, kann der Pool vergrößert werden. Das funktioniert ausschließlich für Storage Pools die mit LXD verwaltet werden. Dies geht nur in eine Richtung und der Pool kann nicht verkleinert werden.

```
lxc storage set <pool_name> size=<new_size>
```

## Storage Pool Informationen anzeigen

**Übersicht:**

```
lxc storage list
```

**Detaillierte Ansicht:**

```
lxc storage show <pool_name>
```

**Welche Container verwenden den Pool:**

```
lxc storage info <pool_name>
```

---

## LXDMOSAIC Mosaic GUI Container Manager

Mit dem LXD-Mosaic Container Manager wird eine grafische Oberfläche als "Webseite" verfügbar gemacht um die LXC Container und VM's zu verwalten und auf den jeweiligen Servern ein oder aus zu schalten.

* **LXD-Mosaic als Snap installieren**

  `sudo snap install lxdmosaic`
* **LXC Hosts hinzufügen**

  Damit Container und VM's zwischen unterschiedlichen LXC-Server hin und her verschoben und kopiert werden können, muss LXD über das Netzwerk erreichbar sein. Folgende Befehle sollten auf allen Hosts ausgeführt werden:

  `lxc config set core.https_address [::] # LXD über IPV4 & IPV6 freigeben`
* **LXC vertrautes Passwort**

  `lxc config set core.trust_password PASSWORT # passwort für LXDMosaic`

  Das vertraute Passwort ist ein Schlüssel der auf allen Hosts vergeben werden muss damit die LXD-Mosaic GUI auf entfernte Hosts zugreifen kann/darf um Container vertrauensvoll auszutauschen. Dies verhält sich ähnlich wie ein SSH-Schlüssel.

---

### Image exportieren

Man kann ein LXC-Image als **.tar.gz** exportieren, die allgemeine Syntax lautet wie folgt:  
`lxc image export <Imagename> <Zielverzeichnis/archivname>`  
beim Namen des Archives braucht keine Endung mitangeben werden.

```
$ lxc image export web01Image /home/rasputin/web01Image
Image exported successfully!
```

Nun finde ich im Zielverzeichnis ein entsprechendes Archiv:

```
$ ls -lh *.gz
-rw-rw-r-- 1 rasputin rasputin 403M Apr 10 17:34 web01Image.tar.gz
```

Dieses Archiv kann man nun bequem auf einem externen Server sichern oder ähnliches.

### Image importieren

Nun können wir das das **.tar.gz** -Archiv auf einem anderen LXC-Host wieder importieren und zwar genauso einfach wie es exportiert wurde.

```
$ lxc image list
+-------+---------------+--------+--------------+------+---------+---------------+
| ALIAS | FINGERABDRUCK | PUBLIC | BESCHREIBUNG | ARCH | GRÖßE | HOCHLADEDATUM |
+-------+---------------+--------+--------------+------+---------+---------------+
$ lxc image import web01Image.tar.gz --alias webImage
Image imported with fingerprint: cc902c84f9539e481350797e6426db6f964866e54993bc41e6784458001a8663
$ lxc image list
+----------+---------------+--------+-------------------------------------------------+--------+----------+------------------------------+
|  ALIAS   | FINGERABDRUCK | PUBLIC |                  BESCHREIBUNG                   |  ARCH  | GRÖßE  |        HOCHLADEDATUM         |
+----------+---------------+--------+-------------------------------------------------+--------+----------+------------------------------+
| webImage | cc902c84f953  | Nein   | ubuntu bionic x86_64 (default) (20180408_03:49) | x86_64 | 402.22MB | Apr 10, 2018 at 3:43pm (UTC) |
+----------+---------------+--------+-------------------------------------------------+--------+----------+------------------------------+
```

Nun kann man aus dem Image wieder seine Container erstellen:

```
$ lxc list
+------+--------+------+------+-----+-----------------+
| NAME | STATUS | IPV4 | IPV6 | TYP | SCHNAPPSCHÜSSE |
+------+--------+------+------+-----+-----------------+
$ lxc launch webImage web02
web02 wird erstellt
web02 wird gestartet
$ lxc list
+-------+---------+-----------------------+-----------------------------------------------+------------+-----------------+
| NAME  | STATUS  |         IPV4          |                     IPV6                      |    TYP     | SCHNAPPSCHÜSSE |
+-------+---------+-----------------------+-----------------------------------------------+------------+-----------------+
| web02 | RUNNING | 10.236.212.117 (eth0) | fd6f:85cd:6e64:efdb:216:3eff:fef8:13c1 (eth0) | PERSISTENT | 0               |
+-------+---------+-----------------------+-----------
```

---

# Useful LXD commands

Summarized from <https://stgraber.org/2016/03/19/lxd-2-0-your-first-lxd-container-312/>.

https://gist.github.com/berndbausch/a6835150c7a26c88048763c0bd739be6

Interestingly, the LXD command line client is named.... `lxc`!

### List available containers

```
lxc image list ubuntu:        # ubuntu: is officially supported image source
lxc image list images:        # images: is an unsupported source
lxc image alias list images:  # lists user-friendly names
```

### List running containers

```
lxc list status=running
```

### List stopped containers

```
lxc list status=stopped
```

### Launch a container

This creates and starts a container.

```
lxc launch ubuntu:14.04 CONTAINERNAME   # image and container names are optional 
lxc launch ubuntu:14.04/armhf armcont   # specific architecture
lxc launch images:alpine/3.3/amd64      # unsupported images: source
```

#### Create container

Without starting it.

```
lxc init images:alpine/3.3/amd64 alpinecont
lxc copy CONTAINER1 CONTAINER2        # clone
lxc delete alpinecont [--force]       # --force if it is running
```

#### Stop container

```
lxc stop CONTAINER
```

#### Start container

```
lxc stop CONTAINER 
```

#### Stop all containers

```
lxc stop --all
```

#### Start/stop after creating it

```
lxc start alpinecont
lxc stop alpinecont [--force]         # --force if it doesn't want to stop
lxc restart alpinecont [--force]
lxc pause alpinecont                  # SIGSTOP to all container processes
```

### List local containers

```
lxc list 
lxc list --columns "nsapt"            # name, status, arch, PID of init, type
lxc list security.privileged=true     # filter for properties
lxc info CONTAINERNAME                # detailed info about one container
```

#### Available columns for the list command

```
    4 - IPv4 address
    6 - IPv6 address
    a - Architecture
    c - Creation date
    n - Name
    p - PID of the container's init process
    P - Profiles
    s - State
    S - Number of snapshots
    t - Type (persistent or ephemeral)
```

### Rename container

```
lxc move CONTAINER NEWNAME
```

or

```
lxc rename CONTAINER NEWNAME
```

### Configuration

Config changes are  effective immediately, even if container is running.

```
export VISUAL=/usr/bin/vim
lxc config edit CONTAINERNAME           # launches editor
lxc config set CONTAINERNAME KEY VALUE  # change a single config item
lxc config device add CONTAINERNAME DEVICE TYPE KEY=VALUE
lxc config show [--expanded] CONTAINERNAME
Configuration settings can be saved as **profiles**.
```

### Enter the container

```
lxc exec CONTAINERNAME -- PROGRAM OPTIONS
lxc exec CONTAINERNAME sh
lxc exec CONATINERNAME --env KEY=VALUE PROGRAM   # environment variable
```

This command runs the program in all the namespaces and cgroups of the container. The program must exist inside the container.

### Access container files

```
lxc file pull CONTAINERNAME/etc/passwd /tmp/mypasswd
lxc file push /tmp/mypasswd CONTAINERNAME/etc/passwd 
lxc file edit CONTAINERNAME/etc/passwd 
```

### Snapshots

```
lxc snapshot CONTAINERNAME SNAPNAME    # SNAPNAME is optional; default name snap*X*
lxc restore CONTAINERNAME SNAPNAME     # resets the container to snapshot
lxc copy CONTAINERNAME/SNAPNAME NEWCONTAINER               # new container from snapshot
lxc delete CONTAINERNAME/SNAPNAME
lxc info CONTAINERNAME                 # lists snapshots among other info
lxc move CONTAINERNAME/SNAPNAME CONTAINERNAME/NEWSNAPNAME  # rename snapshot
```

### Create a container from a snapshot

1. Find snapshot of a container

```
lxc info CONTAINER
```

1. Copy snapshot to new container

```
lxc copy CONTAINER/SNAPSHOT NEW-CONTAINER
```

### Desktop images

In addition to cloud images for a variety of distributions, we also support desktop images that allow you to launch a desktop VM with no additional configuration needed.

For launching an Ubuntu 22.04 VM the command would look like this:

```
lxc launch images:ubuntu/22.04/desktop ubuntu --vm -c limits.cpu=4 -c limits.memory=4GiB --console=vga   
```

The whole process takes seconds, as shown below.

### Ubuntu Desktop VM

```
lxc launch ubuntu:22.04 --vm -c limits.cpu=4 -c limits.memory=4GiB --console=vga
```

### Archlinux Desktop VM

```
lxc launch images:archlinux/desktop-gnome archlinux --vm -c security.secureboot=false -c limits.cpu=4 -c limits.memory=4GiB --console=vga
```

### View/open Desktop VM

The host will need \`remote-viewer\` install to be able to open the console.

```
sudo apt install virt-viewer
```

```
lxc console <VMNAME> --type=vga
```

### Enable clustering

When you do want to enable clustering, simply run

```
lxc cluster enable <CLUSTERNAME>
```

See `lxc cluster` for the rest of the subcommands.

`lxc cluster enable <my-node-name>` turns a non-clustered LXD instance into the first node of a LXD cluster *without losing any data*. Any additional node you want to add to the cluster **must be completely empty** though.
