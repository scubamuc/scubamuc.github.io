# Nginx Proxy Manager in LXC

<https://github.com/ej52/proxmox-scripts/tree/main/lxc/nginx-proxy-manager>

<https://github.com/ej52/proxmox-scripts/blob/main/lxc/nginx-proxy-manager/README.md>

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

   Es ist empfehlenswert eine tatsächliche Email-Adresse der Domain zu nehmen die verwendet werden soll, Bsp. `benutzer@meine.domain.de`. Dies erleichter die Erstellung von Zertifikaten im späteren Verlauf.

## Installationsskript

```
wget --no-cache -qO - https://raw.githubusercontent.com/ej52/proxmox/main/lxc/nginx-proxy-manager/setup.sh | sh
```

---
