# Eigene Nextcloud

---

## Schritt für Schritt zur eigenen Nextcloud

du fragst dich, "wie bekomme ich meine eigene private [Nextcloud](https://nextcloud.com/athome) zum laufen"?

Nun dies ist eigentlich **kein** schwieriges Unterfangen. Es hört sich ein bisschen einschüchternd an einen eigenen LINUX Server daheim zu betreiben, aber LINUX ist keineswegs kompliziert... deine eigene [Nextcloud](https://nextcloud.com/athome) ist OpenSource, kostenlos, sicher und völlig DSGVO konform. Du kannst sie für dich selbst, für die Familie oder kleine und mittlere Gruppen (je nach Hardware) zur Verfügung stellen,

Was benötigst du also um deine eigene Nextcloud zu betreiben??

* Einen DSL Anschluss (leider funktioniert das nicht mit einem DSLite Anschluss)
* Zugang zur Benutzeroberfläche deines Routers 
* Einen PC, Notebook oder [**Raspberry Pi**](https://www.raspberrypi.org) als Server.
* Einen Dynamischen-DNS-Dienst (Bsp. <https://desec.io>) damit deine [Nextcloud](https://nextcloud.com/athome) vom Internet erreichbar ist

---

## 1\. Schritt, Installation [Nextcloud-snap](https://snapcraft.io/nextcloud)

Die Entwickler der [Nextcloud](https://nextcloud.com/athome) möchten, dass Ihre Software von so vielen Menschen wie möglich genutzt werden kann und wird. Das ist das Prinzip von OpenSource und freier Software. Daher haben diese [Nextcloud](https://nextcloud.com/athome) Entwickler unterschiedliche Installationsmöglichkeiten geschaffen. Eines dieser Möglichkeiten ist [**Nextcloud-snap**](https://snapcraft.io/nextcloud). Ein "snap" ist *Linux-Sprech* für Software die mit einem einzigen Befehl, fertig konfiguriert mit allen zugehörigen Bestandteilen eingerichtet wird. Das macht es natürlich für alle Administratoren und Benutzer sehr einfach eine [Nextcloud](https://nextcloud.com/athome) zum laufen zu bekommen. Nach der Inbetriebnahme muss sich der Administrator/Benutzer um nichts mehr kümmern. Sogar die Updates werden völlig automatisiert durchgeführt. Das Prinzip ist **Install and Forget**.

## 2\. Schritt, Verbindung zum Server

Nachdem du deinen Server zum laufen gebracht hast, musst du dich darauf verbinden können um Bsp. Software zu installieren und das System zu pflegen. Du bist nämlich jetzt ein **LINUX-System-Administrator**... so einfach geht das.

Um herauszufinden ob und wie dein Server mit deinem Netzwerk verbunden ist, kannst du einfach deinen Router fragen. Wenn du dich an der Benutzeroberfläche deines Routers anmeldest, siehst du in deinem Netzwerk deinen Server und dessen **IP-Adresse**. Jetzt hast du auch die Geleghenheit deinen Router so zu konfigurieren, dass jener Server stets die gleiche IP-Adresse in deinem Netrzwerk erhält.

Anschließend kannst Du dich mit Bsp. [PuTTy](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) oder einem anderen SSH-Client von Windows aus mit dem Gerät verbinden, oder von einem anderen LINUX Rechner aus direkt per [SSH](https://wiki.ubuntuusers.de/SSH/) auf den Server zugreifen.

**SSH Verbindung aufbauen**; (je nach Client unterschiedlich)

* Host/Server: `IP-ADRESSE`
* Benutzer: `BENUTZERNAME`
* Passwort: `PASSWORT`

## 3\. Schritt, Nextcloud installieren

Sobald du mit deinem Server verbunden bist, kannst du mit der Installation der [**Nextcloud-snap**](https://snapcraft.io/nextcloud) fortfahren.

Gebe hierzu in der Kommandozeile (innerhalb der SSH Konsole) deines Servers einfach folgenden Befehl ein:

```
sudo snap install nextcloud
```

Wenn du den Befehl korrekt abgeschrieben hast wird er mit der Eingabetaste bestätigt. Es folgt eine Passwortabfrage. Hier gibst du das Passwort für den Benutzer `BENUTZERNAME` ein. Nach der Eingabe des Passworts fängt der Server an die [Nextcloud-snap ](https://snapcraft.io/nextcloud) Softwarepakete zu installieren. Dies kann unter Umständen ein paar Minuten dauern... meistens ist es aber viel schneller erledigt.

Nach erfolgreicher Installation ist deine [Nextcloud-snap](https://snapcraft.io/nextcloud) in deinem Netzwerk aktiviert. Zum Aufrufen kannst du in einem Browser die Adresse http://*RECHNERNAME.local* oder http://*IP-ADRESSE* eingeben und auf deine Nextcloud zugreifen.

Als erstes wirst du aufgefordert einen *Administrations-Benutzer* mitsamt Passwort anzulegen. Bitte nehme hier auf keinen Fall den Benutzernamen "~~admin~~" oder "~~administrator~~", sondern denk dir einen eigenen Namen für deinen *Cloud-Administrator* aus. Du kannst irgend einen Wunsch-Benutzernamen eintragen! Dieser erste Benutzer wird dann zum *Cloud-Administrator*. Den **Hauptbenutzer** kannst du dann später einrichten. Es ist aber sinnvoll den *Cloud-Administrator* und den **Hauptbenutzer** zu trennen... falls etwas schief läuft.

**HINWEIS**: Schreib dir den Benutzernamen und das Passwort vom *Cloud-Administrator* auf oder Speichere ihn im [Passwortmanager](https://keepassxc.org/). Es wäre echt schade, wenn du alles wieder machen müsstest nur weil du das Passwort vergessen hast. Das ist aber jedem schon mal passiert :-) .

Wenn es tatsächlich schief gelaufen ist, kannst du die Installation der Nextcloud-snap ganz einfach wiederholen.

Hierfür deinstallierst du erst einmal die Nextcloud mit:

```
 sudo snap remove nextcloud 
```

und installierst sie erneut mit:

```
 sudo snap install nextcloud
```

## 4\. Schritt, Router einstellen

Für diesen Schritt muss sich der Benutzer mit seinem Router auseinandersetzen. Es gibt sehr viele Router Hersteller. Prinzipiell jedoch, muss im Router eine Freigabe für ein Gerät (**IP-Adresse** im lokalen Netzwerk) oder Gerätenamen erteilt werden, damit dein Server auf dem deine Nextcloud installiert ist, vom Internet aus erreicht werden kann. Der Server wird also quasi **vor** die **Firewall** gestellt. Um die Sicherheit zu gewährleisten wird empfohlen nur den Port **TCP 80** und **TCP 443** frei zu geben. Das bedeutet, dass nur der Webserver deiner Nextcloud vom Internet erreicht werden kann und somit nur die Nextcloud-Dienste auf verfügbar sind.

Ein Problem das wir alle haben, ist dass sich die **Externe IP-Adresse** nach einem Neustart des Routers ändern könnte. Um das zu umgehen gibt es Dienste, die deine **Externe IP-Adresse** auch nach einem Neustart wiederfinden. Das nennt sich *dynamischer DNS-Dienst*. Ich persönlich verwende \*\*[deSEC ](https://desec.io)\*\*als Dienstleister. [**deSEC**](https://desec.io) ist ein eingetragener gemeinnütziger Verein aus Berlin, der kostenlos ist und der OpenSource Gemeinschaft wohlgesonnen ist. Hier musst du für die Anmeldung nur eine Email-Adresse eintragen und einen *Domain-Wunschnamen* eintragen damit deine Nextcloud unter der Adresse https://*wunschname*.dedyn.io erreicht werden kann. In der Anmelde-Mail erhältst du genaue Anweisungen wie du deinen Router einstellen musst, damit deine **Externe IP-Adresse** mit deinem *Domain-Wunschnamen* verbunden wird.

Um zu testen ob das funktioniert hat, kannst du von einem beliebigen Browser deine **Externe IP-Adresse** (findest du auch im Router) aufrufen oder https://*wunschname*.dedyn.io. Es sollte sich deine Nextcloud melden... aber mit einer Browser-Sicherheitswarnung. Die Browser-Sicherheitswarnung macht dich darauf aufmerksam, dass der Nextcloud-Dienst nicht verschlüsselt ist... das wird im nächsten Schritt erledigt.

## 5\. Schritt, Zertifikat "Let's Encrypt"

Um die Verschlüsselung deiner Nextcloud zu aktivieren musst du auf dem Server, in einer Konsole über SSH folgenden Befehl absetzen:

```
sudo nextcloud.enable-https lets-encrypt
```

Während der folgenden Schlüsselerstellung wirst du aufgefordert deine Email-Adresse einzutragen. Das ist sinnvoll. Ausserdem werden dir einige Fragen gestellt die du möglichst korrekt beantworten solltest.

Anschließend erhältst du eine Bestätigung, dass die Verbindung durch **Let's Encrypt** verschlüsselt ist. Nun kannst du mit einem beliebigen Browser deine Nextcloud mit https://Externe IP-Adresse oder https://*wunschname*.dedyn.io verschlüsselt von überall aus dem Internet aufrufen.

## 6\. Schritt, konfigurieren und Spaß haben
