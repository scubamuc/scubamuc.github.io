# Nextcloud.snap Befehle / Funktionen

## Datensicherung/Export

Ein Datenexport der Nextcloud.snap Instanz erstellen um auf eine neue Instanz zu importieren:

`$ sudo nextcloud.export`

Das Backup inkl. DB und Apps liegt anschließend in /var/snap/nextcloud/common/backups/yyymmdd-hhmmss Die Sicherung kann anschließend verpackt werden (tar bzw. tar.gz) und abgespeichert werden.

## Datenwiederherstellung/Import

Die exportierten Daten in eine neue Nextcloud.snap Instanz zu importieren: `$ sudo nextcloud.import`

HINWEIS: Ggf. hier den Pfad **/var/snap/nextcloud/common/backups/yyymmdd-hhmmss** zur letzten Sicherung angeben

### Beispiel:

`$ sudo nextcloud.import /var/snap/nextcloud/common/backups/yyymmdd-hhmmss`

## Nextcloud.occ Befehle / Funktionen

Nextcloud.occ Tools und Befehle sind über die Cli mit adminrechten erreichbar.

Eine Nextcloud.occ -- Administration erhält man mit;

```
$ sudo nextcloud.occ list
```

Eine Statusübersicht erhält man mit;

```
$ sudo nextcloud.occ status
```

### Berechtigung

Die meisten nextcloud.occ Befehele erfordern Adminrechte; sudo

```
$ sudo nextcloud.occ
```

### Verfügbare Apps in Nexcloud suchen / Status der Apps feststellen

```
$ nextcloud.occ app:list
Enabled:
  - accessibility: 1.1.0
  - activity: 2.8.2
  - calendar: 1.6.4
  - cloud_federation_api: 0.1.0
  - comments: 1.5.0
  - dav: 1.8.1
  - federatedfilesharing: 1.5.0
  - federation: 1.5.0
[..]
```

### Apps aktivieren oder deaktivieren:

```
$ nextcloud.occ app:disable appname
$ nextcloud.occ app:enable appname
```

### Apps aktualisieren:

```
$ nextcloud.occ app:update appname
```

### Alle Apps aktualisieren:

```
$ nextcloud.occ app:update --all
spreed new version available: 5.0.3
spreed updated
```

### Benutzer Passwort zurücksetzen

```
$ nextcloud.occ user:resetpassword USERNAME
Enter a new password: 
Confirm the new password: 
Successfully reset password for USERNAME
```

### Benutzer hinzufügen

```
$ nextcloud.occ user:add USERNAME
```

### Andere Beispiele; HINWEIS ":"

```
$ nextcloud.occ app:list
$ nextcloud.occ user:add
$ nextcloud.occ maintenance:repair
```

### Nextcloud Status abfragen

```
$ nextcloud.occ status
  - installed: true
  - version: 15.0.7.0
  - versionstring: 15.0.7
  - edition:
```

### Nextcloud reparieren

```
sudo nextcloud.occ maintenance:repair
```