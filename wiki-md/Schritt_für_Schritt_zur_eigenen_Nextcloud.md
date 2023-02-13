# Eigene Nextcloud

---

## Schritt für Schritt zur eigenen Nextcloud

du fragst dich, "wie bekomme ich meine eigene private [Nextcloud](https://nextcloud.com/athome) zum laufen"?

Nun dies ist eigentlich **kein** schwieriges Unterfangen. Es hört sich ein bisschen einschüchternd an, einen eigenen LINUX Server daheim zu betreiben, aber LINUX ist keineswegs kompliziert... deine eigene [Nextcloud](https://nextcloud.com/athome) ist OpenSource, kostenlos, sicher und völlig DSGVO konform. Du kannst sie für dich selbst, für die Familie oder kleine und mittlere Gruppen (je nach Hardware) zur Verfügung stellen,

Was benötigst du also um deine Daten auf deinem eigenen Server in deiner eigenen Cloud umzuziehen?

* Einen DSL Anschluss mit Zugang zum Router (meistens FritzBox oder Telekom)
* Einen [**Raspberry Pi**](https://www.raspberrypi.org) **2, 3B, 3B+, 4** oder **4B** oder einen alten Notebook/PC (64Bit+2GB RAM) je nachdem wie viele Benutzer auf deine [Nextcloud](https://nextcloud.com/athome) zugreifen. Für **1** bis **5** Benutzer reicht ein [Raspberry Pi](https://www.raspberrypi.org) voll aus
* Eine SDHC-Speicherkarte für den [Raspberry Pi](https://www.raspberrypi.org) oder eine Festplatte, SSD, für den Notebook/PC
* Ein Gehäuse und Stromversorgung für den [Raspberry Pi](https://www.raspberrypi.org) oder einen Stromanschluss für dein altes Notebook/PC
* Einen Dynamischen-DNS-Dienst (Bsp. <https://desec.io>) damit deine [Nextcloud](https://nextcloud.com/athome) vom Internet erreichbar ist

---

### Raspberry Pi vs. Notebook/PC

#### [**Raspberry Pi**](https://www.raspberrypi.org)

ich gehe in diesem How-to von einem [**Raspberry Pi**](https://www.raspberrypi.org) **3B** aus. Ich selbst habe einige [Raspberry Pi](https://www.raspberrypi.org)'s im Einsatz. Wegen der Sparsamkeit und ausreichender Leistung habe ich meine [Nextcloud](https://nextcloud.com/athome) für **5 Benutzer** auf einem [Raspberry Pi](https://www.raspberrypi.org) 3B installiert. Hierfür habe ich eine **128GB** SDHC-Speicherkarte im Einsatz. Diese bietet reichlich Platz für Daten. Allerdings reicht auch eine **64GB** SDHC-Speicherkarte völlig aus. **HINWEIS**: Denk daran, dass du ggf. 1 Speicherkarte als Ersatz zur Verfügung haben möchtest.

#### Notebook oder PC

im Prinzip ist dieses How-to genau so für einen alten Notebook oder PC anwendbar. Hier wirst du aber auf dem Rechner ein LINUX installieren müssen. Du kannst [Ubuntu](https://ftp.halifax.rwth-aachen.de/ubuntu-releases/18.04/ubuntu-18.04.4-desktop-amd64.iso), [Xubuntu](http://cdimage.ubuntu.com/xubuntu/releases/18.04/release/xubuntu-18.04.4-desktop-amd64.iso), [MATE ](http://cdimage.ubuntu.com/ubuntu-mate/releases/18.04/release/ubuntu-mate-18.04.4-desktop-amd64.iso)o. ä. Verwenden. Sobald LINUX installiert ist, kannst du mit der [Nextcloud](https://nextcloud.com/athome) Installation wie unten beschrieben fortfahren.

---

## [Nextcloud-snap](https://snapcraft.io/nextcloud)

Die Entwickler der [Nextcloud](https://nextcloud.com/athome) möchten, dass Ihre Software von so vielen Menschen wie möglich genutzt werden kann und wird. Das ist das Prinzip von OpenSource und freier Software. Daher haben diese [Nextcloud](https://nextcloud.com/athome) Entwickler unterschiedliche Installationsmöglichkeiten erschaffen. Eines dieser Möglichkeiten ist [**Nextcloud-snap**](https://snapcraft.io/nextcloud). Ein "snap" ist *Linux-Sprech* für Software die mit einem einzigen Befehl, fertig konfiguriert mit allen zugehörigen Bestandteilen eingerichtet wird. Das macht es natürlich für alle Administratoren und Benutzer sehr einfach eine [Nextcloud](https://nextcloud.com/athome) zum laufen zu bekommen. Nach der Inbetriebnahme muss sich der Administrator/Benutzer um nichts mehr kümmern. Sogar die Updates werden völlig automatisiert durchgeführt. Das Prinzip ist **Install and Forget**.

---

## 1\. Schritt, Raspberry Pi Server starten

Um deinen [Raspberry Pi](https://www.raspberrypi.org) starten zu können, musst du ein Betriebssystem auf eine SDHC-Speicherkarte kopieren. Die SDHC-Speicherkarte funktioniert dann wie eine Festplatte für den [Raspberry Pi](https://www.raspberrypi.org).

Am einfachsten ist es eine fertige Betriebssystem-Kopie... auch "*Image*" genannt, auf eine SDHC-Speicherkarte zu kopieren.

Zunächst steckst du die SDHC-Speicherkarte (meistens mit Adapter) in den Kartenleser deines normalen Notebook/PC und brennst quasi das *Image* auf die SDHC-Speicherkarte. Das *Image* wird mit dem Programm [**Belena-Etcher**](https://www.balena.io/etcher/) auf die SDHC-Speicherkarte kopiert.

Das *Image* gibt es als Datei zum Download. Lade dir die Datei herunter. Anschließend startest du das Programm [**Belena-Etcher**](https://www.balena.io/etcher/) und brennst das *Image* auf die SDHC-Speicherkarte. Das Programm [**Belena-Etcher**](https://www.balena.io/etcher/) führt dich durch die nötigen Schritte.

Anschließend steckst du die fertig gebrannte SDHC-Speicherkarte in deinen [Raspberry Pi](https://www.raspberrypi.org) hinein. Verbinde nun deinen [Raspberry Pi](https://www.raspberrypi.org) mit deinem Netzwerk über ein Netzwerkkabel. Am besten mit einem Netzwerkkabel direkt am Router. Natürlich braucht der [Raspberry Pi](https://www.raspberrypi.org) auch Strom damit er starten kann. Der [Raspberry Pi](https://www.raspberrypi.org) sollte nun erfolgreich starten.

Schon ist dein [Raspberry Pi](https://www.raspberrypi.org) Server installiert.

## 2\. Schritt, Verbindung zum Raspberry Pi Server

Nachdem du deinen [Raspberry Pi](https://www.raspberrypi.org) Server jetzt gestartet hast und zum laufen gebracht hast, musst du dich darauf verbinden um Bsp. den Namen des Servers festzulegen und die Standard Passwörter zu ändern. Du bist nämlich jetzt ein **LINUX-System-Administrator**... so einfach geht das.

Um herauszufinden ob und wie dein [Raspberry Pi](https://www.raspberrypi.org) Server mit deinem Netzwerk verbunden ist, kannst du einfach deinen Router fragen. Wenn du dich an deinem Router anmeldest, siehst du in deinem Netzwerk den [Raspberry Pi](https://www.raspberrypi.org) Server und seine **IP-Adresse**. Diese Daten schreibst du dir am besten auf. Du erkennst den [Raspberry Pi](https://www.raspberrypi.org) Server am Rechnernamen. Die **IP-Adresse** sollte im Router sichtbar sein.

Du kannst dich jetzt mit Bsp. [PuTTy](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) oder einem anderen SSH-Client von Windows aus mit dem Gerät verbinden, oder von einem anderen LINUX Rechner aus direkt per [SSH](https://wiki.ubuntuusers.de/SSH/) auf den [Raspberry Pi](https://www.raspberrypi.org) Server zugreifen.

**SSH Verbindung aufbauen**; (je nach Client unterschidlich)

* Host/Server: `IP-ADRESSE`
* Benutzer: `pi`
* Passwort: `himbeere`

Wer es eher grafisch mag, kann sich mit einem VNC-Client auf die grafische Oberfläche des [Raspberry Pi](https://www.raspberrypi.org) verbinden.

* Host/Server: `IP-ADRESSE`
* Benutzer: `pi`
* Passwort: `himbeere`
* VNC-Passwort=`himbeere`

## 3\. Schritt, Nextcloud installieren

Sobald du mit deinem [Raspberry Pi](https://www.raspberrypi.org) Server verbunden bist, kannst du mit der Installation der [**Nextcloud-snap**](https://snapcraft.io/nextcloud) fortfahren.

Gebe hierzu in der Kommandozeile (innerhalb der SSH Konsole oder per VNC im Terminal) deines [Raspberry Pi](https://www.raspberrypi.org) Servers einfach folgenden Befehl ein:

```
sudo snap install nextcloud
```

Wenn du den Befehl korrekt abgeschrieben hast wird er mit der Eingabetaste bestätigt. Es folgt eine Passwortabfrage. Hier gibst du das Passwort für den Benutzer `pi` ein. Nach der Eingabe des Passworts fängt der Server an die [Nextcloud-snap ](https://snapcraft.io/nextcloud)Softwarepakete zu installieren. Dies kann unter Umständen 15 Minuten dauern... meistens ist es aber viel schneller erledigt.

Nach erfolgreicher Installation ist deine [Nextcloud-snap](https://snapcraft.io/nextcloud) in deinem Netzwerk aktiviert. Zum Testen kannst du in einem Browser die Adresse *RECHNERNAME.local* oder *IP-ADRESSE.local* eingeben und auf deine Nextcloud zugreifen.

Als erstes wirst du aufgefordert einen *Administrations-Benutzer* mitsamt Passwort anzulegen. Bitte nehme hier auf keinen Fall den Benutzernamen "~~admin~~" oder "~~administrator~~", sondern denk dir einen eigenen Namen für deinen *Cloud-Administrator* aus. Du kannst irgend einen Wunsch-Benutzernamen eintragen! Dieser erste Benutzer wird dann zum *Cloud-Administrator*. Den **Hauptbenutzer** kannst du dann später einrichten. Es ist aber sinnvoll den *Cloud-Administrator* und den **Hauptbenutzer** zu trennen... falls etwas schief läuft.

**HINWEIS**: Schreib dir den Benutzernamen und das Passwort vom *Cloud-Administrator* auf oder Speichere ihn im Passwortmanager. Es wäre echt schade, wenn du alles wieder machen müsstest nur weil du das Passwort vergessen hast. Das ist aber jedem schon mal passiert :-) .

Wenn es tatsächlich schief gelaufen ist, kannst du die Installation der Nextcloud-snap ganz einfach wiederholen. Hierfür deinstallierst du erst einmal die Nextcloud mit: `sudo snap remove nextcloud` und installierst sie erneut mit: `sudo snap install nextcloud`.

## 4\. Schritt, Router einstellen

Für diesen Schritt muss sich der Benutzer mit seinem Router auseinandersetzen. Es gibt sehr viele Router Hersteller. Prinzipiell jedoch, muss im Router eine Freigabe für ein Gerät (**IP-Adresse** im lokalen Netzwerk) oder Gerätenamen (Bsp. "**XUBUNTU-PI**") erteilt werden, damit der Raspberry Pi auf dem die Nextcloud installiert ist vom Internet aus erreicht werden kann. Der Raspberry Pi wird also quasi **vor** die **Firewall** gestellt. Um die Sicherheit zu gewährleisten wird empfohlen nur den Port **UDP/TCP 8080** und **UDP/TCP 443** frei zu geben. Das bedeutet, dass nur der Webserver deiner Nextcloud vom Internet erreicht werden kann und somit nur die Nextcloud-Dienste auf deinem Raspberry Pi verfügbar sind.

Ein Problem das wir alle haben, ist dass sich die **Externe IP-Adresse** nach einem Neustart des Routers ändern könnte. Um das zu umgehen gibt es Dienste, die deine **Externe IP-Adresse** auch nach einer Neuvergabe wiederfinden und merken. Das nennt sich *dynamischer DNS-Dienst*. Ich persönlich verwende [**deSEC**](https://desec.io) als Dienstleister. [**deSEC**](https://desec.io) ist ein eingetragener gemeinnütziger Verein aus Berlin, der kostenlos ist und der OpenSource Gemeinschaft wohlgesonnen ist. Hier musst du für die Anmeldung nur eine Email-Adresse eintragen und einen *Domain-Wunschnamen* eintragen damit deine Nextcloud unter der Adresse https://*wunschname*.dedyn.io erreicht werden kann. In der Anmelde-Mail erhältst du genaue Anweisungen wie du deinen Router einstellen musst, damit deine **Externe IP-Adresse** mit deinem *Domain-Wunschnamen* verbunden wird.

Um zu testen ob das funktioniert hat, kannst du von einem beliebigen Browser deine **Externe IP-Adresse** (findest du auch im Router) aufrufen oder https://*wunschname*.dedyn.io. Es sollte sich deine Nextcloud melden... aber mit einer Browser-Sicherheitswarnung. Die Browser-Sicherheitswarnung macht dich darauf aufmerksam, dass der Nextcloud-Dienst nicht verschlüsselt ist... das wird im nächsten Schritt erledigt.

## 5\. Schritt, Zertifikat "Let's Encrypt"

Um die Verschlüsselung deiner Nextcloud zu aktivieren musst du auf dem Raspberry Pi, in einer Konsole über SSH oder per VNC von der Desktopoberfläche folgenden Befehl absetzen:

```
sudo nextcloud.enable-https lets-encrypt
```

Während der folgenden Schlüsselerstellung wirst du aufgefordert deine Email-Adresse einzutragen. Das ist sinnvoll.

Anschließend erhältst du eine Bestätigung, dass die Verbindung durch **Let's Encrypt** verschlüsselt ist. Nun kannst du mit einem beliebigen Browser deine Nextcloud mit https://Externe IP-Adresse oder https://*wunschname*.dedyn.io verschlüsselt von überall aus dem Internet aufrufen.

## 6\. Schritt, konfigurieren und Spaß haben
