# Nextcloud.snap -- config.php Einstellungen

Folgende Einstellungen sind sinnvoll als Ergänzung für Nextcloud in config.php siehe dazu auch: *Nextcloud.snap -- config.php bearbeiten*

## Skeleton Verzeichnis für Default Dokumente etc.

```
'skeletondirectory' => '/var/snap/nextcloud/common/skeleton',
```

## Standard **default_phone_region**

```
'default_phone_region' => 'DE',
```

## Standard-Sprache einstellen

```
'default_language' => 'de',
```

## Standard Formate einstellen

```
'default_locale' => 'de_DE',
```

## Standard Ordner für 'mit mir geteilte' Dateien

```
'share_folder' => '/SHARE',
```

### oder...

```
'share_folder' => '/Mit mir geteilt',
```