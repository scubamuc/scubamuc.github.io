# Enable LetsEncrypt Nextcloud-snap

Enable LetsEncrypt for Nextcloud-Snap:

```
sudo nextcloud.enable-https lets-encrypt
```

Enter mailaddress and domain/subdomain

# Self signed certificate

Enable self signed certificate:

```
sudo /snap/bin/nextcloud.enable-https self-signed
```

## Check renew service

Renew service `renew-certs.service` is automated in Nextcloud-snap.

Check renewal by issuing:

```
sudo journalctl -u snap.nextcloud.renew-certs.service
```

**HINWEIS**: Wenn Nextcloud-snap hinter einem Reverse-Proxy ist, kann es zu Problemen bei der Zertifikatserneuerung kommen. **Workaround:** den Reverse-Proxy umgehen und ggf. direkten Zugriff auf die Cloud ermöglichen.

## Log

View letsencrypt log in Netxtcloud-snap:

```
sudo less /var/snap/nextcloud/current/certs/certbot/logs/letsencrypt.log
```
----
# Disable LetsEncrypt Nextcloud-snap

Disable LetsEncrypt for Nextcloud-Snap:

```
sudo nextcloud.disable-https lets-encrypt
```
## Disable Nextcloud-snap service

`sudo snap stop --disable $SERVICE`

Example:

`sudo snap stop --disable nextcloud.renew-certs`

# Change Nextcloud Lets Encrypt Domain

1. Disable Lets Encrypt
2. Remove all current Certificates
3. Get new Certificates

* **disable HTTPS** (this just removes a symlink, it doesn’t remove any certs):

```
$ sudo nextcloud.disable-https
```

* **remove all/any certificates** that are there (this includes self-signed certs, Let’s Encrypt certs, everything). Make sure you get this command right, you don’t want to delete anything else in the current/ dir:

```
$ sudo rm -rf /var/snap/nextcloud/current/certs
```

* pretend you’re **enabling HTTPS** for the first time, using only the domains you want:

```
$ sudo nextcloud.enable-https lets-encrypt
```

---

### View lets Encrypt logs:

```
$ sudo journalctl -u snap.nextcloud.renew-certs
```
