# Nginx Proxy Manager in LXC

<https://github.com/ej52/proxmox-scripts/tree/main/lxc/nginx-proxy-manager>

Der Vorteil von NGINX im LXC Container ist klar. Einfache Verwaltung und einfache Sicherung sowie Snapshots des laufenden Containers.

Weitestgehend unbekannt ist ein Installationsskript um einen NGINX Proxy Manager in einem neu erstellten LXC Container zu installieren.

Dieses Skript funktioniert laut Entwickler mit *Alpine, Debian and Ubuntu*. 
**HINWEIS**: Paketmanager von *Debian* und *Ubuntu* werden zerschossen… daher ist ALPINE Linux vorzuziehen.

1. Einen Container mit Alpine Linux 3.1.x wird erstellt und aktualisiert
2. Anschließend erhält der Container eine IP-Adresse von DHCP
3. IP-Adresse ind DHCP statisch festlegen, im Router und Port 80 und Port 443 für das Gerät freigeben
4. Anmeldung im Alpine Linux Container mittels LXC-Shell als root
5. Ausführen des u.g. Installationsskript:

   ```
   wget --no-cache -qO - https://raw.githubusercontent.com/ej52/proxmox/main/lxc/nginx-proxy-manager/setup.sh | sh
   
   ```
6. Anschließend wird die Proxy Manager Admin Seite (*IP.DES.SERVERS:**81***) im Browser aufgerufen

   ```
   Benutzername: admin@example.com 
   Passwort: changeme
   
   ```
7. Anschließend erfolgt eine Aufforderung zum Ändern des Benutzernamens und Passwort.

   Es ist empfehlenswert eine tatsächliche Email-Adresse der Domain zu nehmen die verwendet werden soll, Bsp. `benutzer@meine.domain.de`. Dies erleichtert die Erstellung von Zertifikaten im späteren Verlauf.

## NGINX Proxy Manager verwendung

1. Es ist sinnvoll zuerst ein Zertifikat im Reiter *SSL Certificates* anzulegen

![grafik](https://user-images.githubusercontent.com/54933878/203948256-a7d0a63d-a5a8-4317-bc0d-a352237cbd20.png)

3. Anschließend einen neuen *Proxy Host* anlegen

![grafik](https://user-images.githubusercontent.com/54933878/203948648-ce03c4a9-22d5-498c-8a05-82ea62778156.png)

4. Besondere einstellungen des *Proxy Host* werden im Reiter *Advanced* vorgenommen

![grafik](https://user-images.githubusercontent.com/54933878/203949132-10bd621d-2e2d-45d3-8415-73e63f99993c.png)

5. Besondere Einstellung für **Nextcloud** (einfügen, abspeichern)

```
location = /.well-known/carddav {return 301 $scheme://$host:$server_port/remote.php/dav;}
location = /.well-known/caldav {return 301 $scheme://$host:$server_port/remote.php/dav;}
```



